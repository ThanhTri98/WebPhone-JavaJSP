package admin.dao;

import DAO.ObjectDAO;
import MODEL.NhaCungCap;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProducerDAO implements ObjectDAO {
    public static List<NhaCungCap> findAll() throws SQLException {
        List<NhaCungCap> ds_ncc = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        NhaCungCap ncc;
        try {
            sql = "select * from nhacungcap";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                ncc = new NhaCungCap();
                ncc.setMaNhaCungCap(rs.getString(1));
                ncc.setTenNhaCungCap(rs.getString(2));
                ncc.setDiaChi(rs.getString(3));
                ds_ncc.add(ncc);
            }
            return ds_ncc;
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
    public boolean add(Object obj) throws ClassNotFoundException, SQLException {
        NhaCungCap ncc = (NhaCungCap) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "insert into nhacungcap values(?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, ncc.getMaNhaCungCap());
            pst.setString(2, ncc.getTenNhaCungCap());
            pst.setString(3, ncc.getDiaChi());
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }

    @Override
    public boolean edit(Object obj) throws SQLException, ClassNotFoundException {
        NhaCungCap ncc = (NhaCungCap) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update nhacungcap set  manhacungcap=?, tennhacungcap=?,diachi=? where manhacungcap=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, ncc.getMaNhaCungCap());
            pst.setString(2, ncc.getTenNhaCungCap());
            pst.setString(3, ncc.getDiaChi());
            pst.setString(4, ncc.getMaNhaCungCap());
            pst.executeUpdate();
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        }finally {
            if(pst!=null) pst.close();
        }

    }
    public boolean editNewID(Object obj,String ma_ncc_old) throws SQLException, ClassNotFoundException {
        NhaCungCap ncc = (NhaCungCap) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update nhacungcap set  manhacungcap=?, tennhacungcap=?,diachi=? where manhacungcap=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, ncc.getMaNhaCungCap());
            pst.setString(2, ncc.getTenNhaCungCap());
            pst.setString(3, ncc.getDiaChi());
            pst.setString(4, ma_ncc_old);
            pst.executeUpdate();
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        }finally {
            if(pst!=null) pst.close();
        }
    }
}
