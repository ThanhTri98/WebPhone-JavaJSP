package libs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectAll {

    public static ResultSet selectAllFromTable(String table) throws ClassNotFoundException {
        try {
            String sql = "select * from "+table;
            PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }
}
