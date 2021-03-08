package libs;

import java.sql.*;

public class DBConnection {
    private static Connection connect = null;

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if (connect == null || connect.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            String userName = "root";
            String password = "";
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm_mobiles?useUnicode=true&characterEncoding=utf-8", userName, password);
            return connect;
        } else {
            return connect;
        }
    }
}
