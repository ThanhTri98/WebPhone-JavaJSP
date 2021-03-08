package admin.controller;

import MODEL.ChiTietSanPham;
import MODEL.SanPham;
import admin.dao.ProductsDAO;
import libs.RemoveObj;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import website.dao.CategoryDAO;
import MODEL.ThongSoKyThuat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/Admin/themPro", "/Admin/xoaPro", "/Admin/suaPro"})
public class ProductController extends HttpServlet {
    private static final String TABLE_1 = "sanpham";
    private static final String TABLE_2 = "chitietsanpham";
    private static final String PRIMARY_K = "masanpham";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        String ma_sp = request.getParameter("id-product");
        String ten_sp = request.getParameter("name-product");
        String loai_sp = request.getParameter("type");
        String nha_cc = request.getParameter("producer");
        String giadagiam = request.getParameter("sale-price");
        String giaban = request.getParameter("price");
        String soluong = request.getParameter("count-product");
        String hinhanh = request.getParameter("link-img");
        String trangthai = request.getParameter("status");

        String quatang = request.getParameter("gift");
        String manhinh = request.getParameter("screen");
        String hedieuhanh = request.getParameter("hdh");
        String cpu = request.getParameter("cpu");
        String ram = request.getParameter("ram");
        String camera = request.getParameter("camera");
        String pin = request.getParameter("pin");
        int msp;
        try {
            msp = Integer.parseInt(ma_sp);
        } catch (NumberFormatException e) {
            msp = -1;
        }


        try {
            switch (action) {
                case "sua": {
                    ChiTietSanPham ctsp = CategoryDAO.getDetailPrByID(msp);
                    request.setAttribute("ctsp", ctsp);
                    request.getRequestDispatcher("cap-nhat-san-pham").forward(request, response);
                    break;
                }
                case "xoa":
                    if (RemoveObj.remove(TABLE_1, PRIMARY_K, String.valueOf(msp)) && RemoveObj.remove(TABLE_2, PRIMARY_K, String.valueOf(msp))) {
                        request.getServletContext().setAttribute("dia-log", "sucXóa thành công");
                        response.sendRedirect("quan-ly-san-pham");
                    }

                    break;
                case "xulysua": {
                    ChiTietSanPham ctsp = new ChiTietSanPham();
                    ThongSoKyThuat tskt = new ThongSoKyThuat();
                    SanPham sp = new SanPham();
                    sp.setMaSanPham(msp);
                    sp.setTenSanPham(ten_sp);
                    sp.setNhaCungCap(nha_cc);
                    sp.setGiaDaGiam(Double.parseDouble(giadagiam));
                    sp.setGiaBan(Double.parseDouble(giaban));
                    sp.setSoLuong(Integer.parseInt(soluong));
                    sp.setHinhAnh(hinhanh);
                    sp.setLoai(Integer.parseInt(loai_sp));
                    sp.setTrangTHai(Integer.parseInt(trangthai));
                    ctsp.setSanPham(sp);
                    ctsp.setQuaTang(quatang);
                    tskt.setManHinh(manhinh);
                    tskt.setPIN(pin);
                    tskt.setCAMERA(camera);
                    tskt.setRAM(ram);
                    tskt.setCPU(cpu);
                    tskt.setHeDieuHanh(hedieuhanh);
                    ctsp.setThongSoKyThuat(tskt);
                    if (new ProductsDAO().edit(ctsp)) {
                        request.getServletContext().setAttribute("dia-log", "sucSửa thành công");
                        response.sendRedirect("quan-ly-san-pham");
                    }
                    break;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int msp;
        String producer = "";

        String image;
        String path = "";
        FileItem ite_real = null;

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
            SanPham sp = new SanPham();
            ThongSoKyThuat tskt = new ThongSoKyThuat();
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
                List<FileItem> fieldList = servletFileUpload.parseRequest(request);
                for (FileItem item : fieldList) {
                    switch (item.getFieldName()) {
                        case "id-product":
                            try{
                                msp = Integer.parseInt(item.getString());
                            }catch (NumberFormatException e){
                               msp=-1;
                            }
                            sp.setMaSanPham(msp);
                            break;
                        case "name-product":
                            sp.setTenSanPham(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "type":
                            sp.setLoai(Integer.parseInt(item.getString()));
                            break;
                        case "producer":
                            producer = item.getString();
                            sp.setNhaCungCap(producer);
                            break;
                        case "sale-price":
                            if (item.getString() != null) {
                                sp.setGiaDaGiam(Double.parseDouble(item.getString()));
                            } else {
                                sp.setGiaDaGiam(0);
                            }
                            break;
                        case "price":
                            if (item.getString() != null) {
                                sp.setGiaBan(Double.parseDouble(item.getString()));
                            } else {
                                sp.setGiaBan(0);
                            }
                            break;
                        case "count-product":
                            sp.setSoLuong(Integer.parseInt(item.getString()));
                            break;
                        case "link-img":
                            image = new File(item.getName()).getName();
//                            before_path = "D:/Intellij-WEB/Nhom_19-Web-ban-dien-thoai/web/";
                            path = "assets/img/products/" + producer.toLowerCase() + "/" + image;
                            sp.setHinhAnh(path);
//                            ite = item;
                            ite_real = item;
                            break;
                        case "status":
                            sp.setTrangTHai(Integer.parseInt(item.getString()));
                            break;
                        case "gift":
                            chiTietSanPham.setQuaTang(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "screen":
                            tskt.setManHinh(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "hdh":
                            tskt.setHeDieuHanh(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "cpu":
                            tskt.setCPU(item.getString());
                            break;
                        case "ram":
                            tskt.setRAM(item.getString());
                            break;
                        case "camera":
                            tskt.setCAMERA(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "pin":
                            tskt.setPIN(item.getString());
                            break;
                    }
                }
            }
            chiTietSanPham.setSanPham(sp);
            chiTietSanPham.setThongSoKyThuat(tskt);
                if (new ProductsDAO().add(chiTietSanPham)) {
                    File real = new File(request.getRealPath("/") + path);
                    if (!real.exists()) {
                        if (ite_real != null) {
                            ite_real.write(real);
                        }
                    }
                    request.getServletContext().setAttribute("dia-log", "sucThêm thành công");
                    response.sendRedirect("quan-ly-san-pham");
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
