package libs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SumObj {
    public static double totalSum(String table, String colum) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        StringBuilder str;
        try {
            str = new StringBuilder("select sum(").append(colum).append(")").append(" from ").append(table);
            sql = String.valueOf(str);
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            rs.first();
            return rs.getDouble(1);
        } catch (SQLException | ClassNotFoundException e) {
            return 0;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }

    }
}
