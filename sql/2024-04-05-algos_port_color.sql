-- add certain config options to algo table

ALTER TABLE `algos` ADD `color` VARCHAR(32) NOT NULL DEFAULT '#ffffff' AFTER `overflow`;
ALTER TABLE `algos` ADD `speedfactor` DOUBLE NOT NULL DEFAULT '1' AFTER `color`;
ALTER TABLE `algos` ADD `port` INT(10) NOT NULL DEFAULT '3033' AFTER `speedfactor`;
ALTER TABLE `algos` ADD `visible` TINYINT(3) NOT NULL DEFAULT '0' AFTER `port`;
ALTER TABLE `algos` ADD `powlimit_bits` TINYINT(3) NULL DEFAULT NULL AFTER `visible`;

UPDATE `algos` SET `color` = '#aba0e0', `speedfactor` = 1, `port` = 8335, `visible` = 1 WHERE `name` = '0x10';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 8633, `visible` = 1 WHERE `name` = 'a5a';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 3691, `visible` = 1 WHERE `name` = 'aergo';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 1, `port` = 4443, `visible` = 1 WHERE `name` = 'allium';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 1, `port` = 4230, `visible` = 1 WHERE `name` = 'anime';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4234, `visible` = 1 WHERE `name` = 'argon2';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4239, `visible` = 1 WHERE `name` = 'argon2d-dyn';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4241, `visible` = 1 WHERE `name` = 'argon2d16000';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4238, `visible` = 1 WHERE `name` = 'argon2d250';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 4240, `visible` = 1 WHERE `name` = 'argon2d4096';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8640, `visible` = 1 WHERE `name` = 'astralhash';
UPDATE `algos` SET `color` = '#e2e81f', `speedfactor` = 1, `port` = 6434, `visible` = 1 WHERE `name` = 'aurum';
UPDATE `algos` SET `color` = '#e0b0b0', `speedfactor` = 1, `port` = 5100, `visible` = 1 WHERE `name` = 'balloon';
UPDATE `algos` SET `color` = '#e0b0b0', `speedfactor` = 1, `port` = 6433, `visible` = 1 WHERE `name` = 'bastion';
UPDATE `algos` SET `color` = '#ffd880', `speedfactor` = 1, `port` = 3643, `visible` = 1 WHERE `name` = 'bcd';
UPDATE `algos` SET `color` = '#f790c0', `speedfactor` = 1, `port` = 3556, `visible` = 1 WHERE `name` = 'bitcore';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 5733, `visible` = 1 WHERE `name` = 'blake';
UPDATE `algos` SET `color` = '#f2c81f', `speedfactor` = 0.001, `port` = 5766, `visible` = 1 WHERE `name` = 'blake2s';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 5743, `visible` = 1 WHERE `name` = 'blakecoin';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 5787, `visible` = 1 WHERE `name` = 'bmw512';
UPDATE `algos` SET `color` = '#a0a0d0', `speedfactor` = 1, `port` = 3573, `visible` = 1 WHERE `name` = 'c11';
UPDATE `algos` SET `color` = '#a0a0d0', `speedfactor` = 1, `port` = 3574, `visible` = 1 WHERE `name` = 'cosa';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 4250, `visible` = 1 WHERE `name` = 'cpupower';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 3343, `visible` = 1 WHERE `name` = 'curvehash';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 0.001, `port` = 3252, `visible` = 1 WHERE `name` = 'decred';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1, `port` = 8833, `visible` = 1 WHERE `name` = 'dedal';
UPDATE `algos` SET `color` = '#e0ffff', `speedfactor` = 1, `port` = 3535, `visible` = 1 WHERE `name` = 'deep';
UPDATE `algos` SET `color` = '#a0c0f0', `speedfactor` = 1, `port` = 5333, `visible` = 1 WHERE `name` = 'dmd-gr';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 3692, `visible` = 1 WHERE `name` = 'geek';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8650, `visible` = 1 WHERE `name` = 'globalhash';
UPDATE `algos` SET `color` = '#80a0d0', `speedfactor` = 0.001, `port` = 7070, `visible` = 1 WHERE `name` = 'gr';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 5333, `visible` = 1 WHERE `name` = 'groestl';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1000, `port` = 5136, `visible` = 1 WHERE `name` = 'heavyhash';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 5135, `visible` = 1 WHERE `name` = 'hex';
UPDATE `algos` SET `color` = '#ffa0a0', `speedfactor` = 1, `port` = 3747, `visible` = 1 WHERE `name` = 'hmq1725';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 7777, `visible` = 1 WHERE `name` = 'honeycomb';
UPDATE `algos` SET `color` = '#aa70ff', `speedfactor` = 1, `port` = 7433, `visible` = 1 WHERE `name` = 'hsr';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8660, `visible` = 1 WHERE `name` = 'jeonghash';
UPDATE `algos` SET `color` = '#a0d0c0', `speedfactor` = 1, `port` = 4633, `visible` = 1 WHERE `name` = 'jha';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 0.001, `port` = 5133, `visible` = 1 WHERE `name` = 'keccak';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 0.001, `port` = 5134, `visible` = 1 WHERE `name` = 'keccakc';
UPDATE `algos` SET `color` = '#809aef', `speedfactor` = 1, `port` = 5522, `visible` = 1 WHERE `name` = 'lbk3';
UPDATE `algos` SET `color` = '#b0d0e0', `speedfactor` = 0.001, `port` = 3334, `visible` = 1 WHERE `name` = 'lbry';
UPDATE `algos` SET `color` = '#a0c0c0', `speedfactor` = 1, `port` = 5933, `visible` = 1 WHERE `name` = 'luffa';
UPDATE `algos` SET `color` = '#80a0f0', `speedfactor` = 1, `port` = 4433, `visible` = 1 WHERE `name` = 'lyra2';
UPDATE `algos` SET `color` = '#80a0f0', `speedfactor` = 1, `port` = 4434, `visible` = 1 WHERE `name` = 'lyra2TDC';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4533, `visible` = 1 WHERE `name` = 'lyra2v2';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4550, `visible` = 1 WHERE `name` = 'lyra2v3';
UPDATE `algos` SET `color` = '#80c0f0', `speedfactor` = 1, `port` = 4563, `visible` = 1 WHERE `name` = 'lyra2vc0ban';
UPDATE `algos` SET `color` = '#80b0f0', `speedfactor` = 1, `port` = 4553, `visible` = 1 WHERE `name` = 'lyra2z';
UPDATE `algos` SET `color` = '#80b0f0', `speedfactor` = 1, `port` = 4555, `visible` = 1 WHERE `name` = 'lyra2z330';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 6033, `visible` = 1 WHERE `name` = 'm7m';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7066, `visible` = 1 WHERE `name` = 'megabtx';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7067, `visible` = 1 WHERE `name` = 'megamec';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7020, `visible` = 1 WHERE `name` = 'memehash';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 0.001, `port` = 7079, `visible` = 1 WHERE `name` = 'mike';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7018, `visible` = 1 WHERE `name` = 'minotaur';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7019, `visible` = 1 WHERE `name` = 'minotaurx';
UPDATE `algos` SET `color` = '#a0c0f0', `speedfactor` = 1, `port` = 5433, `visible` = 1 WHERE `name` = 'myr-gr';
UPDATE `algos` SET `color` = '#a0d0f0', `speedfactor` = 1, `port` = 4233, `visible` = 1 WHERE `name` = 'neoscrypt';
UPDATE `algos` SET `color` = '#c0e0e0', `speedfactor` = 1, `port` = 3833, `visible` = 1 WHERE `name` = 'nist5';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8670, `visible` = 1 WHERE `name` = 'padihash';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 8680, `visible` = 1 WHERE `name` = 'pawelhash';
UPDATE `algos` SET `color` = '#80c0c0', `speedfactor` = 1, `port` = 5833, `visible` = 1 WHERE `name` = 'penta';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 8333, `visible` = 1 WHERE `name` = 'phi';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 8332, `visible` = 1 WHERE `name` = 'phi2';
UPDATE `algos` SET `color` = '#aba0e0', `speedfactor` = 1, `port` = 8334, `visible` = 1 WHERE `name` = 'phi5';
UPDATE `algos` SET `color` = '#a0a0e0', `speedfactor` = 1, `port` = 9393, `visible` = 1 WHERE `name` = 'pipe';
UPDATE `algos` SET `color` = '#dedefe', `speedfactor` = 1, `port` = 8463, `visible` = 1 WHERE `name` = 'polytimos';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 0.001, `port` = 7445, `visible` = 1 WHERE `name` = 'power2b';
UPDATE `algos` SET `color` = '#c0c0c0', `speedfactor` = 1, `port` = 4033, `visible` = 1 WHERE `name` = 'quark';
UPDATE `algos` SET `color` = '#d0a0f0', `speedfactor` = 1, `port` = 4733, `visible` = 1 WHERE `name` = 'qubit';
UPDATE `algos` SET `color` = '#d0f0a0', `speedfactor` = 1, `port` = 7443, `visible` = 1 WHERE `name` = 'rainforest';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 5252, `visible` = 1 WHERE `name` = 'renesis';
UPDATE `algos` SET `color` = '#c0c0e0', `speedfactor` = 1, `port` = 3433, `visible` = 1 WHERE `name` = 'scrypt';
UPDATE `algos` SET `color` = '#d0d0d0', `speedfactor` = 1, `port` = 4333, `visible` = 1 WHERE `name` = 'scryptn';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 0.001, `port` = 3333, `visible` = 1 WHERE `name` = 'sha256';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 1, `port` = 3340, `visible` = 1 WHERE `name` = 'sha256csm';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 1, `port` = 3338, `visible` = 1 WHERE `name` = 'sha256dt';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 0.001, `port` = 3339, `visible` = 1 WHERE `name` = 'sha256t';
UPDATE `algos` SET `color` = '#d0d0f0', `speedfactor` = 1, `port` = 3335, `visible` = 1 WHERE `name` = 'sha3d';
UPDATE `algos` SET `color` = '#d0d0a0', `speedfactor` = 1000, `port` = 7086, `visible` = 1 WHERE `name` = 'sha512256d';
UPDATE `algos` SET `color` = '#a0a0c0', `speedfactor` = 1, `port` = 5033, `visible` = 1 WHERE `name` = 'sib';
UPDATE `algos` SET `color` = '#80a0a0', `speedfactor` = 1, `port` = 4933, `visible` = 1 WHERE `name` = 'skein';
UPDATE `algos` SET `color` = '#c8a060', `speedfactor` = 1, `port` = 5233, `visible` = 1 WHERE `name` = 'skein2';
UPDATE `algos` SET `color` = '#dedefe', `speedfactor` = 1, `port` = 8433, `visible` = 1 WHERE `name` = 'skunk';
UPDATE `algos` SET `color` = '#d0a0a0', `speedfactor` = 1, `port` = 7091, `visible` = 1 WHERE `name` = 'skydoge';
UPDATE `algos` SET `color` = '#c8a060', `speedfactor` = 1, `port` = 8733, `visible` = 1 WHERE `name` = 'sonoa';
UPDATE `algos` SET `color` = '#f0b0d0', `speedfactor` = 1, `port` = 3555, `visible` = 1 WHERE `name` = 'timetravel';
UPDATE `algos` SET `color` = '#c0d0d0', `speedfactor` = 1, `port` = 8533, `visible` = 1 WHERE `name` = 'tribus';
UPDATE `algos` SET `color` = '#f0f0f0', `speedfactor` = 1000, `port` = 5755, `visible` = 1 WHERE `name` = 'vanilla';
UPDATE `algos` SET `color` = '#ffffff', `speedfactor` = 1, `port` = 5034, `visible` = 1 WHERE `name` = 'veltor';
UPDATE `algos` SET `color` = '#aac0cc', `speedfactor` = 1, `port` = 6133, `visible` = 1 WHERE `name` = 'velvet';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3233, `visible` = 1 WHERE `name` = 'vitalium';
UPDATE `algos` SET `color` = '#d0e0e0', `speedfactor` = 1, `port` = 4133, `visible` = 1 WHERE `name` = 'whirlpool';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3533, `visible` = 1 WHERE `name` = 'x11';
UPDATE `algos` SET `color` = '#c0f0c0', `speedfactor` = 1, `port` = 3553, `visible` = 1 WHERE `name` = 'x11evo';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3534, `visible` = 1 WHERE `name` = 'x11k';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 3536, `visible` = 1 WHERE `name` = 'x11kvs';
UPDATE `algos` SET `color` = '#ffe090', `speedfactor` = 1, `port` = 3233, `visible` = 1 WHERE `name` = 'x12';
UPDATE `algos` SET `color` = '#ffd880', `speedfactor` = 1, `port` = 3633, `visible` = 1 WHERE `name` = 'x13';
UPDATE `algos` SET `color` = '#f0c080', `speedfactor` = 1, `port` = 3933, `visible` = 1 WHERE `name` = 'x14';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3733, `visible` = 1 WHERE `name` = 'x15';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3636, `visible` = 1 WHERE `name` = 'x16r';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 7220, `visible` = 1 WHERE `name` = 'x16rt';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3637, `visible` = 1 WHERE `name` = 'x16rv2';
UPDATE `algos` SET `color` = '#f0b080', `speedfactor` = 1, `port` = 3663, `visible` = 1 WHERE `name` = 'x16s';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3737, `visible` = 1 WHERE `name` = 'x17';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3738, `visible` = 1 WHERE `name` = 'x18';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 4300, `visible` = 1 WHERE `name` = 'x20r';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3323, `visible` = 1 WHERE `name` = 'x21s';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 4200, `visible` = 1 WHERE `name` = 'x22i';
UPDATE `algos` SET `color` = '#f0f0a0', `speedfactor` = 1, `port` = 4210, `visible` = 1 WHERE `name` = 'x25x';
UPDATE `algos` SET `color` = '#f0b0a0', `speedfactor` = 1, `port` = 3739, `visible` = 1 WHERE `name` = 'xevan';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6233, `visible` = 1 WHERE `name` = 'yescrypt';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6333, `visible` = 1 WHERE `name` = 'yescryptR16';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6343, `visible` = 1 WHERE `name` = 'yescryptR32';
UPDATE `algos` SET `color` = '#e0d0e0', `speedfactor` = 1, `port` = 6353, `visible` = 1 WHERE `name` = 'yescryptR8';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6234, `visible` = 1 WHERE `name` = 'yespower';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 0.001, `port` = 6245, `visible` = 1 WHERE `name` = 'yespowerARWN';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6235, `visible` = 1 WHERE `name` = 'yespowerIC';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6240, `visible` = 1 WHERE `name` = 'yespowerIOTS';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6242, `visible` = 1 WHERE `name` = 'yespowerLITB';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6241, `visible` = 1 WHERE `name` = 'yespowerLTNCG';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6244, `visible` = 1 WHERE `name` = 'yespowerMGPC';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6236, `visible` = 1 WHERE `name` = 'yespowerR16';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6237, `visible` = 1 WHERE `name` = 'yespowerRES';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6238, `visible` = 1 WHERE `name` = 'yespowerSUGAR';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6243, `visible` = 1 WHERE `name` = 'yespowerTIDE';
UPDATE `algos` SET `color` = '#e2d0d2', `speedfactor` = 1, `port` = 6239, `visible` = 1 WHERE `name` = 'yespowerURX';
UPDATE `algos` SET `color` = '#d0b0d0', `speedfactor` = 1, `port` = 5533, `visible` = 1 WHERE `name` = 'zr5';
