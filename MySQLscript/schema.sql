CREATE TABLE user (
   user_id char(22) NOT NULL,
   user_name varchar(80) DEFAULT NULL,
   PRIMARY KEY (user_id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE friends_with (
   user_id1 char(22) NOT NULL,
   user_id2 char(22) NOT NULL,
   PRIMARY KEY (user_id1,user_id2),
   KEY fk__friends_with__user1_idx (user_id2),
   KEY fk__friends_with__user2_idx (user_id1),
   CONSTRAINT fk__friends_with__user1 FOREIGN KEY (user_id1) REFERENCES user (user_id),
   CONSTRAINT fk__friends_with__user2 FOREIGN KEY (user_id2) REFERENCES user (user_id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE business_chain (
   business_name varchar(100) NOT NULL,
   is_chain bit(1) DEFAULT NULL,
   PRIMARY KEY (business_name)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE business_location (
   id char(22) NOT NULL,
   address varchar(200) NOT NULL,
   postal_code varchar(20) NOT NULL,
   name varchar(100) NOT NULL,
   city varchar(60) NOT NULL,
   state varchar(6) NOT NULL,
   PRIMARY KEY (address,postal_code,name,city,state),
   UNIQUE KEY id_UNIQUE (id),
   KEY id_idx (id),
   KEY fk__business_location__business_chain_idx (name),
   CONSTRAINT fk__business_location__business_chain FOREIGN KEY (name) REFERENCES business_chain (business_name),
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE business (
  id char(22) NOT NULL,
  parking bit(1) DEFAULT NULL,
  good_for_kids bit(1) DEFAULT NULL,
  accepts_credit_cards bit(1) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk__business__business_location FOREIGN KEY (id) REFERENCES business_location (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE business_checkin (
   id char(22) NOT NULL,
   date datetime NOT NULL,
   count int(11) NOT NULL DEFAULT '1',
   PRIMARY KEY (id,date),
   KEY fk__business_checkin__business_location_idx (id),
   CONSTRAINT fk__business_checkin__business_location FOREIGN KEY (id) REFERENCES business_location (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE review (
   business_id char(22) NOT NULL,
   user_id char(22) NOT NULL,
   review_date datetime NOT NULL,
   stars float DEFAULT NULL,
   review_text text,
   PRIMARY KEY (business_id,user_id,review_date),
   KEY USER_CONSTRAIN_idx (user_id),
   KEY fk__review__business_location_idx (business_id),
   KEY fk__review__user_idx (user_id),
   CONSTRAINT fk__review__business_location FOREIGN KEY (business_id) REFERENCES business_location (id),
   CONSTRAINT fk__review__user FOREIGN KEY (user_id) REFERENCES user (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
 /*!50100 PARTITION BY KEY (business_id,user_id)
 PARTITIONS 10 */;
CREATE TABLE located_in (
   business_id char(22) NOT NULL,
   location_id char(22) NOT NULL,
   location_type varchar(20) DEFAULT NULL,
   PRIMARY KEY (business_id,location_id),
   KEY fk__located_in__business_sp_idx (location_id),
   CONSTRAINT fk__located_in__business FOREIGN KEY (business_id) REFERENCES business (id),
   CONSTRAINT fk__located_in__business_sp FOREIGN KEY (location_id) REFERENCES business (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE beauty (
  id char(22) NOT NULL,
  accepts_insurance bit(1) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk__beauty__business FOREIGN KEY (id) REFERENCES business (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE beauty_hair_specializes_in (
  id char(22) NOT NULL,
  hair_specialization varchar(20) NOT NULL,
  value bit(1) NOT NULL,
  PRIMARY KEY (id,hair_specialization),
  CONSTRAINT fk__beauty_hair_specializes_in__beauty FOREIGN KEY (id) REFERENCES beauty (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE food (
   id char(22) NOT NULL,
   delivery bit(1) DEFAULT NULL,
   alcohol varchar(20) DEFAULT NULL,
   reservations bit(1) DEFAULT NULL,
   table_service bit(1) DEFAULT NULL,
   good_for_meal bit(1) DEFAULT NULL,
   good_for_groups bit(1) DEFAULT NULL,
   outdoor_seating bit(1) DEFAULT NULL,
   PRIMARY KEY (id),
   CONSTRAINT fk__food__business FOREIGN KEY (id) REFERENCES business (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE food_ambience (
   id char(22) NOT NULL,
   ambience varchar(20) NOT NULL,
   value bit(1) NOT NULL,
   PRIMARY KEY (id,ambience),
   CONSTRAINT fk__food_ambience_food FOREIGN KEY (id) REFERENCES food (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE services (
   id char(22) NOT NULL,
   PRIMARY KEY (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE shopping (
   id char(22) NOT NULL,
   wheelchair_accessible bit(1) DEFAULT NULL,
   dogs_allowed bit(1) DEFAULT NULL,
   PRIMARY KEY (id)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
