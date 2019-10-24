# DataManagementProject
*project description here

## Prerequisites
- A running JDK version at least 8.0
- If you installed the JDBC MySQL connector(Jconnector) version at least 5.0 on your local machine
  - If the JRE has right path variable to your connector, this code should compile and run
  - If JRE don't know where to search for Jconnector by default, compile with a correct class path
- If you don't hava a Jconnector  
  The `lib` folder contains a working version of Jconnector, download it and compile and run with the following commands

## Run The User Interface
The user Interface is an User friendly GUI features with some query scenario we designed  
- Get the code  
git clone https://github.com/A-CPUyi/DataManagementProject.git  
- To compile the source code  
javac -classpath "src\;lib\mysql-connector-java-8.0.17.jar" -encoding "UTF-8" .\src\MyDbUserInterface.java  
- To run the code  
java -classpath "src;lib\mysql-connector-java-8.0.17.jar" MyDbUserInterface 

## GUI Features
*someone plz write this part

## Scripts for loading and normalizing the dataset
The scripts for loading the dataset into mysql server is located under `./MySQLscript`  
These scripts simply takes the .json document in the database and turn it into a proper table
with each field in the original file having a column in the generated table.

The `./pyhton` folder contains scripts for normalizing the tables obtained through the import scripts.  
_someone add more detail to this?_
