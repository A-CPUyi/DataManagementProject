CREATE TABLE `project1_main`.`located_in` (
  `business_id` CHAR(22) NOT NULL,
  `location_id` CHAR(22) NULL,
  `location_type` VARCHAR(20) NULL,
  PRIMARY KEY (`business_id`, `location_id`));