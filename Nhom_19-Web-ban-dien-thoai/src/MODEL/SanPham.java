package MODEL;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SanPham {
    private int maSanPham;
    private String tenSanPham;
    private String nhaCungCap;
    private double giaDaGiam;
    private double giaBan;
    private String hinhAnh;
    private int soLuong;
    private int trangTHai;
    private int loai;

    public SanPham(int maSanPham, String tenSanPham, String nhaCungCap, double giaDaGiam, double giaBan, int soLuong, String hinhAnh, int trangTHai, int loai) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.nhaCungCap = nhaCungCap;
        this.giaDaGiam = giaDaGiam;
        this.giaBan = giaBan;
        this.soLuong = soLuong;
        this.hinhAnh = hinhAnh;
        this.trangTHai = trangTHai;
        this.loai = loai;
    }
    public SanPham(){}

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(String nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

    public double getGiaDaGiam() {
        return giaDaGiam;
    }

    public void setGiaDaGiam(double giaDaGiam) {
        this.giaDaGiam = giaDaGiam;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public int getTrangTHai() {
        return trangTHai;
    }

    public void setTrangTHai(int trangTHai) {
        this.trangTHai = trangTHai;
    }

    public int getLoai() {
        return loai;
    }

    public void setLoai(int loai) {
        this.loai = loai;
    }
    public SanPham addProduct(SanPham sp, ResultSet rs) throws SQLException {
        sp.setMaSanPham(rs.getInt("masanpham"));
        sp.setTenSanPham(rs.getString("tensanpham"));
        sp.setNhaCungCap(rs.getString("nhacungcap"));
        sp.setGiaDaGiam(rs.getDouble("giadagiam"));
        sp.setGiaBan(rs.getDouble("giaban"));
        sp.setSoLuong(rs.getInt("soluong"));
        sp.setHinhAnh(rs.getString("hinhanh"));
        sp.setTrangTHai(rs.getInt("trangthai"));
        sp.setLoai(rs.getInt("loaisanpham"));
        return  sp;
    }
}
