import java.sql.Connection;
import java.sql.SQLException;

/**
 * Main
 */
public class MyDbUserInterface {
    enum DisplayType{
        Console, GUI, Default;
    }

    static Connection dB_connection;
    static final DisplayType DISPLAY_TYPE = DisplayType.GUI;
    private static void init() throws SQLException {
        //setSchema dose not work, use this
        dB_connection.setCatalog("project1_main");
        switch (DISPLAY_TYPE) {
            case GUI:
                new GuiDisplay().init();
                break;
            case Console:
            default:
                new ConsoleDisplay().init();
                break;
        }
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