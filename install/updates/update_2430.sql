ALTER TABLE `prefix_statpoints` 
	CHANGE `tech_count` `tech_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	CHANGE `build_count` `build_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	CHANGE `defs_count` `defs_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	CHANGE `fleet_count` `fleet_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	CHANGE `total_count` `total_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0';