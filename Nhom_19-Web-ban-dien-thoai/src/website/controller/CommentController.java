package website.controller;

import MODEL.BinhLuan;
import libs.Util;
import website.dao.CommentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/xu-ly-binh-luan")
public class CommentController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String noidung = request.getParameter("cmt");
        String msp = request.getParameter("msp");
        if (!noidung.equals("")) {
            String name = request.getParameter("name");
            String sp = request.getParameter("sp");
            BinhLuan bl = new BinhLuan();
            bl.setHoTen(name);
            bl.setSanPham(sp);
            bl.setNoiDung(noidung);
            bl.setMaSanPham(Integer.parseInt(msp));
            try {
                if (CommentDAO.addCommentDB(bl)) {
                    response.sendRedirect(Util.fullPath("chi-tiet-san-pham?id=" + msp));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect(Util.fullPath("chi-tiet-san-pham?id=" + msp));
        }
    }
}
