package website.controller;

import MODEL.ThanhVien;
import Utils.SessionUtil;
import website.dao.CartDAO;
import website.model.GioHang;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/thanh-toan")
public class PaymentController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        GioHang gh = (GioHang) SessionUtil.getInstance().getValue(request,"giohang");
        ThanhVien thanhVien = (ThanhVien) SessionUtil.getInstance().getValue(request, "USER");
        if(gh!=null){
            if(thanhVien!=null){
            gh.setThanhVien(thanhVien);
            gh.setId(thanhVien.getTaiKhoan());
            }
            try {
                if(new CartDAO().addToCartDB(gh)){
                    gh.getItem().clear();
                    SessionUtil.getInstance().putValue(request,"giohang",gh);
                    response.sendRedirect("gio-hang");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
