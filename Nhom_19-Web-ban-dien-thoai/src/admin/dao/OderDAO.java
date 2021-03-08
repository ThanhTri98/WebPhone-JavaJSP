package admin.dao;

import MODEL.GioHang_DB;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OderDAO {
    public static List<GioHang_DB> gioHangDB() throws SQLException {
        List<GioHang_DB> ghdbs;
        PreparedStatement pst = null;
        ResultSet rs = null;
        GioHang_DB gh;
        String sql;
        try {
            ghdbs = new ArrayList<>();
            sql = "select * from giohang";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                gh = new GioHang_DB();
                gh.setMaGioHang(rs.getString("magiohang"));
                gh.setHoten(rs.getString("hoten"));
                gh.setEmail(rs.getString("email"));
                gh.setSoDienThoai(rs.getString("sodienthoai"));
                gh.setDiaChi(rs.getString("diachi"));
                gh.setNgayThanhToan(rs.getString("ngaythanhtoan"));
                ghdbs.add(gh);
            }
            return ghdbs;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (rs != null) rs.close();
            if(pst!=null) pst.close();
        }

    }
    public static List<GioHang_DB> selectByID(String magiohang) throws SQLException {
        List<GioHang_DB> ghdbs;
        PreparedStatement pst = null;
        ResultSet rs = null;
        GioHang_DB gh;
        String sql;
        try {
            ghdbs = new ArrayList<>();
            sql = "select * from chitietdonhang where magiohang=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1,magiohang);
            rs = pst.executeQuery();
            while (rs.next()) {
                gh = new GioHang_DB();
                gh.setTenSanPham(rs.getString("tensanpham"));
                gh.setTrangThai(rs.getInt("trangthai"));
                gh.setSoLuong(rs.getInt("soluong"));
                gh.setSoTien(rs.getDouble("sotien"));
                gh.setHinhanh(rs.getString("hinhanh"));
                ghdbs.add(gh);
            }
            return ghdbs;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (rs != null) rs.close();
            if(pst!=null) pst.close();
        }
    }
    public static boolean remove(String magiohang) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "delete from giohang where magiohang=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1,magiohang);
            pst.executeUpdate();
            sql = "delete from chitietdonhang where magiohang=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1,magiohang);
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
