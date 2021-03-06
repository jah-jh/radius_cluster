CREATE TABLE IF NOT EXISTS `extfin_paids` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  `sum` DOUBLE(14, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `comments` VARCHAR(100) NOT NULL DEFAULT '',
  `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `aid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `maccount_id` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0',
  `status_date` DATE NOT NULL DEFAULT '0000-00-00',
  `ext_id` VARCHAR(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
)
  COMMENT = 'Extfin paids list';


CREATE TABLE IF NOT EXISTS `extfin_paids_periodic` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `sum` DOUBLE(14, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  `aid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `comments` VARCHAR(100) NOT NULL DEFAULT '',
  `maccount_id` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
)
  COMMENT = 'Extfin periodic paids';


CREATE TABLE IF NOT EXISTS `extfin_paids_types` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL DEFAULT '',
  `periodic` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
)
  COMMENT = 'Extfin payments types';


CREATE TABLE IF NOT EXISTS `extfin_reports` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `period` VARCHAR(7) NOT NULL DEFAULT '0000-00',
  `sum` DOUBLE(14, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `bill_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `aid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `period` (`period`, `bill_id`)
)
  COMMENT = 'Extfin reports';


CREATE TABLE IF NOT EXISTS `extfin_balance_reports` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `period` VARCHAR(7) NOT NULL DEFAULT '0000-00',
  `sum` DOUBLE(14, 2) NOT NULL DEFAULT '0.00',
  `bill_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `aid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `period` (`period`, `bill_id`)
)
  COMMENT = 'Extfin  users balanse reports';
