SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `prefix_aks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `teilnehmer` varchar(50) DEFAULT NULL,
  `ankunft` int(32) DEFAULT NULL,
  `galaxy` int(2) DEFAULT NULL,
  `system` int(4) DEFAULT NULL,
  `planet` int(2) DEFAULT NULL,
  `planet_type` tinyint(1) DEFAULT NULL,
  `eingeladen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_alliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ally_name` varchar(50) DEFAULT '',
  `ally_tag` varchar(20) DEFAULT '',
  `ally_owner` int(11) NOT NULL DEFAULT '0',
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_description` text,
  `ally_web` varchar(255) DEFAULT '',
  `ally_text` text,
  `ally_image` varchar(255) DEFAULT '',
  `ally_request` varchar(1000) DEFAULT NULL,
  `ally_request_waiting` varchar(500) DEFAULT NULL,
  `ally_request_notallow` enum('0','1') NOT NULL DEFAULT '0',
  `ally_owner_range` varchar(32) DEFAULT '',
  `ally_ranks` text,
  `ally_members` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_stats` enum('0','1') NOT NULL DEFAULT '1',
  `ally_diplo` enum('0','1') NOT NULL DEFAULT '1',
  `ally_universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ally_tag` (`ally_tag`),
  KEY `ally_name` (`ally_name`),
  KEY `ally_universe` (`ally_universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `who` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(500) NOT NULL,
  `who2` varchar(64) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `longer` int(11) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `universe` tinyint(3) unsigned NOT NULL,
  KEY `ID` (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `prefix_buddy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `text` varchar(255) DEFAULT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_chat` (
  `messageid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `ally_id` int(11) NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `timestamp` (`timestamp`),
  KEY `ally_id` (`ally_id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_config`(  
  `uni` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(8) NOT NULL,
  `users_amount` int(11) NOT NULL,
  `game_speed` int(11) NOT NULL,
  `fleet_speed` int(11) NOT NULL,
  `resource_multiplier` int(11) NOT NULL,
  `halt_speed` int(11) NOT NULL,
  `Fleet_Cdr` int(11) NOT NULL,
  `Defs_Cdr` int(11) NOT NULL,
  `initial_fields` int(11) NOT NULL,
  `bgm_active` int(11) NOT NULL,
  `bgm_file` varchar(100) NOT NULL,
  `game_name` varchar(30) NOT NULL,
  `game_disable` int(11) NOT NULL,
  `close_reason` text NOT NULL,
  `metal_basic_income` int(11) NOT NULL,
  `crystal_basic_income` int(11) NOT NULL,
  `deuterium_basic_income` int(11) NOT NULL,
  `energy_basic_income` int(11) NOT NULL,
  `LastSettedGalaxyPos` int(11) NOT NULL,
  `LastSettedSystemPos` int(11) NOT NULL,
  `LastSettedPlanetPos` int(11) NOT NULL,
  `noobprotection` int(11) NOT NULL,
  `noobprotectiontime` int(11) NOT NULL,
  `noobprotectionmulti` int(11) NOT NULL,
  `forum_url` varchar(40) NOT NULL,
  `adm_attack` int(11) NOT NULL,
  `debug` int(11) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `stat` int(11) NOT NULL,
  `stat_level` int(11) NOT NULL,
  `stat_last_update` int(11) NOT NULL,
  `stat_settings` int(11) NOT NULL,
  `stat_update_time` int(11) NOT NULL,
  `stat_last_db_update` int(11) NOT NULL,
  `stats_fly_lock` int(11) NOT NULL,
  `stat_last_banner_update` int(11) NOT NULL,
  `stat_banner_update_time` int(11) NOT NULL,
  `cron_lock` int(11) NOT NULL,
  `ts_modon` int(11) NOT NULL,
  `ts_server` varchar(15) NOT NULL,
  `ts_tcpport` int(11) NOT NULL,
  `ts_udpport` int(11) NOT NULL,
  `ts_timeout` int(11) NOT NULL,
  `ts_version` int(11) NOT NULL,
  `ts_cron_last` int(11) NOT NULL,
  `ts_cron_interval` int(11) NOT NULL,
  `ts_login` varchar(32) NOT NULL,
  `ts_password` varchar(32) NOT NULL,
  `reg_closed` int(11) NOT NULL,
  `OverviewNewsFrame` int(11) NOT NULL,
  `OverviewNewsText` text NOT NULL,
  `capaktiv` int(11) NOT NULL,
  `cappublic` varchar(42) NOT NULL,
  `capprivate` varchar(42) NOT NULL,
  `min_build_time` int(11) NOT NULL,
  `smtp_host` varchar(32) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(32) NOT NULL,
  `smtp_pass` varchar(32) NOT NULL,
  `smtp_ssl` enum('', 'ssl', 'tls') NOT NULL,
  `smtp_sendmail` varchar(32) NOT NULL,
  `user_valid` int(11) NOT NULL,
  `ftp_server` varchar(32) NOT NULL,
  `ftp_user_name` varchar(32) NOT NULL,
  `ftp_user_pass` varchar(32) NOT NULL,
  `ftp_root_path` varchar(32) NOT NULL,
  `fb_on` int(11) NOT NULL,
  `fb_apikey` varchar(42) NOT NULL,
  `fb_skey` varchar(42) NOT NULL,
  `ga_active` varchar(42) NOT NULL,
  `ga_key` varchar(42) NOT NULL,
  `moduls` varchar(100) NOT NULL,
  `trade_allowed_ships` varchar(50) NOT NULL,
  `trade_charge` varchar(5) NOT NULL,
  PRIMARY KEY (`uni`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `prefix_config` (`uni`, `VERSION`, `users_amount`, `game_speed`, `fleet_speed`, `resource_multiplier`, `halt_speed`, `Fleet_Cdr`, `Defs_Cdr`, `initial_fields`, `bgm_active`, `bgm_file`, `game_name`, `game_disable`, `close_reason`, `metal_basic_income`, `crystal_basic_income`, `deuterium_basic_income`, `energy_basic_income`, `LastSettedGalaxyPos`, `LastSettedSystemPos`, `LastSettedPlanetPos`, `noobprotection`, `noobprotectiontime`, `noobprotectionmulti`, `forum_url`, `adm_attack`, `debug`, `lang`, `stat`, `stat_level`, `stat_last_update`, `stat_settings`, `stat_update_time`, `stat_last_db_update`, `stats_fly_lock`, `stat_last_banner_update`, `stat_banner_update_time`, `cron_lock`, `ts_modon`, `ts_server`, `ts_tcpport`, `ts_udpport`, `ts_timeout`, `ts_version`, `reg_closed`, `OverviewNewsFrame`, `OverviewNewsText`, `capaktiv`, `cappublic`, `capprivate`, `min_build_time`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_ssl`, `smtp_sendmail`, `user_valid`, `ftp_server`, `ftp_user_name`, `ftp_user_pass`, `ftp_root_path`, `fb_on`, `fb_apikey`, `fb_skey`, `ga_active`, `ga_key`, `moduls`, `trade_allowed_ships`, `trade_charge`) VALUES
(1, '1.0.1447', 1, 2500, 2500, 1, 1, 30, 30, 163, 0, '', '2Moons', 1, 'Game ist zurzeit geschlossen', 20, 10, 0, 0, 1, 1, 1, 0, 0, 0, 'http://www.xnova.de', 1, 0, 'de', 0, 2, 1288527583, 1000, 25, 1288860107, 0, 1288860107, 1440, 0, 0, '127.0.0.1', 8767, 51234, 1, 2, 0, 1, 'Herzlich Willkommen bei 2Moons v1.3!', 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '0', '', '1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1', '221,222,223,224,225,226,227,228', '0.7');

CREATE TABLE IF NOT EXISTS `prefix_diplo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_1` int(11) NOT NULL,
  `owner_2` int(11) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `accept` tinyint(1) NOT NULL,
  `accept_text` varchar(255) NOT NULL,
  `universe` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_1` (`owner_1`,`owner_2`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_fleets` (
  `fleet_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `fleet_owner` int(11) NOT NULL DEFAULT '0',
  `fleet_mission` enum('1','2','3','4','5','6','7','8','9','10','11','15') NOT NULL DEFAULT '3',
  `fleet_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_array` text,
  `fleet_universe` tinyint(3) unsigned NOT NULL,
  `fleet_start_time` int(11) NOT NULL DEFAULT '0',
  `fleet_start_id` int(11) unsigned NOT NULL,
  `fleet_start_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_start_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `fleet_end_time` int(11) NOT NULL DEFAULT '0',
  `fleet_end_stay` int(11) NOT NULL DEFAULT '0',
  `fleet_end_id` int(11) unsigned NOT NULL,
  `fleet_end_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_end_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `fleet_target_obj` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_metal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_crystal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_deuterium` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_darkmatter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_target_owner` int(11) NOT NULL DEFAULT '0',
  `fleet_group` varchar(15) NOT NULL DEFAULT '0',
  `fleet_mess` enum('0','1','2') NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `fleet_busy` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`fleet_id`),
  KEY `fleet_mess` (`fleet_mess`),
  KEY `fleet_target_owner` (`fleet_target_owner`),
  KEY `fleet_end_stay` (`fleet_end_stay`),
  KEY `fleet_end_time` (`fleet_end_time`),
  KEY `fleet_start_time` (`fleet_start_time`),
  KEY `fleet_start_id` (`fleet_start_id`),
  KEY `fleet_end_id` (`fleet_end_id`),
  KEY `fleet_universe` (`fleet_universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_messages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_owner` int(11) NOT NULL DEFAULT '0',
  `message_sender` int(11) NOT NULL DEFAULT '0',
  `message_time` int(11) NOT NULL DEFAULT '0',
  `message_type` int(11) NOT NULL DEFAULT '0',
  `message_from` varchar(48) DEFAULT NULL,
  `message_subject` varchar(48) DEFAULT NULL,
  `message_text` text,
  `message_unread` enum('0','1') NOT NULL DEFAULT '1',
  `message_universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_owner` (`message_owner`),
  KEY `message_type` (`message_type`),
  KEY `message_sender` (`message_sender`),
  KEY `message_unread` (`message_unread`),
  KEY `message_universe` (`message_universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `priority` enum('0','1','2') DEFAULT '1',
  `title` varchar(32) DEFAULT NULL,
  `text` text,
  `universe` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_planets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'Hauptplanet',
  `id_owner` int(11) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) NOT NULL DEFAULT '0',
  `system` smallint(5) NOT NULL DEFAULT '0',
  `planet` tinyint(3) NOT NULL DEFAULT '0',
  `last_update` int(11) DEFAULT NULL,
  `planet_type` enum('1','3') NOT NULL DEFAULT '1',
  `destruyed` int(11) NOT NULL DEFAULT '0',
  `b_building` int(11) NOT NULL DEFAULT '0',
  `b_building_id` varchar(500) NOT NULL DEFAULT '',
  `b_hangar` int(11) NOT NULL DEFAULT '0',
  `b_hangar_id` varchar(500) NOT NULL DEFAULT '',
  `b_hangar_plus` int(11) NOT NULL DEFAULT '0',
  `image` varchar(32) NOT NULL DEFAULT 'normaltempplanet01',
  `diameter` int(11) NOT NULL DEFAULT '12800',
  `field_current` int(11) NOT NULL DEFAULT '0',
  `field_max` int(11) NOT NULL DEFAULT '163',
  `temp_min` int(3) NOT NULL DEFAULT '-17',
  `temp_max` int(3) NOT NULL DEFAULT '23',
  `metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `metal_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `metal_max` bigint(20) unsigned DEFAULT '100000',
  `crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `crystal_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `crystal_max` bigint(20) unsigned DEFAULT '100000',
  `deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `deuterium_used` int(11) unsigned NOT NULL DEFAULT '0',
  `deuterium_perhour` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `deuterium_max` bigint(20) unsigned DEFAULT '100000',
  `energy_used` int(11) NOT NULL DEFAULT '0',
  `energy_max` bigint(20) NOT NULL DEFAULT '0',
  `metal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_sintetizer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `solar_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fusion_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `robot_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nano_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hangar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laboratory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terraformer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `university` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_deposit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `silo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `small_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `light_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `heavy_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `crusher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battle_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `colonizer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `recycler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `spy_sonde` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bomber_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `solar_satelit` bigint(20) unsigned NOT NULL DEFAULT '0',
  `destructor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dearth_star` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battleship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `supernova` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bahamut` bigint(20) unsigned NOT NULL DEFAULT '0',
  `starcatcher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ifrit` bigint(20) unsigned NOT NULL DEFAULT '0',
  `shiva` bigint(20) unsigned NOT NULL DEFAULT '0',
  `catoblepas` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oxion` bigint(20) unsigned NOT NULL DEFAULT '0',
  `odin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `orbital_station` bigint(20) unsigned NOT NULL DEFAULT '0',
  `misil_launcher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gauss_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ionic_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buster_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `planet_protector` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `big_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `graviton_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `interceptor_misil` int(11) NOT NULL DEFAULT '0',
  `interplanetary_misil` int(11) NOT NULL DEFAULT '0',
  `metal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `crystal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `deuterium_sintetizer_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `fusion_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_satelit_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `mondbasis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `phalanx` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sprungtor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_jump_time` int(11) NOT NULL DEFAULT '0',
  `lune_noir` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ev_transporter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `star_crasher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `giga_recykler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dm_ship` bigint(20) NOT NULL DEFAULT '0',
  `der_metal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `der_crystal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `thriller` bigint(20) unsigned NOT NULL DEFAULT '0',
  `id_luna` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_luna` (`id_luna`),
  KEY `galaxy` (`galaxy`,`system`,`planet`,`planet_type`),
  KEY `id_owner` (`id_owner`),
  KEY `destruyed` (`destruyed`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_rw` (
  `owners` varchar(255) NOT NULL,
  `rid` varchar(72) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_session` (
  `sess_id` varchar(32) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `user_ua` varchar(100) NOT NULL,
  `user_ip` varchar(40) NOT NULL,
  `user_side` varchar(50) NOT NULL,
  `user_method` varchar(4) NOT NULL,
  `user_lastactivity` int(11) NOT NULL,
  PRIMARY KEY (`sess_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`,`user_lastactivity`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_statpoints` (
  `id_owner` int(11) NOT NULL,
  `id_ally` int(11) NOT NULL,
  `stat_type` int(2) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `tech_rank` int(11) NOT NULL,
  `tech_old_rank` int(11) NOT NULL,
  `tech_points` bigint(20) unsigned NOT NULL,
  `tech_count` int(11) NOT NULL,
  `build_rank` int(11) NOT NULL,
  `build_old_rank` int(11) NOT NULL,
  `build_points` bigint(20) unsigned NOT NULL,
  `build_count` int(11) NOT NULL,
  `defs_rank` int(11) NOT NULL,
  `defs_old_rank` int(11) NOT NULL,
  `defs_points` bigint(20) unsigned NOT NULL,
  `defs_count` int(11) NOT NULL,
  `fleet_rank` int(11) NOT NULL,
  `fleet_old_rank` int(11) NOT NULL,
  `fleet_points` bigint(20) unsigned NOT NULL,
  `fleet_count` int(11) NOT NULL,
  `total_rank` int(11) NOT NULL,
  `total_old_rank` int(11) NOT NULL,
  `total_points` bigint(20) unsigned NOT NULL,
  `total_count` int(11) NOT NULL,
  KEY `stat_type` (`stat_type`),
  KEY `id_owner` (`id_owner`),
  KEY `id_owner_2` (`id_owner`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_supp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `text` text NOT NULL,
  `status` int(1) NOT NULL,
  `universe` tinyint(3) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `player_id` (`player_id`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_topkb` (
  `id_owner1` tinyint(20) NOT NULL DEFAULT '0',
  `angreifer` varchar(64) NOT NULL DEFAULT '',
  `id_owner2` tinyint(20) NOT NULL DEFAULT '0',
  `defender` varchar(64) NOT NULL DEFAULT '',
  `gesamtunits` bigint(20) NOT NULL DEFAULT '0',
  `rid` varchar(72) NOT NULL DEFAULT '',
  `fleetresult` varchar(64) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `gesamtunits` (`gesamtunits`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_2` varchar(64) NOT NULL DEFAULT '',
  `lang` enum('de','en','es','ru','pt','cn','hr') NOT NULL DEFAULT 'de',
  `authlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `rights` text NOT NULL,
  `id_planet` int(11) NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_lastip` varchar(40) NOT NULL DEFAULT '',
  `ip_at_reg` varchar(40) NOT NULL DEFAULT '',
  `register_time` int(11) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `dpath` varchar(255) NOT NULL DEFAULT 'styles/skins/gow/',
  `design` tinyint(4) NOT NULL DEFAULT '1',
  `noipcheck` tinyint(4) NOT NULL DEFAULT '1',
  `planet_sort` tinyint(1) NOT NULL DEFAULT '0',
  `planet_sort_order` tinyint(1) NOT NULL DEFAULT '0',
  `spio_anz` tinyint(2) NOT NULL DEFAULT '1',
  `settings_tooltiptime` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `settings_fleetactions` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `settings_planetmenu` enum('0','1') NOT NULL DEFAULT '1',
  `settings_esp` enum('0','1') NOT NULL DEFAULT '1',
  `settings_wri` enum('0','1') NOT NULL DEFAULT '1',
  `settings_bud` enum('0','1') NOT NULL DEFAULT '1',
  `settings_mis` enum('0','1') NOT NULL DEFAULT '1',
  `settings_rep` enum('0','1') NOT NULL DEFAULT '0',
  `settings_tnstor` enum('0','1') NOT NULL DEFAULT '1',
  `settings_gview` enum('0','1') NOT NULL DEFAULT '1',
  `urlaubs_modus` enum('0','1') NOT NULL DEFAULT '0',
  `urlaubs_until` int(11) NOT NULL DEFAULT '0',
  `db_deaktjava` int(11) NOT NULL DEFAULT '0',
  `new_message` int(11) NOT NULL DEFAULT '0',
  `new_gmessage` int(11) NOT NULL DEFAULT '0',
  `fleet_shortcut` text,
  `b_tech_planet` int(11) NOT NULL DEFAULT '0',
  `b_tech` int(11) unsigned NOT NULL DEFAULT '0',
  `b_tech_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `spy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `computer_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `military_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `defence_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shield_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `energy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combustion_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `impulse_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laser_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ionic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buster_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `intergalactic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expedition_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `graviton_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_id` int(11) NOT NULL DEFAULT '0',
  `ally_name` varchar(32) DEFAULT '',
  `ally_request` int(11) NOT NULL DEFAULT '0',
  `ally_request_text` text,
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_rank_id` int(11) NOT NULL DEFAULT '0',
  `rpg_geologue` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rpg_amiral` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_ingenieur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_technocrate` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_espion` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_constructeur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_scientifique` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_commandant` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_stockeur` tinyint(2) NOT NULL DEFAULT '0',
  `darkmatter` int(11) NOT NULL DEFAULT '0',
  `rpg_defenseur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_destructeur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_general` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_bunker` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_raideur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_empereur` tinyint(22) NOT NULL DEFAULT '0',
  `bana` enum('0','1') DEFAULT '0',
  `banaday` int(11) NOT NULL DEFAULT '0',
  `hof` enum('0','1') NOT NULL DEFAULT '1',
  `wons` bigint(20) NOT NULL DEFAULT '0',
  `loos` bigint(20) NOT NULL DEFAULT '0',
  `draws` bigint(20) NOT NULL DEFAULT '0',
  `kbmetal` bigint(20) NOT NULL DEFAULT '0',
  `kbcrystal` bigint(20) NOT NULL DEFAULT '0',
  `lostunits` bigint(20) NOT NULL DEFAULT '0',
  `desunits` bigint(20) NOT NULL DEFAULT '0',
  `uctime` int(11) NOT NULL DEFAULT '0',
  `setmail` int(11) NOT NULL DEFAULT '0',
  `dm_attack` int(11) NOT NULL DEFAULT '0',
  `dm_defensive` int(11) NOT NULL DEFAULT '0',
  `dm_buildtime` int(11) NOT NULL DEFAULT '0',
  `dm_researchtime` int(11) NOT NULL DEFAULT '0',
  `dm_resource` int(11) NOT NULL DEFAULT '0',
  `dm_energie` int(11) NOT NULL DEFAULT '0',
  `dm_fleettime` int(11) NOT NULL DEFAULT '0',
  `fb_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fb_id` (`fb_id`),
  KEY `authlevel` (`authlevel`),
  KEY `onlinetime` (`onlinetime`),
  KEY `dm_fleettime` (`dm_fleettime`),
  KEY `username` (`username`),
  KEY `universe` (`universe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prefix_users_valid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `cle` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `planet` varchar(64) NOT NULL DEFAULT 'Hauptplanet',
  `ip` varchar(16) NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'de',
  `universe` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cle` (`cle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;