package admin.dao;

import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardDAO {
    public static double selectSum(String table, String column) {
        double sum = 0;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select sum(" + column + ") as 'Sum' from " + table;
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                sum = rs.getDouble("Sum");
            }
            return sum;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        } finally {
            try {
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static int selectCount(String table) {
        int count = 0;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select count('*') as 'Count' from " + table;
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Count");
            }
            return count;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        } finally {
            try {
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
