#import json into table Checkin
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
create table if not exists Checkin(
	business_id char(22),
    dates longtext,
    primary key (business_id)
);
alter table Checkin disable keys;

#parse json into column
insert into Checkin (business_id, dates)
	select replace(jsonData->'$.business_id', '"',''), 
        replace(jsonData->'$.date','"','')
	from json_temp;
    


#drop origin json table
drop table json_temp;
ALTER TABLE Checkin ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;