package website.controller;

import website.dao.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DienThoai")
public class CategoryController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String category = request.getParameter("cate");
        String sort = request.getParameter("type");
        String page = request.getParameter("page");
        if (page == null || page.equals("")) {
            page = "1";
        }
        try {
            if (category != null) {
                if (sort == null) {
                    request.setAttribute("category", CategoryDAO.findCateByProducer(category, null, Integer.parseInt(page)));
                    request.setAttribute("producer", category);
                    request.setAttribute("active", null);
                    request.setAttribute("countPages", CategoryDAO.countOfCate(category));
                    request.setAttribute("page", page);
                } else {
                    request.setAttribute("category", CategoryDAO.findCateByProducer(category, sort, Integer.parseInt(page)));
                    request.setAttribute("producer", category);
                    request.setAttribute("active", sort);
                    request.setAttribute("countPages", CategoryDAO.countOfCate(category));
                    request.setAttribute("page", page);
                }
                getServletContext().setAttribute("follow", "DienThoai?cate=" + category + (sort != null ? "&type=" + sort : ""));
                request.getRequestDispatcher("/product.jsp").forward(request, response);
            } else {
                response.sendRedirect("/error404.jsp");
            }
        } catch (SQLException e) {
            response.sendRedirect("/error404.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

    }
}
