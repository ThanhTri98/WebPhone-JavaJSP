package website.dao;

import libs.DBConnection;
import website.model.GioHang;
import MODEL.GioHang_DB;
import website.model.Item;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class CartDAO {
    private Calendar cal = Calendar.getInstance();
    private Date date = cal.getTime();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Random ran = new Random();
    public CartDAO() {
    }
    public boolean addToCartDB(GioHang gh) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "insert into giohang values(?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);

            String mgh = gh.getThanhVien().getTaiKhoan()+""+(ran.nextInt(999999)+1);
            pst.setString(1, mgh);
            pst.setString(2, gh.getThanhVien().getHoTen());
            pst.setString(3, gh.getThanhVien().getEmail());
            pst.setString(4, gh.getThanhVien().getSoDienThoai());
            pst.setString(5, gh.getThanhVien().getDiaChi());
            pst.setDate(6, java.sql.Date.valueOf(sdf.format(date)));
            int row = pst.executeUpdate();
            if (row == -1) return false;
            sql = "insert into chitietdonhang(magiohang,tensanpham,sotien,trangthai,soluong,hinhanh) values(?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            for (Item item : gh.getItem()) {
                pst.setString(1, mgh);
                pst.setString(2, item.getSanPham().getTenSanPham());
                pst.setDouble(3, (item.getSoLuong() * item.getGia()));
                pst.setInt(4, gh.getTrangthai());
                pst.setInt(5, item.getSoLuong());
                pst.setString(6, item.getSanPham().getHinhAnh());
                pst.executeUpdate();
            }
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }
}
