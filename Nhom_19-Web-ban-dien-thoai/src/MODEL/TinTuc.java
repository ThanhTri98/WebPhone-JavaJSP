package MODEL;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TinTuc {
    private int maTinTuc;
    private String tieuDe;
    private String moTa;
    private String anhMoTa;
    private String noiDung;
    private String ngayViet;
    private int loai;

    public TinTuc() {
    }

    public int getMaTinTuc() {
        return maTinTuc;
    }

    public void setMaTinTuc(int maTinTuc) {
        this.maTinTuc = maTinTuc;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getAnhMoTa() {
        return anhMoTa;
    }

    public void setAnhMoTa(String anhMoTa) {
        this.anhMoTa = anhMoTa;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getNgayViet() {
        return ngayViet;
    }

    public void setNgayViet(String ngayViet) {
        this.ngayViet = ngayViet;
    }

    public int getLoai() {
        return loai;
    }

    public void setLoai(int loai) {
        this.loai = loai;
    }

    public TinTuc addNews(TinTuc tinTuc, ResultSet rs) throws SQLException {
        tinTuc.setMaTinTuc(rs.getInt("id"));
        tinTuc.setTieuDe(rs.getString("tieude"));
        tinTuc.setAnhMoTa(rs.getString("anhmota"));
        tinTuc.setMoTa(rs.getString("mota"));
        tinTuc.setNoiDung(rs.getString("noidung"));
        tinTuc.setNgayViet(rs.getString("ngayviet"));
        tinTuc.setLoai(rs.getInt("loai"));
        return tinTuc;
    }

    @Override
    public String toString() {
        return "TinTuc{" +
                "maTinTuc=" + maTinTuc +
                ", tieuDe='" + tieuDe + '\'' +
                ", moTa='" + moTa + '\'' +
                ", anhMoTa='" + anhMoTa + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", ngayViet='" + ngayViet + '\'' +
                ", loai=" + loai +
                '}';
    }
}
