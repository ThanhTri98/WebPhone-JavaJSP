package website.model;

import MODEL.ThanhVien;
import java.util.List;

public class GioHang {
    private String id;
    private ThanhVien thanhVien;
    private List<Item> item;
    private int trangthai;
    private String ngayThanhToan;

    public GioHang() {
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(String ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    public ThanhVien getThanhVien() {
        return thanhVien;
    }

    public void setThanhVien(ThanhVien thanhVien) {
        this.thanhVien = thanhVien;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }
    public int totalCount(){
        int count = 0;
        if(item!=null&&!item.isEmpty()){
        for(Item i:item){
            count+=i.getSoLuong();
        }
        }
        return count;
    }
    public double totalPrice(){
        double price=0;
        if(item!=null&&!item.isEmpty()){
            for(Item i:item){
                price+=i.getGia()*i.getSoLuong();
            }
        }
        return price;
    }

}
