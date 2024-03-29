#prepare commands to improve performence
use test; #the working db
set foreign_key_checks = 0;
set unique_checks = 0;

#create tables (keys disabled
create table if not exists json_temp(
	rowId int auto_increment not null unique,
    jsonData json,
    primary key(rowId)
);

create table if not exists import_test(
	id int,
    Str varchar(100),
    primary key (id)
);
alter table import_test disable keys;

#import json
load data infile "F:\\rawDataSet\\test.json" into table json_temp(jsonData);

#parse json into column
-- update import_test set
--	  import_test.id = (select jsonData->'$.id' from json_temp),
--    import_test.Str = (select jsonData->'$.name' from json_temp);

insert into import_test (id, Str)
select jsonData->'$.id' , jsonData->'$.name' 
from json_temp;

#drop origin json table
drop table json_temp; 
ALTER TABLE import_test ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;

#set up foreign keys
#indexing
