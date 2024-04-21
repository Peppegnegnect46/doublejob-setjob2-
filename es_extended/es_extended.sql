CREATE DATABASE IF NOT EXISTS `es_extended`;

ALTER DATABASE `es_extended`
	DEFAULT CHARACTER SET UTF8MB4;
	
ALTER DATABASE `es_extended`
	DEFAULT COLLATE UTF8MB4_UNICODE_CI;

USE `es_extended`;

CREATE TABLE `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`metadata` LONGTEXT NULL DEFAULT NULL,
	`position` longtext NULL DEFAULT NULL,
    `job2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'nojob2',
    `job2_grade` int(11) NOT NULL DEFAULT 0,
	PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;

INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `tattoos`) VALUES
('char1:a0a122055d25c1810111bab7bd182013162d3adb', '{\"money\":99855,\"bank\":49750,\"black_money\":0}', 'admin', '[{\"count\":99855,\"name\":\"money\",\"slot\":1},{\"count\":1,\"metadata\":{\"dateofbirth\":\"04/02/2000\",\"name\":\"Osc Osc\"},\"name\":\"id_card\",\"slot\":2},{\"count\":1,\"name\":\"ammo-9\",\"slot\":5}]', 'unemployed', 0, 'nojob2', 0, '[]', '{\"armor\":0,\"health\":200}', '{\"y\":-1494.5933837890626,\"z\":3.145751953125,\"x\":-771.5604248046875}', 'Osc', 'Osc', '04/02/2000', 'm', 150, '{\"nose_3\":5,\"lipstick_1\":0,\"bracelets_2\":0,\"cheeks_1\":2,\"eyebrows_6\":0,\"dad\":29,\"makeup_4\":0,\"nose_4\":8,\"beard_3\":0,\"hair_1\":76,\"bracelets_1\":-1,\"age_2\":0,\"sun_1\":0,\"arms_2\":0,\"bproof_2\":0,\"decals_2\":0,\"bags_2\":0,\"beard_2\":10,\"chain_2\":2,\"lip_thickness\":-2,\"mom\":43,\"chest_1\":0,\"age_1\":0,\"cheeks_3\":6,\"tshirt_1\":4,\"blush_1\":0,\"watches_1\":-1,\"eye_color\":0,\"ears_1\":-1,\"helmet_1\":-1,\"bodyb_2\":0,\"face_md_weight\":61,\"nose_6\":0,\"hair_color_1\":61,\"makeup_1\":0,\"blush_2\":0,\"bodyb_3\":-1,\"lipstick_2\":0,\"eye_squint\":0,\"torso_1\":23,\"makeup_2\":0,\"eyebrows_2\":0,\"moles_2\":0,\"chain_1\":22,\"chin_3\":0,\"tshirt_2\":2,\"beard_4\":0,\"skin_md_weight\":27,\"eyebrows_5\":0,\"beard_1\":11,\"shoes_2\":2,\"jaw_1\":0,\"torso_2\":2,\"eyebrows_3\":0,\"neck_thickness\":0,\"eyebrows_4\":0,\"jaw_2\":0,\"sun_2\":0,\"pants_1\":28,\"moles_1\":0,\"mask_2\":0,\"bodyb_1\":-1,\"bags_1\":0,\"eyebrows_1\":0,\"lipstick_3\":0,\"shoes_1\":70,\"decals_1\":0,\"chin_4\":0,\"helmet_2\":0,\"hair_color_2\":29,\"chin_1\":0,\"hair_2\":0,\"mask_1\":0,\"nose_2\":6,\"complexion_1\":0,\"blemishes_1\":0,\"chest_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"nose_1\":-5,\"bproof_1\":0,\"complexion_2\":0,\"ears_2\":0,\"sex\":0,\"makeup_3\":0,\"arms\":1,\"glasses_1\":0,\"watches_2\":0,\"chin_13\":0,\"blemishes_2\":0,\"glasses_2\":0,\"pants_2\":3,\"nose_5\":10,\"cheeks_2\":-10,\"chest_2\":0,\"chin_2\":0,\"lipstick_4\":0}', '[{\"name\":\"hunger\",\"val\":978300,\"percent\":97.83},{\"name\":\"thirst\",\"val\":983725,\"percent\":98.3725}]', 0, 14, 0, NULL, '2023-12-18 01:59:12', '2023-12-18 02:03:05', NULL, NULL, NULL);

CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

CREATE TABLE `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

INSERT INTO `jobs` VALUES ('unemployed','Unemployed');

CREATE TABLE `jobs2` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs2` (`name`, `label`) VALUES
('nojob2', 'NoGang');

CREATE TABLE `job2_grades` (
  `id` int(11) NOT NULL,
  `job2_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT 0,
  `skin_male` longtext DEFAULT '{}',
  `skin_female` longtext DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `job2_grades` (`id`, `job2_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'nojob2', 0, 'nojob2', 'Sans job2', 0, '{}', '{}');

