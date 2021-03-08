package DAO;

import MODEL.ThanhVien;
import Utils.MD5;
import libs.DBConnection;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private static ResultSet rs = null;

    public static ThanhVien checkLogin(String taikhoan, String matkhau) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        String sql = "select * from  thanhvien where taikhoan=? and matkhau = ?";
        PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
        pst.setString(1, taikhoan);
        pst.setString(2, MD5.convertToMD5(matkhau));
        try {
            rs = pst.executeQuery();
            rs.last();
            int row = rs.getRow();
            if (rs != null && row == 1) {
                ThanhVien thanhVien = new ThanhVien();
                String taiKhoan = rs.getString("taikhoan");
                String matKhau = rs.getString("matkhau"); //auto md5
                String hoTen = rs.getString("hoten");
                String gioiTinh = rs.getString("gioitinh");
                String email = rs.getString("email");
                String soDienThoai = rs.getString("sodienthoai");
                String diaChi = rs.getString("diachi");
                int level = rs.getInt("level");
                String avatar = rs.getString("avatar");
                thanhVien.setTaiKhoan(taiKhoan);
                thanhVien.setMatKhau(matKhau);
                thanhVien.setHoTen(hoTen);
                thanhVien.setGioiTinh(gioiTinh);
                thanhVien.setEmail(email.toLowerCase());
                thanhVien.setSoDienThoai(soDienThoai);
                thanhVien.setDiaChi(diaChi);
                thanhVien.setLevel(level);
                thanhVien.setAvatar(avatar);
                return thanhVien;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            pst.close();
            rs.close();
        }
    }
}
