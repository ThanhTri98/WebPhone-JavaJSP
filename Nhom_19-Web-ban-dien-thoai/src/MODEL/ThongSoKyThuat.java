package MODEL;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ThongSoKyThuat {
    private String manHinh;
    private String heDieuHanh;
    private String CPU;
    private String RAM;
    private String CAMERA;
    private String PIN;
    public  ThongSoKyThuat(){}
    public ThongSoKyThuat(String manHinh, String heDieuHanh, String CPU, String RAM, String CAMERA, String PIN) {
        this.manHinh = manHinh;
        this.heDieuHanh = heDieuHanh;
        this.CPU = CPU;
        this.RAM = RAM;
        this.CAMERA = CAMERA;
        this.PIN = PIN;
    }

    public String getManHinh() {
        return manHinh;
    }

    public void setManHinh(String manHinh) {
        this.manHinh = manHinh;
    }

    public String getHeDieuHanh() {
        return heDieuHanh;
    }

    public void setHeDieuHanh(String heDieuHanh) {
        this.heDieuHanh = heDieuHanh;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getCAMERA() {
        return CAMERA;
    }

    public void setCAMERA(String CAMERA) {
        this.CAMERA = CAMERA;
    }

    public String getPIN() {
        return PIN;
    }

    public void setPIN(String PIN) {
        this.PIN = PIN;
    }

    public ThongSoKyThuat addTSKT(ThongSoKyThuat tskt, ResultSet rs) throws SQLException {
        tskt.setManHinh(rs.getString("manhinh"));
        tskt.setHeDieuHanh(rs.getString("hedieuhanh"));
        tskt.setCPU(rs.getString("cpu"));
        tskt.setRAM(rs.getString("ram"));
        tskt.setCAMERA(rs.getString("camera"));
        tskt.setPIN(rs.getString("pin"));
        return  tskt;
    }

    @Override
    public String toString() {
        return "ThongSoKyThuat{" +
                "manHinh='" + manHinh + '\'' +
                ", heDieuHanh='" + heDieuHanh + '\'' +
                ", CPU='" + CPU + '\'' +
                ", RAM='" + RAM + '\'' +
                ", CAMERA='" + CAMERA + '\'' +
                ", PIN='" + PIN + '\'' +
                '}';
    }
}
