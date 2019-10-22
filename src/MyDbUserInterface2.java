import java.sql.Connection;
import java.sql.SQLException;

/**
 * Main
 */
public class MyDbUserInterface2 {
    static Connection dB_connection;
    private static void init() throws SQLException {
        //setSchema dose not work, use this
        dB_connection.setCatalog("project1_main");
        Display display = new GuiDisplay();
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
            Display.getDisplay().displayInterface();
        }
    }
}