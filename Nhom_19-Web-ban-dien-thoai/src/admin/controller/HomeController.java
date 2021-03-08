package admin.controller;

import MODEL.ThanhVien;
import DAO.LoginDAO;
import Utils.SessionUtil;
import libs.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/AD/Admin-Dang-Nhap", "/AD/Admin-Dang-Xuat"})
public class HomeController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action-ad");
        if (action != null && action.equals("dang-xuat")) {
            SessionUtil.getInstance().removeValue(request, "USER");
            response.sendRedirect(Util.fullPath("AD/dang-nhap"));
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action-ad");
        String usr_name = request.getParameter("usr-name");
        String password = request.getParameter("password");
        if (action != null && action.equals("dang-nhap")) {
            try {
                ThanhVien thanhVien = LoginDAO.checkLogin(usr_name, password);
                if (thanhVien != null && thanhVien.getLevel()>=1) {
                    SessionUtil.getInstance().putValue(request, "USER", thanhVien);
                    response.sendRedirect( Util.fullPath("Admin/index.jsp"));
                } else {
                    request.setAttribute("err-ad", "Sai tên tài khoản hoặc mật khẩu");
                    request.getRequestDispatcher("dang-nhap").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException | ServletException | NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
    }
}
