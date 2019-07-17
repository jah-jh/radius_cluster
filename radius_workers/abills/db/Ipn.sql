CREATE TABLE IF NOT EXISTS `ipn_club_comps` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL DEFAULT '0',
  `ip` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` VARCHAR(17) NOT NULL DEFAULT '',
  `number` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ip` (`ip`),
  UNIQUE KEY `number` (`number`)
)
  COMMENT = 'Ipn club comps';

CREATE TABLE IF NOT EXISTS `ipn_log` (
  `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `start` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stop` DATETIME NOT NULL,
  `traffic_class` SMALLINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `traffic_in` BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
  `traffic_out` BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
  `nas_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `ip` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `interval_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `sum` DOUBLE(15, 6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `session_id` CHAR(20) NOT NULL DEFAULT '',
  KEY `uid_traffic_class` (`uid`, `traffic_class`),
  KEY `uid` (`uid`),
  KEY `session_id` (`session_id`)
)
  COMMENT = 'Ipn log traffic class';


CREATE TABLE IF NOT EXISTS `ipn_traf_detail` (
  `src_addr` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `dst_addr` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `src_port` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `dst_port` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `protocol` TINYINT(3) UNSIGNED DEFAULT '0',
  `size` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `s_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `f_time` DATETIME NOT NULL,
  `nas_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0'
)
  COMMENT = 'Ipn detail log traffic class';


CREATE TABLE IF NOT EXISTS `traffic_prepaid_sum` (
  `started` DATE NOT NULL,
  `uid` INTEGER(11) UNSIGNED NOT NULL DEFAULT '0',
  `traffic_class` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `traffic_in` BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
  `traffic_out` BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
  KEY `uid` (`uid`, `started`, `traffic_class`)
)
  COMMENT = 'Prepaid traffic summary';


CREATE TABLE IF NOT EXISTS `ipn_unknow_ips` (
  `src_ip` INTEGER(11) UNSIGNED NOT NULL DEFAULT '0',
  `dst_ip` INTEGER(11) UNSIGNED NOT NULL,
  `size` INTEGER(11) UNSIGNED NOT NULL,
  `nas_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
  COMMENT = 'Ipn unknow ips';
