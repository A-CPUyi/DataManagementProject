#import json into table Business
#aurthor - LanYi
#using shell command "mysqlsh --mysqlx username@host:33060/dbname -- util importJson user.json --table=user_json_temp --tableColumn=jsonData"
#to import the json into database. It yields the same result as the following script:
# create table if not exists json_temp(
# 	rowId int auto_increment not null unique,
#    jsonData json,
#    primary key(rowId)
# );
# load data infile "path/to/file.json" into table json_temp(jsonData);
#but gives better performence

#prepare commands to improve performence
use project1_main; #the working db
set foreign_key_checks = 0;
set unique_checks = 0;

#create table (keys disabled
create table if not exists user(
	user_id_master char(50),
    user_id_slave varchar(50),
    primary key (user_id_master, user_id_slave)
);
alter table user disable keys;

#parse json into column
-- insert into user (user_id, user_name, review_count, fans_count)
-- 	select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count', jsonData->'$.fans'
-- 	from user_json_temp;
DELIMITER nianna
CREATE PROCEDURE parse_friend()
BEGIN

END nianna

drop table user_json_temp;
ALTER TABLE Business ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;