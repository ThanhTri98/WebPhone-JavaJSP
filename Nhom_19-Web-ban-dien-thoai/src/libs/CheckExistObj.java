package libs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckExistObj {
    public static boolean checkExist(String table, String primaryK, String value) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        StringBuilder str;
        try {
            str = new StringBuilder("select * from ");
            str.append(table).append(" where ");
            str.append(primaryK).append("=?");
            sql = String.valueOf(str);
            pst = DBConnection.getConnection().prepareStatement(sql);
                pst.setString(1, value);
            rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }
}
