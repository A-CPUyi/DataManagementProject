-- ALTER TABLE `project1_main`.`beauty` 
-- ADD COLUMN `HairSpecializesIn` VARCHAR(45) NULL AFTER `accepts_insurance`;

select business.id, business.attributes -> '$.HairSpecialiseIn' from business where business.id = beauty.id