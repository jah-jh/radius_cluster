CREATE TABLE IF NOT EXISTS `ring_rules` (
  `id` SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `name` CHAR(40) NOT NULL DEFAULT '',
  `date_start` DATE NOT NULL DEFAULT '0000-00-00',
  `date_end` DATE NOT NULL DEFAULT '0000-00-00',
  `time_start` TIME NOT NULL DEFAULT '00:00:00',
  `time_end` TIME NOT NULL DEFAULT '00:00:00',
  `every_month` SMALLINT(1) NOT NULL DEFAULT 0,
  `file` CHAR(40) NOT NULL DEFAULT '',
  `message` TEXT NULL,
  `comment` TEXT NULL,
  UNIQUE (`id`)
)
  COMMENT = 'Rules for autocall redial';

CREATE TABLE IF NOT EXISTS `ring_users_filters` (
  `uid` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `r_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `time` TIME NOT NULL DEFAULT '00:00:00',
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  `status` TINYINT(1) NOT NULL DEFAULT 0,
  UNIQUE (`uid`, `r_id`),
  FOREIGN KEY (`r_id`) REFERENCES `ring_rules` (`id`) ON DELETE CASCADE
)
  COMMENT = 'Users filters';