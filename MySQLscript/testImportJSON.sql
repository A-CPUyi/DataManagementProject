#does not work
set foreign_key_checks = 0;
#create table

#parse src file 
load data infile "F:\\rawDataSet\\test.json"
    into table test.basic
    fields
		enclosed by '"'
        terminated by ','
	lines
		starting by '{'
        terminated by '}'
#	(@dummy,id,@dummy,Str)