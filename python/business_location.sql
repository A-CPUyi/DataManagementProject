CREATE TABLE `project1_main`.`business_location` (
  `id` CHAR(22) NOT NULL,
  `address` VARCHAR(200) NULL,
  `city` TEXT NULL,
  `state` VARCHAR(6) NULL,
  `postal_code` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));

INSERT INTO project1_main.business_location
    SELECT id, Address, City, State, postal_code
    FROM project1_main.business;