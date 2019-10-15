import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Main
 */
public class MyDbUserInterface {
    static Connection dB_connection;
    private static void init() throws SQLException {
        //setSchema dose not work, use this
        dB_connection.setCatalog("project1_main");
        Display display = new ConsoleDisplay();
        display.init();
    }
    public static void main(String[] args) throws SQLException {
        dB_connection = Utility.getConnection();
        if(dB_connection == null){
            System.err.println("failed to connect to database");
            return ;
        }

        init();

        if (!dB_connection.isClosed()) {
            //ask for input business

            //query
            java.sql.Statement stmt = dB_connection.createStatement();
            ResultSet res = stmt.executeQuery("Select * from business limit 100");

            // todo: display results
            List<String> names = new ArrayList<>();
            while (res.next()) {
                String b_name = res.getString("business_name");
                names.add(b_name);
            }
            System.out.println(names);
        }
    }
}