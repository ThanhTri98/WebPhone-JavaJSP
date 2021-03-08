package admin.controller;

import libs.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Admin/CommentController")
public class CommentController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        try{
            String sql = "delete from binhluan where id=?";
            PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
            pst.setInt(1,Integer.parseInt(id));
            int row = pst.executeUpdate();
            if(row==1){
            request.getServletContext().setAttribute("dia-log", "sucXóa thành công");
            }else{
                request.getServletContext().setAttribute("dia-log", "errXóa thành công");
            }
            response.sendRedirect("comments-manage.jsp");
        }catch (SQLException | ClassNotFoundException |NumberFormatException e){
            e.printStackTrace();
        }
    }


}