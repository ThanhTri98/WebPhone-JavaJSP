package admin.controller;

import MODEL.ThanhVien;
import admin.dao.ThanhVienDAO;
import libs.CheckExistObj;
import libs.RemoveObj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/Admin/themAcc", "/Admin/xoaAcc", "/Admin/suaAcc"})
public class AccountController extends HttpServlet {
    private static final String TABLE = "thanhvien";
    private static final String PRIMARY_K = "taikhoan";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String taiKhoan = request.getParameter("usr-name");
        String matKhau = null, hoTen = null, gioiTinh = null, email = null, soDienThoai = null, diaChi = null;
        int level = 0;
        if (!action.equals("xoa")&&!action.equals("sua")) {
            matKhau = request.getParameter("password");
            hoTen = request.getParameter("full-name");
            gioiTinh = request.getParameter("gender");
            email = request.getParameter("email");
            soDienThoai = request.getParameter("sdt");
            diaChi = request.getParameter("address");
            try {
                level = Integer.parseInt(request.getParameter("level"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        ThanhVien thanhVien;
        try {
            if (action.equalsIgnoreCase("them")) {
                    thanhVien = new ThanhVien();
                    thanhVien.setTaiKhoan(taiKhoan);
                    thanhVien.setMatKhau(matKhau);
                    thanhVien.setHoTen(hoTen);
                    thanhVien.setGioiTinh(gioiTinh);
                    thanhVien.setEmail(email.toLowerCase());
                    thanhVien.setSoDienThoai(soDienThoai);
                    thanhVien.setDiaChi(diaChi);
                    thanhVien.setLevel(level);
                if (!CheckExistObj.checkExist(TABLE, PRIMARY_K, taiKhoan) && !CheckExistObj.checkExist(TABLE, "email", email)) {
                    if (new ThanhVienDAO().add(thanhVien)) {
                        request.getServletContext().setAttribute("dia-log", "sucThêm thành công tài khoản <strong style='font-size:15px;'>" + taiKhoan + "</strong>");
                        response.sendRedirect("account-manage.jsp");
                    }
                } else {
                    if (CheckExistObj.checkExist(TABLE, PRIMARY_K, taiKhoan)) {
                        request.getServletContext().setAttribute("dia-log", "errThêm thất bại(Tài khoản <strong style='font-size:15px;'>" + taiKhoan + "</strong> đã tồn tại!)");
                    } else {
                        request.getServletContext().setAttribute("dia-log", "errThêm thất bại(Email <strong style='font-size:15px;'>" + email + "</strong> đã tồn tại!)");
                    }
                    request.setAttribute("thanhvien",thanhVien);
                    request.getRequestDispatcher("account-manage.jsp").forward(request, response);

                }
            } else if (action.equalsIgnoreCase("sua")) {
                thanhVien =new ThanhVienDAO().findByID(taiKhoan);
                request.setAttribute("thanhvien",thanhVien);
                request.getRequestDispatcher("account-update.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("xoa")) {
                if (taiKhoan != null && !taiKhoan.equalsIgnoreCase("thanhtri98")) {
                    if (RemoveObj.remove(TABLE, PRIMARY_K, taiKhoan)) {
                        request.getServletContext().setAttribute("dia-log", "sucXóa thành công tài khoản <strong style='font-size:15px;'>" + taiKhoan + "</strong>");
                        response.sendRedirect("account-manage.jsp");
                    }
                } else {
                    request.getServletContext().setAttribute("dia-log", "err!!! Không thể xóa <strong style='font-size:15px;'>" + "<<->> Võ Thanh Trí <<->>" + "</strong>");
                    response.sendRedirect("account-manage.jsp");
                }
            } else if (action.equalsIgnoreCase("xulysua")) {
                thanhVien = new ThanhVien();
                thanhVien.setTaiKhoan(taiKhoan);
                thanhVien.setHoTen(hoTen);
                thanhVien.setGioiTinh(gioiTinh);
                thanhVien.setEmail(email);
                thanhVien.setSoDienThoai(soDienThoai);
                thanhVien.setDiaChi(diaChi);
                thanhVien.setLevel(level);
                String email_temp = request.getParameter("email-temp");
                if (email_temp.equals(email)) { //neu email khong thay doi
                    if (new ThanhVienDAO().edit(thanhVien)) {
                            request.getServletContext().setAttribute("dia-log", "sucSửa thành công tài khoản <strong style='font-size:15px;'>" + taiKhoan + "</strong>");
                            response.sendRedirect("account-manage.jsp");
                    }
                } else {
                    if (!CheckExistObj.checkExist(TABLE, "email", email)) {
                        if (new ThanhVienDAO().editNewEmail(thanhVien, email_temp)) {
                            request.getServletContext().setAttribute("dia-log", "sucEmail của tài khoản <strong style='font-size:15px;'>" + taiKhoan + "đã được thay đổi</strong>");
                            response.sendRedirect("account-manage.jsp");
                        }
                    } else {
                        request.getServletContext().setAttribute("dia-log", "errSửa thất bại(Email <strong style='font-size:15px;'>" + email + "</strong> đã tồn tại!)");
                        response.sendRedirect("account-manage.jsp");
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
