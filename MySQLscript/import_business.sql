#import json into table Business
#aurthor - LanYi
#using shell command "mysqlsh --mysqlx username@host:33060/dbname -- util importJson business.json --table=json_temp --tableColumn=jsonData"
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
#ignored: "review_count","is_open","attributes"{json object},"categories"{string},"hours"{json object}}
create table if not exists Business(
	id char(22),
    business_name varchar(100),
    Address varchar(200),
    City text, #there is one extreamly long city name
    State varchar(6),
    postal_code varchar(20),
    latitude float,
    longitude float,
    stars float,
    categories varchar(600),
    primary key (id)
);
alter table Business disable keys;

#parse json into column
insert into Business (id, business_name, Address, City, State, postal_code,
	latitude, longitude, stars, categories)
	select replace(jsonData->'$.business_id', '"',''), replace(jsonData->'$.name', '"',''), jsonData->'$.address',
		jsonData->'$.city', jsonData->'$.state', jsonData->'$.postal_code',
		jsonData->'$.latitude', jsonData->'$.longitude', jsonData->'$.stars',
        replace(jsonData->'$.categories','"','')
	from json_temp;
    


#drop origin json table
#drop table json_temp;
ALTER TABLE Business ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;