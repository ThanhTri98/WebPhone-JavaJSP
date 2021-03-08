package MODEL;

public class BinhLuan {
    private String hoTen;
    private String noiDung;
    private int maSanPham;
    private String sanPham;
    private String ngayBinhLuan;

    public BinhLuan() {}

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getSanPham() {
        return sanPham;
    }

    public void setSanPham(String sanPham) {
        this.sanPham = sanPham;
    }

    public String getNgayBinhLuan() {
        return ngayBinhLuan;
    }

    public void setNgayBinhLuan(String ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }

}
