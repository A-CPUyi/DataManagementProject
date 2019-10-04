CREATE TABLE `project1_main`.`friends_with` (
  `user_id1` CHAR(22) NOT NULL,
  `user_id2` CHAR(22) NOT NULL,
  PRIMARY KEY (`user_id1`, `user_id2`));