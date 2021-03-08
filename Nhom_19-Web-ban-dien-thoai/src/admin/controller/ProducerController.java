package admin.controller;

import MODEL.NhaCungCap;
import admin.dao.ProducerDAO;
import libs.CheckExistObj;
import libs.RemoveObj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/Admin/themNCC", "/Admin/xoaNCC", "/Admin/suaNCC"})
public class ProducerController extends HttpServlet {
    private static final String TABLE = "nhacungcap";
    private static final String PRIMARY_K = "manhacungcap";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String ma_ncc = request.getParameter("id-producer");
        String ten_ncc = request.getParameter("name-producer");
        String diachi_ncc = request.getParameter("add-producer");
        NhaCungCap ncc;
        try {
            if (action.equalsIgnoreCase("them")) {
                if (!CheckExistObj.checkExist(TABLE, PRIMARY_K, ma_ncc)) {
                    ncc = new NhaCungCap();
                    ncc.setMaNhaCungCap(ma_ncc);
                    ncc.setTenNhaCungCap(ten_ncc);
                    ncc.setDiaChi(diachi_ncc);
                    if (new ProducerDAO().add(ncc)) {
                        request.getServletContext().setAttribute("dia-log", "sucThêm thành công");
                        response.sendRedirect("producer.jsp");
                    }

                } else {
                    request.getServletContext().setAttribute("dia-log", "errThêm thất bại(Nhà cung cấp <strong style='font-size:15px;'>" + ma_ncc + "</strong> đã tồn tại!)");
                    response.sendRedirect("producer.jsp");
                }
            } else if (action.equalsIgnoreCase("sua")) {
                request.getRequestDispatcher("producer-update.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("xoa")) {
                if(RemoveObj.remove(TABLE, PRIMARY_K, ma_ncc)){
                    request.getServletContext().setAttribute("dia-log", "sucXóa thành công");
                    response.sendRedirect("producer.jsp");
                }
            } else if (action.equalsIgnoreCase("xulysua")) {
                ncc = new NhaCungCap();
                ncc.setMaNhaCungCap(ma_ncc);
                ncc.setTenNhaCungCap(ten_ncc);
                ncc.setDiaChi(diachi_ncc);
                String id_producer_temp = request.getParameter("id-producer-temp");
                if (id_producer_temp.equalsIgnoreCase(ma_ncc)) { //manhacungcap không đổi >> sửa các thông tin còn lại
                    if (new ProducerDAO().edit(ncc)) {
                        request.getServletContext().setAttribute("dia-log", "sucSửa thành công");
                        response.sendRedirect("producer.jsp");
                    }
                } else {
                    if (!CheckExistObj.checkExist(TABLE, PRIMARY_K, ma_ncc)) {
                        if (new ProducerDAO().editNewID(ncc, id_producer_temp)) {
                            request.getServletContext().setAttribute("dia-log", "sucSửa thành công");
                            response.sendRedirect("producer.jsp");
                        }
                    } else {
                        request.getServletContext().setAttribute("dia-log", "errSửa thất bại (Nhà cung cấp <strong style='font-size:15px;'>" + ma_ncc + "</strong> đã tồn tại!)");
                        response.sendRedirect("producer.jsp");
                    }
                }


            }

        } catch (ClassNotFoundException | SQLException | ServletException e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

    }
}
