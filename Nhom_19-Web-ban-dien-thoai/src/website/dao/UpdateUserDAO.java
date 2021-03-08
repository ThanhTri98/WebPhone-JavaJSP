package website.dao;

import DAO.ObjectDAO;
import MODEL.ThanhVien;
import Utils.MD5;
import libs.DBConnection;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateUserDAO implements ObjectDAO {
    public static boolean edit(String taikhoan, String matkhau) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update thanhvien set matkhau=? where taikhoan=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, MD5.convertToMD5(matkhau));
            pst.setString(2, taikhoan);
            pst.executeUpdate();
            return true;

        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) {
                pst.close();
            }
        }
    }

    public static boolean checkCurrentPass(String current, String inputPass) throws NoSuchAlgorithmException {
        return current.equals(MD5.convertToMD5(inputPass));
    }

    @Override
    public boolean add(Object obj) throws SQLException, ClassNotFoundException {
        PreparedStatement pst = null;
        try {
            String sql = "insert into thanhvien values(?,md5(?),?,?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            ThanhVien thanhVien = (ThanhVien) obj;
            pst.setString(1, thanhVien.getTaiKhoan());
            pst.setString(2, thanhVien.getMatKhau());
            pst.setString(3, thanhVien.getHoTen());
            pst.setString(4, thanhVien.getGioiTinh());
            pst.setString(5, thanhVien.getEmail().toLowerCase());
            pst.setString(6, thanhVien.getSoDienThoai());
            pst.setString(7, thanhVien.getDiaChi());
            pst.setInt(8, 0);//level auto 0
            pst.setString(9, null);// avatar
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) {
                pst.close();
            }
        }
    }

    public static boolean updateInfoUser(ThanhVien thanhVien) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update thanhvien set hoten=?,gioitinh=?,email=?,sodienthoai=?,diachi=? where taikhoan=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, thanhVien.getHoTen());
            pst.setString(2, thanhVien.getGioiTinh());
            pst.setString(3, thanhVien.getEmail());
            pst.setString(4, thanhVien.getSoDienThoai());
            pst.setString(5, thanhVien.getDiaChi());
            pst.setString(6, thanhVien.getTaiKhoan());
            pst.executeUpdate();
            return true;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) {
                pst.close();
            }
        }

    }
}
