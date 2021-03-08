package website.dao;

import MODEL.TinTuc;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {
    public static List<TinTuc> loadTinTuc() throws SQLException {
        List<TinTuc> dstt;
        PreparedStatement pst = null;
        ResultSet rs = null;
        TinTuc tinTuc;
        String sql;
        try {
            dstt = new ArrayList<>();
            sql = "select * from tintuc";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                tinTuc = new TinTuc();
                dstt.add(tinTuc.addNews(tinTuc, rs));
            }
            return dstt;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }
}
