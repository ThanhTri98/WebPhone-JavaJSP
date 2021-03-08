<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>

<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<% String usr_exist = (String) request.getAttribute("usr-exist");
    String email_exist = (String) request.getAttribute("email-exist");
%>
<section id="body">
    <div id="login-atm">
        <div class="login box-shadow-form">
            <div class="title-form" data-aos="zoom-out-down" data-aos-duration="800"><h1>Đăng Ký</h1></div>
            <form id="form-validate" class="form-style" action="<%=Util.fullPath("Dang-Ky")%>?action=dang-ky" method="post">
                <label for="usr-name">Tài khoản*
                    <%if (usr_exist != null) {%>
                    <span style="color: red;font-size: 15px;margin-left: 5px;"><%=usr_exist%></span>
                    <%}%>
                </label>
                <input type="text" id="usr-name" name="usr-name"
                       value="<%if(request.getParameter("usr-name")!=null){%><%=request.getParameter("usr-name")%><%}%>">
                <label for="password">Mật khẩu*</label>
                <input type="text" id="password" name="password" value="">
                <label for="c-password">Xác nhận mật khẩu*</label>
                <input type="text" id="c-password" name="c-password" value="">
                <label for="full-name">Họ tên*</label>
                <input type="text" id="full-name" name="full-name"
                       value="<%if(request.getParameter("full-name")!=null){%><%=request.getParameter("full-name")%><%}%>">
                <label for="gender">Giới tính</label>
                <select id="gender" name="gender">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
                <label for="email">Email*
                    <%if (email_exist != null) {%>
                    <span style="color: red;font-size: 15px;margin-left: 5px;"><%=email_exist%></span>
                    <%}%>
                </label>
                <input type="text" id="email" name="email"
                       value="<%if(request.getParameter("email")!=null){%><%=request.getParameter("email")%><%}%>">
                <label for="sdt">Số điện thoại*</label>
                <input type="number" id="sdt" name="sdt"
                       value="<%if(request.getParameter("sdt")!=null){%><%=request.getParameter("sdt")%><%}%>">
                <label for="address">Địa chỉ*</label>
                <input type="text" id="address" name="address"
                       value="<%if(request.getParameter("address")!=null){%><%=request.getParameter("address")%><%}%>">
                <button id="confirm-btn" type="submit">TẠO TÀI KHOẢN</button>
            </form>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp" %>
<!--footer-->
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<script src="assets/js/validation-form/vali-form.js"></script>
<!--js--end-->
</body>

</html>