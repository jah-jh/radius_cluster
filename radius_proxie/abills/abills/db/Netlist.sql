CREATE TABLE IF NOT EXISTS `netlist_groups` (
  `id` SMALLINT(6) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL DEFAULT '',
  `comments` CHAR(250) NOT NULL DEFAULT '',
  `parent_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE `id` (`id`),
  UNIQUE `name` (`name`)
)
  COMMENT = 'Netlist groups';

CREATE TABLE IF NOT EXISTS `netlist_ips` (
  `ip_id` INT(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ip` INT(11) UNSIGNED NOT NULL DEFAULT 0,
  `ipv6` VARBINARY(16) NOT NULL DEFAULT 0,
  `mac` VARCHAR(17) NOT NULL DEFAULT '0',
  `mac_auto_detect` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `gid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `netmask` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `ipv6_prefix` INT(3) NOT NULL DEFAULT 0,
  `hostname` VARCHAR(50) NOT NULL DEFAULT '',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `comments` TEXT NOT NULL,
  `date` DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP,
  `aid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `descr` VARCHAR(200) NOT NULL DEFAULT '',
  `machine_type` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `location` VARCHAR(100) NOT NULL DEFAULT '',
  UNIQUE `_key_ip_ipv6` (`ip`, `ipv6`)
)
  COMMENT = 'Netlist ips';