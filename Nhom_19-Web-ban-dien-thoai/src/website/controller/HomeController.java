package website.controller;

import MODEL.ThanhVien;
import MODEL.ThanhVien;
import Utils.SessionUtil;
import DAO.LoginDAO;
import libs.Util;
import website.model.GioHang;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/Dang-Nhap", "/Dang-Xuat"})
public class HomeController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action != null && action.equals("dang-xuat")) {
            SessionUtil.getInstance().removeValue(request, "USER");
            SessionUtil.getInstance().removeValue(request, "giohang");
            response.sendRedirect("/trang-chu");
        } else {
            response.sendRedirect("/trang-chu");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String usr_name = request.getParameter("usr-name");
        String password = request.getParameter("password");
        if (action != null && action.equals("dang-nhap")) {
            try {
                ThanhVien thanhVien = LoginDAO.checkLogin(usr_name, password);
                if (thanhVien != null) {
                    SessionUtil.getInstance().putValue(request, "USER", thanhVien);
                    String follow_login = (String) request.getServletContext().getAttribute("follow-login");
                    if(follow_login!=null){
                        response.sendRedirect(Util.fullPath(follow_login));
                        request.getServletContext().removeAttribute("follow-login");
                    }else{
                    response.sendRedirect("/trang-chu");
                    }
                } else {
                    request.setAttribute("err", "Sai tên tài khoản hoặc mật khẩu");
                    request.getRequestDispatcher("/dang-nhap").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException | ServletException | NoSuchAlgorithmException e) {
                response.sendRedirect("/dang-nhap");
                e.printStackTrace();
            }
        }
    }
}
