delete from business where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from beauty where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from food where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from shopping where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from services where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from food_ambience where id in (select id from business_location_legacy where id not in (select id from business_location));
delete from located_in where business_id in (select id from business_location_legacy where id not in (select id from business_location));
