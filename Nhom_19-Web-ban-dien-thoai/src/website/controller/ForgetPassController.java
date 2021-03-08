package website.controller;

import Utils.MD5;
import libs.DBConnection;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Calendar;
import java.util.Properties;

@WebServlet(urlPatterns = {"/quen-mat-khau"})
public class ForgetPassController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String smail = request.getParameter("email");
        String taikhoan = null;
        String action = request.getParameter("action");
        if (action == null) {
            if (smail != null) {
                String sql;
                PreparedStatement pst = null;
                Connection connection = null;
                try {
                    connection = DBConnection.getConnection();
                    sql = "select email from thanhvien where email=?";
                    pst = DBConnection.getConnection().prepareStatement(sql);
                    pst.setString(1, smail);
                    ResultSet rs1 = pst.executeQuery();
                    if (rs1.first()) {
                        sql = "select taikhoan from thanhvien where email=?";
                        pst = connection.prepareStatement(sql);
                        pst.setString(1, smail);
                        ResultSet rs2 = pst.executeQuery();
                        if (rs2.first()) {
                            taikhoan = rs2.getString("taikhoan");
                        }
                        java.sql.Timestamp intime = new java.sql.Timestamp(new java.util.Date().getTime());
                        Calendar cal = Calendar.getInstance();
                        cal.setTimeInMillis(intime.getTime());
                        cal.add(Calendar.MINUTE, 1);
                        java.sql.Timestamp exptime = new Timestamp(cal.getTime().getTime());

                        int Rand_num = (int) (Math.random() * 1000000);
                        String Rand = Integer.toString(Rand_num);
                        String finale = (Rand + "" + intime);
                        String hash = MD5.convertToMD5(finale);
                        String save_hash = "insert into  reset_password (taikhoan, hash_code, exptime, datetime) values(?,?,?,?)";
                        pst = connection.prepareStatement(save_hash);
                        pst.setString(1, taikhoan);
                        pst.setString(2, hash);
                        pst.setString(3, String.valueOf(exptime));
                        pst.setString(4, String.valueOf(intime));
                        int saved = pst.executeUpdate();
                        if (saved > 0) {
                            String link = "http://localhost:8080/reset_password.jsp";
                            String Host = "smtp.gmail.com";
                            String user = "atm.mobile.2019@gmail.com";
                            String pass = "4297f44b13955235245b2497399d7a93";
                            String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                            String from = "atm.mobile.2019@gmail.com";
                            String subject = "Dat Lai Mat Khau";
                            String messageText = "Nhấn <a href='" + link + "?key=" + hash + "'>VÀO ĐÂY</a>" + " để lấy lại mật khẩu. Link này có hiệu lực trong vòng 5 phút.";
                            Properties props = System.getProperties();
                            props.put("mail.Host", Host);
                            props.put("mail.transport.protocol.", "smtp");
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.", "true");
                            props.put("mail.smtp.port", "465");
                            props.put("mail.smtp.socketFactory.fallback", "false");
                            props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                            Session mailSession = Session.getDefaultInstance(props, null);
                            mailSession.setDebug(true);
                            Message msg = new MimeMessage(mailSession);
                            msg.setFrom(new InternetAddress(from));
                            InternetAddress[] address = {new InternetAddress(smail)};
                            msg.setRecipients(Message.RecipientType.TO, address);
                            msg.setSubject(subject);
                            msg.setContent(messageText, "text/html; charset=UTF-8");
                            Transport transport = mailSession.getTransport("smtp");
                            transport.connect(Host, user, pass);
                            try {
                                transport.sendMessage(msg, msg.getAllRecipients());
                                out.print("SUCCESS");
                            } catch (Exception err) {
                                err.printStackTrace();
                            }
                            transport.close();
                        }
                    } else {
                        out.print("ERROR");
                    }
                } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException | AddressException e) {
                    e.printStackTrace();
                    out.print("ERROR");
                } catch (MessagingException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (pst != null)
                            pst.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.print("ERROR");
            }
        } else {
            String new_pass = request.getParameter("new-pass");
            String c_new_pass = request.getParameter("c-new-pass");
            String taiKhoan = request.getParameter("taiKhoan");
            PreparedStatement pst = null;
            Connection connection = null;
            try {
                String sql = "update thanhvien set matkhau=? where taikhoan=?";
                connection = DBConnection.getConnection();
                if (new_pass.equals(c_new_pass)) {
                    pst = connection.prepareStatement(sql);
                    pst.setString(1, MD5.convertToMD5(c_new_pass));
                    pst.setString(2, taiKhoan);
                    pst.executeUpdate();
                    sql = "delete from reset_password where taikhoan=?";
                    pst = connection.prepareStatement(sql);
                    pst.setString(1, taiKhoan);
                    pst.executeUpdate();
                    response.sendRedirect("dang-nhap");
                } else {
                    response.getWriter().print("ERROR");
                }
            } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}