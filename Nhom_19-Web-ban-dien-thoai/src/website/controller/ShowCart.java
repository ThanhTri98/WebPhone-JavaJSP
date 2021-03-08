package website.controller;

import Utils.SessionUtil;
import website.model.GioHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/gio-hang")
public class ShowCart extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        GioHang gh = (GioHang) SessionUtil.getInstance().getValue(request, "giohang");
        if (gh == null) {
            gh=new GioHang();
            gh.setItem(new ArrayList<>());
            SessionUtil.getInstance().putValue(request,"giohang",gh);
        }
        request.setAttribute("GH", gh);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
