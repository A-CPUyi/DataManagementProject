create table postal_codes
	(primary key (postal_code))
    select postal_code, city, state from business_location_1
    where city <> "" and state <> "\"\""
    group by postal_code;