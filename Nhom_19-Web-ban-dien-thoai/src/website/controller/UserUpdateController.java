package website.controller;

import MODEL.ThanhVien;
import Utils.MD5;
import Utils.SessionUtil;
import libs.CheckExistObj;
import website.dao.UpdateUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/Dang-Ky", "/Doi-Mat-Khau", "/cap-nhat-thong-tin"})
public class UserUpdateController extends HttpServlet {
    private static final String TABLE = "thanhvien";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        ThanhVien thanhVienSS = (ThanhVien) SessionUtil.getInstance().getValue(request, "USER");
        if (action.equals("dang-ky")) {
            String usr_name = request.getParameter("usr-name");
            String email = request.getParameter("email").toLowerCase();
            try {
                if (CheckExistObj.checkExist(TABLE, "taikhoan", usr_name) || CheckExistObj.checkExist(TABLE, "email", email)) {
                    if (CheckExistObj.checkExist(TABLE, "taikhoan", usr_name)) {
                        request.setAttribute("usr-exist", "Tên tài khoản đã tồn tại!");
                    } else {
                        request.setAttribute("email-exist", "Email đã có người sử dụng!");
                    }
                    request.getRequestDispatcher("/dang-ky").forward(request, response);
                } else {
                    ThanhVien thanhVien = new ThanhVien();
                    thanhVien.setTaiKhoan(usr_name);
                    thanhVien.setEmail(email);
                    String password = request.getParameter("password");
                    String name = request.getParameter("full-name");
                    String gender = request.getParameter("gender");
                    String number_phone = String.valueOf(request.getParameter("sdt"));
                    String address = request.getParameter("address");
                    thanhVien.setMatKhau(password);
                    thanhVien.setHoTen(name);
                    thanhVien.setGioiTinh(gender);
                    thanhVien.setSoDienThoai(number_phone);
                    thanhVien.setDiaChi(address);
                    new UpdateUserDAO().add(thanhVien);
                    request.getRequestDispatcher("/dang-nhap").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.sendRedirect("/dang-ky");
            }
        } else if (action.equals("doi-mat-khau")) {
            try {
                String taikhoan = thanhVienSS.getTaiKhoan();
                String matkhau = thanhVienSS.getMatKhau();
                String inputPass = request.getParameter("current-pass");
                if (UpdateUserDAO.checkCurrentPass(matkhau, inputPass)) {
                    String newpass = request.getParameter("new-pass");
                    if (UpdateUserDAO.edit(taikhoan, newpass)) {
                        request.setAttribute("success-changePass", "Đổi mật khẩu thành công");
                        thanhVienSS.setMatKhau(MD5.convertToMD5(newpass));
                        SessionUtil.getInstance().putValue(request,"USER",thanhVienSS);
                        request.getRequestDispatcher("/trang-ca-nhan").forward(request, response);
                    }
                } else {
                    request.setAttribute("err-changePass", "Mật khẩu hiện tại không đúng!");
                    request.getRequestDispatcher("/trang-ca-nhan").forward(request, response);
                }

            } catch (NullPointerException | SQLException | NoSuchAlgorithmException e) {
                e.printStackTrace();
                SessionUtil.getInstance().removeValue(request, "USER");
            }
        } else if (action.equals("updateInfo")) {
            ThanhVien thanhVien = new ThanhVien();
            String email = request.getParameter("email");
            String email_temp = request.getParameter("email-temp");
            try {
                thanhVien.setTaiKhoan(thanhVienSS.getTaiKhoan());
                thanhVien.setMatKhau(thanhVienSS.getMatKhau());
                thanhVien.setHoTen(request.getParameter("full-name"));
                thanhVien.setGioiTinh(request.getParameter("gender"));
                thanhVien.setSoDienThoai(String.valueOf(request.getParameter("sdt")));
                thanhVien.setDiaChi(request.getParameter("address"));
                thanhVien.setEmail(email);
                thanhVien.setLevel(thanhVienSS.getLevel());
                if (!email.equals(email_temp)) {
                    if (!CheckExistObj.checkExist(TABLE, "email", email)) {
                        if (UpdateUserDAO.updateInfoUser(thanhVien)) {
                            request.setAttribute("success-update", "Cập nhật thông tin thành công");
                            SessionUtil.getInstance().putValue(request, "USER", thanhVien);
                        }
                    } else {
                        request.setAttribute("err-update", "Email đã có người sử dụng!");
                    }
                } else {
                    if (UpdateUserDAO.updateInfoUser(thanhVien)) {
                        request.setAttribute("success-update", "Cập nhật thông tin thành công");
                        SessionUtil.getInstance().putValue(request, "USER", thanhVien);
                    }
                }
                request.getRequestDispatcher("/trang-ca-nhan").forward(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error404.jsp");
            }

        }

    }
}
