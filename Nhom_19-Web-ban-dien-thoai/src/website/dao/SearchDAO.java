package website.dao;

import MODEL.ChiTietSanPham;
import MODEL.SanPham;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {
    public static List<SanPham> search(String input) throws SQLException {
        List<SanPham> dssp;
        SanPham sanPham;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanpham where trangthai>0 and tensanpham like " + "'%" + input + "%' limit 6";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sanPham = new SanPham();
                dssp.add(sanPham.addProduct(sanPham, rs));
            }
            return dssp.size() != 0 ? dssp : null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }
    public static List<ChiTietSanPham> searchKey(String key) throws SQLException {
        List<ChiTietSanPham> dsct_sp;
        ChiTietSanPham ctsp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsct_sp = new ArrayList<>();
            sql = "select * from sanpham as sp join chitietsanpham as ctsp where sp.masanpham=ctsp.masanpham and trangthai>0 and tensanpham like " + "'%" + key + "%'";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                ctsp = new ChiTietSanPham();
                dsct_sp.add(ctsp.addCTSP(ctsp,rs));
            }
            return dsct_sp.size() != 0 ? dsct_sp : null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

//    public static void main(String[] args) throws SQLException {
//        List<ChiTietSanPham> dsct_sp = searchKey("ipho");
//        System.out.println(dsct_sp.size());
//    }
}
