package admin.controller;

import admin.dao.OderDAO;
import libs.RemoveObj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Admin/oder")
public class OderController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String mgh = request.getParameter("mgh");
        try {
            if (mgh != null) {
                if (OderDAO.remove(mgh)) {
                    request.getServletContext().setAttribute("dia-log", "sucXóa thành công");
                    response.sendRedirect("oder-manage.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

    }
}
