#categories business
#aurthor - LanYi

#prepare commands to improve performence
use project1_main; #the working db
set foreign_key_checks = 0;
set unique_checks = 0;

create table if not exists food(
	id char(22),
    primary key (id)
);
create table if not exists shopping(
	id char(22),
    primary key (id)
);
create table if not exists services(
	id char(22),
    primary key (id)
);
create table if not exists nightlife(
	id char(22),
    primary key (id)
);
create table if not exists health(
	id char(22),
    primary key (id)
);
create table if not exists beauty(
	id char(22),
    primary key (id)
);
create table if not exists education(
	id char(22),
    primary key (id)
);

#parse business categories
insert into food
	select id from business
    where business.categories like "%Food%" or business.categories like "%Restaurants%";
insert into shopping
	select id from business
	where business.categories like "%shopping%";
insert into services
	select id from business
    where business.categories like "%services%";
insert into nightlife
	select id from business
    where business.categories like "%nightlife%" or 
    business.categories like "%club%" or business.categories like "%bar%";
insert into health
	select id from business
    where business.categories like "%health%" ;
insert into beauty
	select id from business
    where business.categories like "%beauty%";
insert into education
	select id from business
    where business.categories like "%education%";

SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;