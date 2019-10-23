create table business_location_1
	(primary key (address, postal_code, name))
    select id, address, city, state, postal_code, name from business_location where id not in
    (select id from business_location where id <> 'bvOCy8DkgijF9gKgASKV_Q' group by name, address, postal_code having count(name) > 1) and id <> 'bvOCy8DkgijF9gKgASKV_Q';
