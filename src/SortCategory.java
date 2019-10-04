import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

/**
 * Main
 */
public class Main {
    static Connection connect = null;

    public static void main(String[] args) {

        // todo: should be user input
        String userName = "test";
        String password = "123456";
        String hostIP = "68.180.87.215";
        String port = "3306";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection(String.format("jdbc:mysql://%s:%s/", hostIP, port), userName,
                    password);
            if (!connect.isClosed()) {

                //setSchema dose not work, use this
                connect.setCatalog("project1_main");
                java.sql.Statement stmt = connect.createStatement();
                ResultSet res = stmt.executeQuery("Select * from business");

                HashMap<String, Integer> attrbute_count_map = new HashMap<>();
                // todo: print results
                while (res.next()) {
                    String rawStrCategories = res.getString("categories");
                    String[] items = rawStrCategories.split(", ");
                    for (String str : items) {
                        if (attrbute_count_map.putIfAbsent(str, 1) == null)
                            ;
                        else {
                            attrbute_count_map.compute(str, (k, v) -> v = v.intValue() + 1);
                        }
                    }
                }
                List<Entry<String, Integer>> resultList = new ArrayList<>(attrbute_count_map.entrySet());
                // .forEach((e) -> resultList.add(e));
                Collections.sort(resultList, (i, j) -> {
                    return j.getValue() - i.getValue();
                });

                try {
                    FileWriter fw = new FileWriter("F:\\codeRepo\\java\\BigDataProj1\\output.txt");
                    resultList.forEach((i) -> {
                        try {
                            fw.write(i.toString() + "\n");
                        } catch (IOException e1) {
                            // TODO Auto-generated catch block
                            e1.printStackTrace();
                        }
                    });
                    fw.close();    
                   }
                catch(Exception e){System.out.println(e);}
                System.out.println("Success...");  

                System.out.println();
            }
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("VendorError: " + e.getErrorCode());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("hello world");
    }
}