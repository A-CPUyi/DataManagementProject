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
#ignored: "review_count","is_open","attributes"{json object},"categories"{string},"hours"{json object}}
create table if not exists user(
	user_id char(50),
    user_name varchar(80),
    review_count int,
    fans_count int,
    friends_list_str text,
    primary key (user_id)
);
alter table user disable keys;

#parse json into column
#automatically generated code to oversee progress
-- insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
-- 	select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count', jsonData->'$.fans'
-- 	from user_json_temp;

insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 0 and id < 5845;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 5845 and id < 13471;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 13471 and id < 27535;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 27535 and id < 54081;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 54081 and id < 121864;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 121864 and id < 168755;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 168755 and id < 179454;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 179454 and id < 199250;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 199250 and id < 255713;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 255713 and id < 330173;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 330173 and id < 340777;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 340777 and id < 361604;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 361604 and id < 417688;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 417688 and id < 494439;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 494439 and id < 506508;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 506508 and id < 531618;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 531618 and id < 598198;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 598198 and id < 660850;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 660850 and id < 675304;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 675304 and id < 712440;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 712440 and id < 805248;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 805248 and id < 829015;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 829015 and id < 849124;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 849124 and id < 904173;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 904173 and id < 986222;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 986222 and id < 1000327;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1000327 and id < 1034848;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1034848 and id < 1126627;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1126627 and id < 1156604;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1156604 and id < 1179142;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1179142 and id < 1241580;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1241580 and id < 1315527;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1315527 and id < 1332370;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1332370 and id < 1382240;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1382240 and id < 1475138;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1475138 and id < 1489524;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1489524 and id < 1527266;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1527266 and id < 1620539;
insert into user (user_id, user_name, review_count, fans_count, friends_list_str)
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',
        jsonData->'$.fans', jsonData->'$.frineds'
        from user_json_temp where id >= 1620539 and id <= 1637138;

#don't drop the json table now, frend table will reuse it
ALTER TABLE Business ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;