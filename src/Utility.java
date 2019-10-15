import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility
 */
public final class Utility {
    static String userName = "test";
    static String password = "123456";
    static String hostIP = "68.180.87.215";
    static String port = "3306";
    static Connection connect = null;

    public static Connection getConnection() {
        if(connect != null) return connect;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection(String.format("jdbc:mysql://%s:%s/", hostIP, port), userName,
                    password);
        } catch (ClassNotFoundException e) {
            //TODO 反射失效（你妈的这谁会处理）
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO 连接失败， 有空再说
            e.printStackTrace();
        }

        return connect;
    }
}