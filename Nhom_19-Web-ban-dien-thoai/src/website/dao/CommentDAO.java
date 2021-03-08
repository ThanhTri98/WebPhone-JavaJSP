package website.dao;

import MODEL.BinhLuan;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CommentDAO {
    public static boolean addCommentDB(BinhLuan bl) throws SQLException {
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "insert into binhluan(hoten,noidung,masanpham,sanpham,ngaybinhluan) values(?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1,bl.getHoTen());
            pst.setString(2,bl.getNoiDung());
            pst.setInt(3,bl.getMaSanPham());
            pst.setString(4,bl.getSanPham());
            pst.setDate(5, java.sql.Date.valueOf(sdf.format(date)));
            pst.executeUpdate();
            return  true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        return false;
        }
        finally {
            if(pst!=null) pst.close();
        }
    }
    public static List<BinhLuan> loadCmt(int masanpham) throws SQLException {
        List<BinhLuan> bls;
        PreparedStatement pst = null;
        ResultSet rs=null;
        BinhLuan bl;
        String sql;
        try{
            bls = new ArrayList<>();
            sql = "select * from binhluan where masanpham=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1,masanpham);
            rs = pst.executeQuery();
            while(rs.next()){
                bl = new BinhLuan();
                bl.setHoTen(rs.getString("hoten"));
                bl.setSanPham(rs.getString("sanpham"));
                bl.setNoiDung(rs.getString("noidung"));
                bl.setNgayBinhLuan(rs.getString("ngaybinhluan"));
                bls.add(bl);
            }
            return bls.isEmpty()?null:bls;
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
            return null;
        }finally {
            if(pst!=null) pst.close();
            if(rs!=null) rs.close();
        }
    }
}
