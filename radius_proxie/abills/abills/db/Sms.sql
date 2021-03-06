CREATE TABLE IF NOT EXISTS `sms_log`
(
  `uid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
  `message` CHAR(255) DEFAULT '' NOT NULL,
  `phone` CHAR(12) DEFAULT '' NOT NULL,
  `datetime` DATETIME NOT NULL,
  `status` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
  `ext_id` VARCHAR(20) DEFAULT '' NOT NULL,
  `status_date` DATETIME NOT NULL,
  `ext_status` VARCHAR(20) DEFAULT '' NOT NULL,
  `id` INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sms log';
