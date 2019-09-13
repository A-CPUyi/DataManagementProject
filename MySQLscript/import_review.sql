#import json into table Business
#aurthor - LanYi
#using shell command "mysqlsh --mysqlx username@host:33060/dbname -- util importJson review.json --table=json_temp --tableColumn=jsonData"
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
#duplicate items known in this set
create table if not exists review(
	review_id char(50),
	business_id char(50),
    user_id char(50),
    review_date datetime,
    stars float,
    review_text text,
    primary key (review_id)
)
partition by key(review_id)
	partitions 10;

#parse json into column
#the select range are automatically generated to show result once in a while
-- insert into review (review_id, business_id, user_id, review_date, stars, review_text)
-- 	select jsonData->'$.review_id' , jsonData->'$.business_id', jsonData->'$.user_id',
-- 		jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
-- 	from json_temp;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 0 and id < 81175;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 81175 and id < 161650;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 161650 and id < 241941;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 241941 and id < 322463;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 322463 and id < 403235;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 403235 and id < 483183;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 483183 and id < 563022;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 563022 and id < 640057;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 640057 and id < 720683;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 720683 and id < 801087;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 801087 and id < 881378;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 881378 and id < 961791;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 961791 and id < 1042159;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1042159 and id < 1122182;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1122182 and id < 1201874;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1201874 and id < 1278840;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1278840 and id < 1357116;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1357116 and id < 1437632;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1437632 and id < 1517624;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1517624 and id < 1597782;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1597782 and id < 1677928;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1677928 and id < 1757992;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1757992 and id < 1837531;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1837531 and id < 1916566;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1916566 and id < 1993707;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 1993707 and id < 2074108;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2074108 and id < 2154385;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2154385 and id < 2234684;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2234684 and id < 2315351;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2315351 and id < 2395709;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2395709 and id < 2475429;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2475429 and id < 2555149;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2555149 and id < 2632022;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2632022 and id < 2710390;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2710390 and id < 2790434;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2790434 and id < 2870047;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2870047 and id < 2949704;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 2949704 and id < 3029554;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3029554 and id < 3109101;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3109101 and id < 3188334;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3188334 and id < 3265576;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3265576 and id < 3342517;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3342517 and id < 3423121;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3423121 and id < 3503625;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3503625 and id < 3583608;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3583608 and id < 3664248;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3664248 and id < 3744506;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3744506 and id < 3824306;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3824306 and id < 3903333;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3903333 and id < 3979665;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 3979665 and id < 4059744;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4059744 and id < 4140433;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4140433 and id < 4221440;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4221440 and id < 4302097;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4302097 and id < 4383018;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4383018 and id < 4463092;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4463092 and id < 4543215;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4543215 and id < 4620829;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4620829 and id < 4699396;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4699396 and id < 4779862;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4779862 and id < 4860026;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4860026 and id < 4940004;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 4940004 and id < 5020121;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5020121 and id < 5100041;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5100041 and id < 5179711;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5179711 and id < 5258120;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5258120 and id < 5334901;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5334901 and id < 5414434;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5414434 and id < 5494312;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5494312 and id < 5573778;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5573778 and id < 5653304;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5653304 and id < 5732627;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5732627 and id < 5811563;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5811563 and id < 5890246;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5890246 and id < 5966709;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 5966709 and id < 6044029;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6044029 and id < 6124392;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6124392 and id < 6204677;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6204677 and id < 6285122;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6285122 and id < 6365518;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6365518 and id < 6445455;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6445455 and id < 6525070;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6525070 and id < 6603587;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6603587 and id < 6680652;
insert into review (review_id, business_id, user_id, review_date, stars, review_text)
    select jsonData->'$.review_id', jsonData->'$.business_id', jsonData->'$.user_id',
    jsonData->'$.date', jsonData->'$.stars', jsonData->'$.text'
    from json_temp where id >= 6680652 and id <= 6685900;
     
#drop origin json table
drop table json_temp;
ALTER TABLE review ENABLE KEYS;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;