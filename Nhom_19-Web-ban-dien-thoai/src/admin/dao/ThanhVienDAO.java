package admin.dao;

import DAO.ObjectDAO;
import MODEL.ThanhVien;
import Utils.MD5;
import libs.DBConnection;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThanhVienDAO implements ObjectDAO {
    public static List<ThanhVien> findAll() throws SQLException {
        List<ThanhVien> ds_tv = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        ThanhVien tv;
        try {
            sql = "select * from thanhvien";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                tv = new ThanhVien();
                tv.setTaiKhoan(rs.getString(1));
                tv.setMatKhau(rs.getString(2));
                tv.setHoTen(rs.getString(3));
                tv.setGioiTinh(rs.getString(4));
                tv.setEmail(rs.getString(5));
                tv.setSoDienThoai(rs.getString(6));
                tv.setDiaChi(rs.getString(7));
                tv.setLevel(rs.getInt(8));
                tv.setAvatar(rs.getString(9));
                ds_tv.add(tv);
            }
            return ds_tv;
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
    public boolean add(Object obj) throws SQLException, ClassNotFoundException {
        ThanhVien thanhVien = (ThanhVien) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "insert into thanhvien values(?,?,?,?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, thanhVien.getTaiKhoan().toLowerCase());
            pst.setString(2, MD5.convertToMD5(thanhVien.getMatKhau()));
            pst.setString(3, thanhVien.getHoTen());
            pst.setString(4, thanhVien.getGioiTinh());
            pst.setString(5, thanhVien.getEmail().toLowerCase());
            pst.setString(6, thanhVien.getSoDienThoai());
            pst.setString(7, thanhVien.getDiaChi());
            pst.setInt(8, thanhVien.getLevel());
            pst.setString(9, thanhVien.getAvatar());
            pst.executeUpdate();
            return true;
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }

    @Override
    public boolean edit(Object obj) throws SQLException, ClassNotFoundException {
        ThanhVien thanhVien = (ThanhVien) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update ThanhVien set hoten=?,gioitinh=?,email=?,sodienthoai=?,diachi=?,level=? where taikhoan=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, thanhVien.getHoTen());
            pst.setString(2, thanhVien.getGioiTinh());
            pst.setString(3, thanhVien.getEmail().toLowerCase());
            pst.setString(4, thanhVien.getSoDienThoai());
            pst.setString(5, thanhVien.getDiaChi());
            pst.setInt(6, thanhVien.getLevel());
            pst.setString(7, thanhVien.getTaiKhoan());
            return pst.executeUpdate() == 1;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }

    public boolean editNewEmail(Object obj, String email_old) throws SQLException, ClassNotFoundException {
        ThanhVien thanhVien = (ThanhVien) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update ThanhVien set hoten=?,gioitinh=?,email=?,sodienthoai=?,diachi=?,level=? where email=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, thanhVien.getHoTen());
            pst.setString(2, thanhVien.getGioiTinh());
            pst.setString(3, thanhVien.getEmail().toLowerCase());
            pst.setString(4, thanhVien.getSoDienThoai());
            pst.setString(5, thanhVien.getDiaChi());
            pst.setInt(6, thanhVien.getLevel());
            pst.setString(7, email_old);
            pst.executeUpdate();
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }

    public ThanhVien findByID(String taiKhoan) throws SQLException {
        ThanhVien thanhVien;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from thanhvien where taikhoan=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, taiKhoan);
            rs = pst.executeQuery();
            if (rs.next()) {
                thanhVien = new ThanhVien();
                return thanhVien.themThanhVien(thanhVien, rs);
            }
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if(rs!=null) rs.close();
        }


    }
}
