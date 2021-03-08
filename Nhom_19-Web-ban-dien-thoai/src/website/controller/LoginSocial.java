package website.controller;

import MODEL.ThanhVien;
import Utils.SessionUtil;
import com.restfb.types.User;
import libs.Util;
import website.model.GooglePojo;
import website.model.GoogleUtils;
import website.model.RestFB;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login-facebook", "/login-google"})
public class LoginSocial extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String scope = request.getParameter("scope");
        ThanhVien thanhVien = null;
        if (scope != null) {
            if (code != null && !code.isEmpty()) {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                thanhVien = new ThanhVien();
                thanhVien.setHoTen(googlePojo.getEmail().substring(0, googlePojo.getEmail().indexOf("@")));
                thanhVien.setTaiKhoan(googlePojo.getId());
                thanhVien.setEmail(googlePojo.getEmail());
                thanhVien.setLevel(0);
            }
        } else {
            if (code != null && !code.isEmpty()) {
                String accessToken = RestFB.getToken(code);
                User user = RestFB.getUserInfo(accessToken);
                thanhVien = new ThanhVien();
                thanhVien.setHoTen(user.getName());
                thanhVien.setTaiKhoan(user.getId());
                thanhVien.setLevel(0);
            }
        }
        SessionUtil.getInstance().putValue(request, "USER", thanhVien);
        response.sendRedirect(Util.fullPath("trang-chu"));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }

}