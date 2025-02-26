<?php

$percent = 16;

$user = getuserparam(getparam('address'));
if(!$user) return;

$algo = getparam('algo');
if(empty($algo)) $algo = user()->getState('yaamp-algo');
$factor = yaamp_algo_mBTC_factor($algo);
$target = yaamp_hashrate_constant($algo);

$algo_unit = 'Mh';
if ($factor == 0.001) $algo_unit = 'Kh';
if ($factor == 1000) $algo_unit = 'Gh';
if ($factor == 1000000) $algo_unit = 'Th';
if ($factor == 1000000000) $algo_unit = 'Ph';

$step = 15*60;
$t = time() - 24*60*60;

$stats = getdbolist('db_hashuser', "time>$t and algo=:algo and userid=$user->id order by time", array(':algo'=>$algo));
$averages = array();

$charttitle = $algo.' Hashrate ('.$algo_unit.'/s)';

echo '[[[';

for($i = $t+$step, $j = 0; $i < time(); $i += $step)
{
	if($i != $t+$step) echo ',';
	$m = 0;

	if($i + $step >= time())
	{
		$m = round((yaamp_user_rate($user->id, $algo)/1000000) / $factor, 3);
	//	debuglog("last $m");
	}

	else if(isset($stats[$j]) && $i > $stats[$j]->time)
	{
		$m = round(($stats[$j]->hashrate/1000000) / $factor, 3);
		$j++;
	}

	$d = date('Y-m-d H:i:s', $i);
	echo "[\"$d\",$m]";

	$averages[] = array($d, $m);
}

echo '],[';

$average = $averages[0][1];
foreach($averages as $i=>$n)
{
	if($i) echo ',';

	$average = ($average*(100-$percent) + $n[1]*$percent) / 100;
	$m = round($average, 3);

	echo "[\"{$n[0]}\",$m]";
}

echo '],[';

for($i = $t+$step, $j = 0; $i < time(); $i += $step)
{
	if($i != $t+$step) echo ',';
	$m = 0;

	if($i + $step >= time())
	{
		$m = round(yaamp_user_rate_bad($user->id, $algo)/1000000, 3);
	//	debuglog("last $m");
	}

	else if(isset($stats[$j]) && $i > $stats[$j]->time)
	{
		$m = round($stats[$j]->hashrate_bad/1000000, 3);
		$j++;
	}

	$d = date('Y-m-d H:i:s', $i);
	echo "[\"$d\",$m]";
}

echo ']],"'.$charttitle.'"]';

