package admin.dao;

import DAO.ObjectDAO;
import MODEL.TinTuc;
import libs.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO implements ObjectDAO {
    public static List<TinTuc> findAll() throws SQLException {
        List<TinTuc> dstt = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        TinTuc tt;
        try {
            sql = "select id,tieude,ngayviet,loai from tintuc";
            pst = DBConnection.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                tt = new TinTuc();
                tt.setMaTinTuc(rs.getInt("id"));
                tt.setTieuDe(rs.getString("tieude"));
                tt.setNgayViet(rs.getString("ngayviet"));
                tt.setLoai(rs.getInt("loai"));
                dstt.add(tt);
            }
            return dstt;
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

    public static boolean remove(int id) throws SQLException {
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "delete from tintuc where id=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pst != null) pst.close();
        }
    }

    public static TinTuc findByID(int id) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        TinTuc tinTuc = null;
        try {
            sql = "select * from tintuc where id=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                tinTuc = new TinTuc();
                tinTuc.addNews(tinTuc, rs);
            }
            return tinTuc;
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
        TinTuc tinTuc = (TinTuc) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "insert into tintuc(tieude,anhmota,mota,ngayviet,noidung,loai) values(?,?,?,?,?,?)";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, tinTuc.getTieuDe());
            pst.setString(2, tinTuc.getAnhMoTa());
            pst.setString(3, tinTuc.getMoTa());
            pst.setDate(4, java.sql.Date.valueOf(tinTuc.getNgayViet()));
            pst.setString(5, tinTuc.getNoiDung());
            pst.setInt(6, tinTuc.getLoai());
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
        TinTuc tinTuc = (TinTuc) obj;
        PreparedStatement pst = null;
        String sql;
        try {
            sql = "update tintuc set tieude=?, anhmota=?,mota=?,ngayviet=?,noidung=?,loai=? where id=?";
            pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setString(1, tinTuc.getTieuDe());
            pst.setString(2, tinTuc.getAnhMoTa());
            pst.setString(3, tinTuc.getMoTa());
            pst.setDate(4, java.sql.Date.valueOf(tinTuc.getNgayViet()));
            pst.setString(5, tinTuc.getNoiDung());
            pst.setInt(6, tinTuc.getLoai());
            pst.setInt(7,tinTuc.getMaTinTuc());
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
