package admin.dao;

import DAO.ObjectDAO;
import MODEL.ChiTietSanPham;
import MODEL.SanPham;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO implements ObjectDAO {
    public static List<SanPham> findAll() throws SQLException {
        List<SanPham> dssp = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        SanPham sp;
        try {
            sql = "select * from sanpham";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new SanPham();
                dssp.add(sp.addProduct(sp, rs));
            }
            return dssp;
        } catch (Exception e) {
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

    public static List<ChiTietSanPham> findAllCT() throws SQLException {
        List<ChiTietSanPham> ds_ctsp = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        ChiTietSanPham ctsp;
        try {
            sql = "SELECT * FROM sanpham as sp JOIN chitietsanpham as ct on sp.masanpham=ct.masanpham";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                ctsp = new ChiTietSanPham();
                ds_ctsp.add(ctsp.addCTSP(ctsp, rs));
            }
            return ds_ctsp;
        } catch (Exception e) {
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

    @Override
    public boolean edit(Object obj) throws SQLException, ClassNotFoundException {
        ChiTietSanPham ctsp = (ChiTietSanPham) obj;
        PreparedStatement pst = null;
        String sql1, sql2;
        try {
            sql1 = "update sanpham set  tensanpham=?,giadagiam=?,giaban=?,soluong=?,hinhanh=?,trangthai=?,loaisanpham=? where masanpham=?";
            pst = DBConnection.getConnection().prepareStatement(sql1);
            pst.setString(1, ctsp.getSanPham().getTenSanPham());
            pst.setDouble(2, ctsp.getSanPham().getGiaDaGiam());
            pst.setDouble(3, ctsp.getSanPham().getGiaBan());
            pst.setInt(4, ctsp.getSanPham().getSoLuong());
            pst.setString(5, ctsp.getSanPham().getHinhAnh());
            pst.setInt(6, ctsp.getSanPham().getTrangTHai());
            pst.setInt(7, ctsp.getSanPham().getLoai());
            pst.setInt(8, ctsp.getSanPham().getMaSanPham());
            pst.executeUpdate();
            sql2 = "update chitietsanpham set  quatang=?,manhinh=?,hedieuhanh=?,cpu=?,ram=?,camera=?,pin=? where masanpham=?";
            pst = DBConnection.getConnection().prepareStatement(sql2);
            pst.setString(1, ctsp.getQuaTang());
            pst.setString(2, ctsp.getThongSoKyThuat().getManHinh());
            pst.setString(3, ctsp.getThongSoKyThuat().getHeDieuHanh());
            pst.setString(4, ctsp.getThongSoKyThuat().getCPU());
            pst.setString(5, ctsp.getThongSoKyThuat().getRAM());
            pst.setString(6, ctsp.getThongSoKyThuat().getCAMERA());
            pst.setString(7, ctsp.getThongSoKyThuat().getPIN());
            pst.setInt(8, ctsp.getSanPham().getMaSanPham());
            pst.executeUpdate();
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }

    }

    @Override
    public boolean add(Object obj) throws SQLException, ClassNotFoundException {
        ChiTietSanPham ctsp = (ChiTietSanPham) obj;
        PreparedStatement pst = null;
        String sql1, sql2;
        try {
            sql1 = "insert into sanpham(tensanpham,nhacungcap,giadagiam,giaban,soluong,hinhanh,trangthai,loaisanpham) values (?,?,?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql1);
            pst.setString(1, ctsp.getSanPham().getTenSanPham());
            pst.setString(2, ctsp.getSanPham().getNhaCungCap());
            pst.setDouble(3, ctsp.getSanPham().getGiaDaGiam());
            pst.setDouble(4, ctsp.getSanPham().getGiaBan());
            pst.setInt(5, ctsp.getSanPham().getSoLuong());
            pst.setString(6, ctsp.getSanPham().getHinhAnh());
            pst.setInt(7, ctsp.getSanPham().getTrangTHai());
            pst.setInt(8, ctsp.getSanPham().getLoai());
            pst.executeUpdate();
            sql2 = "insert into chitietsanpham(quatang,manhinh,hedieuhanh,cpu,ram,camera,pin) values (?,?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql2);
            pst.setString(1, ctsp.getQuaTang());
            pst.setString(2, ctsp.getThongSoKyThuat().getManHinh());
            pst.setString(3, ctsp.getThongSoKyThuat().getHeDieuHanh());
            pst.setString(4, ctsp.getThongSoKyThuat().getCPU());
            pst.setString(5, ctsp.getThongSoKyThuat().getRAM());
            pst.setString(6, ctsp.getThongSoKyThuat().getCAMERA());
            pst.setString(7, ctsp.getThongSoKyThuat().getPIN());
            pst.executeUpdate();
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }
}
