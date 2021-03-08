package MODEL;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ChiTietSanPham {
    private SanPham sanPham;
    private int danhGia;
    private double xepHang;
    private String quaTang;
    private ThongSoKyThuat thongSoKyThuat;
    public ChiTietSanPham(){}

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(int danhGia) {
        this.danhGia = danhGia;
    }

    public double getXepHang() {
        return xepHang;
    }

    public void setXepHang(double xepHang) {
        this.xepHang = xepHang;
    }

    public String getQuaTang() {
        return quaTang;
    }

    public void setQuaTang(String quaTang) {
        this.quaTang = quaTang;
    }

    public ThongSoKyThuat getThongSoKyThuat() {
        return thongSoKyThuat;
    }

    public void setThongSoKyThuat(ThongSoKyThuat thongSoKyThuat) {
        this.thongSoKyThuat = thongSoKyThuat;
    }
    public ChiTietSanPham addCTSP(ChiTietSanPham ctsp, ResultSet rs) throws SQLException {
        SanPham sp = new SanPham();
        ctsp.setSanPham(sp.addProduct(sp,rs));
        ctsp.setQuaTang(rs.getString("quatang"));
        ctsp.setDanhGia(rs.getInt("danhgia"));
        ctsp.setXepHang(rs.getDouble("xephang"));
        ThongSoKyThuat tskt = new ThongSoKyThuat();
        ctsp.setThongSoKyThuat(tskt.addTSKT(tskt,rs));
        return  ctsp;
    }

    @Override
    public String toString() {
        return "ChiTietSanPham{" +
                "sanPham=" + sanPham +
                ", danhGia=" + danhGia +
                ", xepHang=" + xepHang +
                ", quaTang='" + quaTang + '\'' +
                ", thongSoKyThuat=" + thongSoKyThuat +
                '}';
    }
}
