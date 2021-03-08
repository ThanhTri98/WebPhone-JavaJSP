package website.dao;

import MODEL.SanPham;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
    public static SanPham getProductID(int msp) throws ClassNotFoundException {
        String sql = "select * from sanpham where trangthai>0 and masanpham=?";
        try {
            PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, msp);
            ResultSet rs = pst.executeQuery();
            rs.first();
            SanPham sp = new SanPham();
            sp.setMaSanPham(rs.getInt("masanpham"));
            sp.setTenSanPham(rs.getString("tensanpham"));
            sp.setGiaDaGiam(rs.getDouble("giadagiam"));
            sp.setHinhAnh(rs.getString("hinhanh"));
            return sp;
        } catch (SQLException e) {
            return null;
        }
    }
}
