# DataManagementProject
This project aims to model the Yelp dataset in an ideal manner. Effective relationships are created to put the database into BCNF form. With the data properly normalized, the accuracy of data is ensured and several complex queries can be run within an easy-to-use Java interface.

Those 9 query scenarios are as follows:

1. List the names of users whose name starts with a given keyword (such as “Phi”) and wrote more than 10 reviews.
2. List  the  names  of  a  given  type  of  businesses  (such  as “restaurant”) located in a given zip code (such as “89109”) and over 50% of the received ratings are higher than 3.
3. List  the  names  of  a  given  type  of  business  (such  as “restaurant”) located in a given zip code (such as “89109”), ordered by their popularity (check-in counts) during a given time period.
4. Given a user (using the primary key or choosing from a  drop-down  list  to  identify  the  user),  list  the  restaurants receiving  more  high  ratings  (4  or  above)  than  low  ratings from  his/her  friends  (3  or  below).   For  example,  suppose John has 5 friends and 3 of them rated a restaurant as 4, 5, 2, respectively.  The restaurant should then be returned.
5. List the unique name pairs of users that had rated the same to a restaurant more than three times. (They are likely to have the same taste).
6. List the user that gives higher average rating on certain type  of  business  (food,  shopping)  than  a  different  type  of business (food, shopping, not the same).  On a given postal code (area).
7. List  the  name  of  users  that  have  recently  (from time range) reviews given type of business in certain type of special location (airport, shopping center, train station).
8. List the business in certain city has rating greater than certain value.
9. Return the difference in ratings between the chain business  and  not-chain  business  on  certain  business  type  and certain location (specify city).

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
