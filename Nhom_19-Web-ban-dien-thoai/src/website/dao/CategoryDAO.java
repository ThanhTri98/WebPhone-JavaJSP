package website.dao;

import MODEL.SanPham;
import libs.DBConnection;
import MODEL.ChiTietSanPham;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public static List<SanPham> findCateByType(int loai) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        List<SanPham> dssp;
        SanPham sp;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanpham where loaisanpham=? and trangthai>0";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, loai);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new SanPham();
                dssp.add(sp.addProduct(sp, rs));
            }
            return dssp;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public static List<SanPham> findCateByTypeAndPrice(int loai, double price) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        List<SanPham> dssp;
        SanPham sp;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanpham where loaisanpham=? and trangthai>0 and giadagiam>?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, loai);
            pst.setDouble(2, price);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new SanPham();
                dssp.add(sp.addProduct(sp, rs));
            }
            return dssp;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public static ResultSet findCateByTypeAndGift(int loai) {
        PreparedStatement pst ;
        ResultSet rs;
        String sql;
        try {
            sql = "SELECT sp.masanpham, sp.tensanpham, sp.giaban, sp.giadagiam, sp.hinhanh, ct.quatang FROM sanpham as sp JOIN chitietsanpham as ct on sp.masanpham=ct.masanpham WHERE sp.loaisanpham=? and sp.trangthai>0 ORDER BY sp.giadagiam DESC";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, loai);
            rs = pst.executeQuery();
            return rs;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    public static List<ChiTietSanPham> findCateByProducer(String id_producer, String sort, int page) throws SQLException {
        List<ChiTietSanPham> ds_ctsp;
        ChiTietSanPham ctsp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        StringBuilder str;
        try {
            str = new StringBuilder("SELECT * FROM sanpham as sp JOIN chitietsanpham as ct on sp.masanpham=ct.masanpham WHERE sp.trangthai>0  and sp.nhacungcap=");
            str.append("'").append(id_producer).append("'");
            ds_ctsp = new ArrayList<>();
            if (sort == null || sort.equals("new")) {
            str.append(" limit ?,? ");
                sql = String.valueOf(str);
                pst = DBConnection.getConnection().prepareStatement(sql);
                pst.setInt(1, (page-1) * 8);
                pst.setInt(2, 8);
                rs = pst.executeQuery();
                while (rs.next()) {
                    ctsp = new ChiTietSanPham();
                    ds_ctsp.add(ctsp.addCTSP(ctsp, rs));
                }
            } else if (sort.equals("desc")) {
                str.append(" ORDER BY sp.giadagiam DESC ");
                str.append("limit ?,?");
                sql = String.valueOf(str);
                pst = DBConnection.getConnection().prepareStatement(sql);
                pst.setInt(1, (page-1) * 8);
                pst.setInt(2, 8);
                rs = pst.executeQuery();
                while (rs.next()) {
                    ctsp = new ChiTietSanPham();
                    ds_ctsp.add(ctsp.addCTSP(ctsp, rs));
                }
            } else if (sort.equals("asc")) {
                str.append(" ORDER BY sp.giadagiam ASC ");
                str.append("limit ?,?");
                sql = String.valueOf(str);
                pst = DBConnection.getConnection().prepareStatement(sql);
                pst.setInt(1, (page-1) * 8);
                pst.setInt(2, 8);
                rs = pst.executeQuery();
                while (rs.next()) {
                    ctsp = new ChiTietSanPham();
                    ds_ctsp.add(ctsp.addCTSP(ctsp, rs));
                }
            }
            return ds_ctsp;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public static ChiTietSanPham getDetailPrByID(int msp) throws SQLException {
        ChiTietSanPham ctsp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "SELECT * FROM sanpham as sp JOIN chitietsanpham as ct on sp.masanpham=ct.masanpham WHERE sp.masanpham=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, msp);
            rs = pst.executeQuery();
            rs.first();
            ctsp = new ChiTietSanPham();
            return ctsp.addCTSP(ctsp, rs);
        } catch (SQLException | ClassNotFoundException ex) {
            return null;
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public static int countOfCate(String nhaCungCap) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        int count;
        try {
            sql = "select * from sanpham where nhacungcap=? and trangthai>0";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, nhaCungCap.toUpperCase());
            rs = pst.executeQuery();
            rs.last();
            count = rs.getRow();
            return count;
        } catch (SQLException | ClassNotFoundException e) {
            return 0;
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

}