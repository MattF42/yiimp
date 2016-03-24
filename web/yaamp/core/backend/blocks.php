<?php

function BackendBlockNew($coin, $db_block)
{
//	debuglog("NEW BLOCK $coin->name $db_block->height");
	$reward = $db_block->amount;
	if(!$reward || $db_block->algo == 'PoS' || $db_block->algo == 'MN') return;
	if($db_block->category == 'stake' || $db_block->category == 'generated') return;

	$sqlCond = "valid = 1";
	if(!YAAMP_ALLOW_EXCHANGE) // only one coin mined
		$sqlCond .= " AND coinid = ".intval($coin->id);

	$total_hash_power = dboscalar("SELECT SUM(difficulty) FROM shares WHERE $sqlCond AND algo=:algo", array(':algo'=>$coin->algo));
	if(!$total_hash_power) return;

	$list = dbolist("SELECT userid, SUM(difficulty) AS total FROM shares WHERE $sqlCond AND algo=:algo GROUP BY userid",
			array(':algo'=>$coin->algo));

	foreach($list as $item)
	{
		$hash_power = $item['total'];
		if(!$hash_power) continue;

		$user = getdbo('db_accounts', $item['userid']);
		if(!$user) continue;

		$amount = $reward * $hash_power / $total_hash_power;
		if(!$user->no_fees) $amount = take_yaamp_fee($amount, $coin->algo);

		$earning = new db_earnings;
		$earning->userid = $user->id;
		$earning->coinid = $coin->id;
		$earning->blockid = $db_block->id;
		$earning->create_time = $db_block->time;
		$earning->amount = $amount;
		$earning->price = $coin->price;

		if($db_block->category == 'generate')
		{
			$earning->mature_time = time();
			$earning->status = 1;
		}
		else	// immature
			$earning->status = 0;

		if (!$earning->save())
			debuglog(__FUNCTION__.": Unable to insert earning!");

		$user->last_login = time();
		$user->save();
	}

	$delay = time() - 5*60;
	$sqlCond = "time < $delay";
	if(!YAAMP_ALLOW_EXCHANGE) // only one coin mined
		$sqlCond .= " AND coinid = ".intval($coin->id);

	dborun("DELETE FROM shares WHERE algo=:algo AND $sqlCond",
		array(':algo'=>$coin->algo));
}

/////////////////////////////////////////////////////////////////////////////////////////////////

function BackendBlockFind1($coinid = NULL)
{
	$sqlFilter = $coinid ? " AND coin_id=".intval($coinid) : '';

//	debuglog(__METHOD__);
	$list = getdbolist('db_blocks', "category='new' $sqlFilter ORDER BY time");
	foreach($list as $db_block)
	{
		$coin = getdbo('db_coins', $db_block->coin_id);
		if(!$coin->enable) continue;

		$db_block->category = 'orphan';
		$remote = new Bitcoin($coin->rpcuser, $coin->rpcpasswd, $coin->rpchost, $coin->rpcport);

		$block = $remote->getblock($db_block->blockhash);
		$block_age = time() - $db_block->time;
		if($coin->symbol == 'DCR' && $block_age < 2000) {
			// DCR generated blocks need some time to be accepted by the network (gettransaction)
			if (!$block) continue;
			$txid = $block['tx'][0];
			$tx = $remote->gettransaction($txid);
			if (!$tx || !isset($tx['details'])) continue;
			debuglog("{$coin->symbol} {$db_block->height} confirmed after ".$block_age." seconds");
		}
		else if(!$block || !isset($block['tx']) || !isset($block['tx'][0]))
		{
			$db_block->amount = 0;
			$db_block->save();
			debuglog("{$coin->symbol} orphan {$db_block->height} after ".(time() - $db_block->time)." seconds");
			continue;
		}
		else if ($coin->rpcencoding == 'POS' && arraySafeVal($block,'nonce') == 0) {
			$db_block->category = 'stake';
			$db_block->save();
			continue;
		}

		$tx = $remote->gettransaction($block['tx'][0]);
		if(!$tx || !isset($tx['details']) || !isset($tx['details'][0]))
		{
			$db_block->amount = 0;
			$db_block->save();
			continue;
		}


		$db_block->txhash = $block['tx'][0];
		$db_block->category = 'immature';						//$tx['details'][0]['category'];
		$db_block->amount = $tx['details'][0]['amount'];
		$db_block->confirmations = $tx['confirmations'];
		$db_block->price = $coin->price;
		if (!$db_block->save())
			debuglog(__FUNCTION__.": unable to insert block!");

		if($db_block->category != 'orphan')
			BackendBlockNew($coin, $db_block);
	}
}

/////////////////////////////////////////////////////////////////////////////////

function BackendBlocksUpdate($coinid = NULL)
{
//	debuglog(__METHOD__);
	$t1 = microtime(true);

	$sqlFilter = $coinid ? " AND coin_id=".intval($coinid) : '';

	$list = getdbolist('db_blocks', "category IN ('immature','stake') $sqlFilter ORDER BY time");
	foreach($list as $block)
	{
		$coin = getdbo('db_coins', $block->coin_id);
		if(!$block->coin_id || !$coin) {
			$block->delete();
			continue;
		}

		$remote = new Bitcoin($coin->rpcuser, $coin->rpcpasswd, $coin->rpchost, $coin->rpcport);
		if(empty($block->txhash))
		{
			$blockext = $remote->getblock($block->blockhash);

			if ($coin->rpcencoding == 'POS' && arraySafeVal($blockext,'nonce') == 0) {
				$block->category = 'stake';
				$block->save();
			}

			if(!$blockext || !isset($blockext['tx'][0])) continue;

			$block->txhash = $blockext['tx'][0];
		}

		$tx = $remote->gettransaction($block->txhash);
		if(!$tx) continue;

		$block->confirmations = $tx['confirmations'];

		$category = $block->category;
		if($block->confirmations == -1) {
			$category = 'orphan';
			$block->amount = 0;
		}

		else if(isset($tx['details']) && isset($tx['details'][0]))
			$category = $tx['details'][0]['category'];

		else if(isset($tx['category']))
			$category = $tx['category'];

		// PoS blocks
		if ($block->category == 'stake') {
			if ($category == 'generate') {
				$block->category = 'generated';
			} else if ($category == 'orphan') {
				$block->category = 'orphan';
			}
			$block->save();
			continue;
		}

		// PoW blocks
		$block->category = $category;
		$block->save();

		if($category == 'generate')
			dborun("update earnings set status=1, mature_time=UNIX_TIMESTAMP() where blockid=$block->id");

		else if($category != 'immature')
			dborun("delete from earnings where blockid=$block->id");
	}

	$d1 = microtime(true) - $t1;
	controller()->memcache->add_monitoring_function(__METHOD__, $d1);
}

////////////////////////////////////////////////////////////////////////////////////////////

function BackendBlockFind2($coinid = NULL)
{
	$sqlFilter = $coinid ? "id=".intval($coinid) : 'enable=1';

	$coins = getdbolist('db_coins', $sqlFilter);
	foreach($coins as $coin)
	{
		if($coin->symbol == 'BTC') continue;
		$remote = new Bitcoin($coin->rpcuser, $coin->rpcpasswd, $coin->rpchost, $coin->rpcport);

		$mostrecent = 0;
		if(empty($coin->lastblock)) $coin->lastblock = '';
		$list = $remote->listsinceblock($coin->lastblock);
		if(!$list) continue;

//		debuglog("find2 $coin->symbol");
		foreach($list['transactions'] as $transaction)
		{
			if(!isset($transaction['blockhash'])) continue;
			if($transaction['time'] > time() - 5*60) continue;

			if($transaction['time'] > $mostrecent)
			{
				$coin->lastblock = $transaction['blockhash'];
				$mostrecent = $transaction['time'];
			}

			if($transaction['time'] < time() - 60*60) continue;
			if($transaction['category'] != 'generate' && $transaction['category'] != 'immature') continue;

			$blockext = $remote->getblock($transaction['blockhash']);
			if(!$blockext) continue;

			$db_block = getdbosql('db_blocks', "coin_id=:id AND (blockhash=:hash OR height=:height)",
				array(':id'=>$coin->id, ':hash'=>$transaction['blockhash'], ':height'=>$blockext['height'])
			);
			if($db_block) continue;

			if ($coin->symbol == 'DCR')
				debuglog("{$coin->name} generated block {$blockext['height']} detected!");

			$db_block = new db_blocks;
			$db_block->blockhash = $transaction['blockhash'];
			$db_block->coin_id = $coin->id;
			$db_block->category = 'immature';			//$transaction['category'];
			$db_block->time = $transaction['time'];
			$db_block->amount = $transaction['amount'];
			$db_block->algo = $coin->algo;

			if (arraySafeVal($blockext,'nonce',0) != 0) {
				$db_block->difficulty_user = hash_to_difficulty($coin, $transaction['blockhash']);
			} else if ($coin->rpcencoding == 'POS') {
				$db_block->category = 'stake';
			}

			// masternode earnings...
			if ($transaction['amount'] == 0 && $transaction['generated']) {
				$db_block->algo = 'MN';
				$tx = $remote->getrawtransaction($transaction['txid'], 1);

				// assume the MN amount is in the last vout record (should check "addresses")
				if (isset($tx['vout']) && !empty($tx['vout'])) {
					$vout = end($tx['vout']);
					$db_block->amount = $vout['value'];
					debuglog("MN ".bitcoinvaluetoa($db_block->amount).' '.$coin->symbol.' ('.$blockext['height'].')');
				}

				if (!$coin->hasmasternodes) {
					$coin->hasmasternodes = true;
					$coin->save();
				}
			}

			$db_block->confirmations = $transaction['confirmations'];
			$db_block->height = $blockext['height'];
			$db_block->difficulty = $blockext['difficulty'];
			$db_block->price = $coin->price;
			if (!$db_block->save())
				debuglog(__FUNCTION__.": unable to insert block!");

			BackendBlockNew($coin, $db_block);
		}

		$coin->save();
	}
}

function MonitorBTC()
{
//	debuglog(__FUNCTION__);

	$coin = getdbosql('db_coins', "symbol='BTC'");
	if(!$coin) return;

	$remote = new Bitcoin($coin->rpcuser, $coin->rpcpasswd, $coin->rpchost, $coin->rpcport);
	if(!$remote) return;

	$mostrecent = 0;
	if($coin->lastblock == null) $coin->lastblock = '';
	$list = $remote->listsinceblock($coin->lastblock);
	if(!$list) return;

	$coin->lastblock = $list['lastblock'];
	$coin->save();

	foreach($list['transactions'] as $transaction)
	{
		if(!isset($transaction['blockhash'])) continue;
		if($transaction['confirmations'] == 0) continue;
		if($transaction['category'] != 'send') continue;
		//if($transaction['fee'] != -0.0001) continue;

		debuglog(__FUNCTION__);
		debuglog($transaction);

		$txurl = "https://blockchain.info/tx/{$transaction['txid']}";

		$b = mail(YAAMP_ADMIN_EMAIL, "withdraw {$transaction['amount']}",
			"<a href='$txurl'>{$transaction['address']}</a>");

		if(!$b) debuglog('error sending email');
	}
}

