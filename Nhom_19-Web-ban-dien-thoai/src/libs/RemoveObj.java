package libs;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RemoveObj {
    public static boolean remove(String table, String primaryK, String value) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        StringBuilder str;
        try {
            str = new StringBuilder("delete from ");
            str.append(table);
            str.append(" ").append("where").append(" ");
            str.append(primaryK).append("=?");
            sql = String.valueOf(str);
            pst = DBConnection.getConnection().prepareStatement(sql);
            if (primaryK.equals("masanpham")) {
                pst.setInt(1, Integer.parseInt(value));
            } else {
                pst.setString(1, value);
            }
            pst.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }
}
