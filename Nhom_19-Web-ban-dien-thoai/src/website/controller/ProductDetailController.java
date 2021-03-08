package website.controller;

import website.dao.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/chi-tiet-san-pham")
public class ProductDetailController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String maSanPham = request.getParameter("id");
        try {
            request.setAttribute("ctsp", CategoryDAO.getDetailPrByID(Integer.parseInt(maSanPham)));
            request.getRequestDispatcher("product_detail.jsp").forward(request, response);
        } catch (SQLException |NumberFormatException e) {
            response.sendRedirect("error404.jsp");
            e.printStackTrace();
        }
    }
}
