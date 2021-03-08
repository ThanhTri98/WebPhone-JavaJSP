<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="libs.DBConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reset Password</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>
<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <% String hash = request.getParameter("key");
        java.sql.Timestamp curtime = new java.sql.Timestamp(new
                java.util.Date().getTime());
        String taiKhoan = null;
        java.sql.Timestamp exptime;
        Connection connection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            connection = DBConnection.getConnection();
            pst = connection.prepareStatement("select taikhoan,exptime from reset_password where hash_code=?");
            pst.setString(1, hash);
            rs = pst.executeQuery();
            if (rs.first()) {
                taiKhoan = rs.getString("taikhoan");
                exptime = rs.getTimestamp("exptime");
                if ((curtime).before(exptime)) {
    %>
    <div class="container form-forgot">
        <div id="change-pass" class="like-form">
            <h4>ĐẶT LẠI MẬT KHẨU</h4>
            <form id="form-change-pass" class="form-style" action="<%=Util.fullPath("quen-mat-khau")%>" method="post">
                <input type="hidden" name="action" value="qmk">
                <div>
                    <span>Mật khẩu mới<span style="color: #a10000">*</span></span>
                    <input type="text" id="new-pass" name="new-pass">
                </div>
                <div id="c-pass">
                    <span>Xác nhận mật khẩu<span style="color: #a10000">*</span></span>
                    <input type="text" id="c-new-pass" name="c-new-pass">
                </div>
                <input type="hidden" name="taiKhoan" value="<%=taiKhoan%>">
                <button type="submit" class="update-btn">Đặt lại mật khẩu</button>
            </form>
        </div>
    </div>
    <% } else {
    %>
    <div class="container form-forgot">
        <div id="alert-err" class="like-form">
            <div class="alert_err2">
                <h3 style="font-size:20px;text-align: center;color: #910000">Link này đã hết hiệu lực. Vui lòng thực hiện lại!.</h3>
                <div class="back-err">
                    <a href="<%=Util.fullPath("dang-nhap")%>">Thực hiện lại</a>
                </div>
                <div class="back-err">
                    <a href="<%=Util.fullPath("trang-chu")%>">Quay lại trang chủ</a>
                </div>

            </div>
        </div>
    </div>
    <%
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (connection != null) connection.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</section>
<%--footer--%>
<%@include file="Libs/footer-animation.jsp" %>
<%--footer--%>
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<script src="assets/js/validation-form/vali-chang-pass.js"></script>
<!--js--end-->
</body>
</html>