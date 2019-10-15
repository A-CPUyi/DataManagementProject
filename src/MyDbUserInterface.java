import java.sql.Connection;
import java.sql.SQLException;

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

        Display.getDisplay().displayInterface();
        if (!dB_connection.isClosed()) {
            //ask for input business
            Query test = new QueryBusinessByCityAndRating();
            String testInpunt[] = {"Toronto", "3.0"};
            test.acceptUserInput(testInpunt);
        }
    }
}