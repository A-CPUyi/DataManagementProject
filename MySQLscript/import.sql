set @test_file_path = "F:\\rawDataSet\\demo\\test.json";
set foreign_key_checks = 0;
--create table

--parse src file 
load data infile @test_file_path
    into table test.basic
    