<%@ page import="libs.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>

    <%@include file="Libs/fragment-header.jsp" %>
    <link rel="stylesheet" href="assets/css/popup-forget-pass.css">

</head>

<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div id="login-atm">
        <div class="login box-shadow-form">
            <% String err = (String) request.getAttribute("err");%>
            <%if (err != null) {%>
            <span class="err-login"><%=err%></span>
            <%}%>
            <div class="title-form" data-aos="zoom-out-down" data-aos-duration="800"><h1>Đăng nhập</h1></div>
            <form id="form-login" class="form-style" action="<%=Util.fullPath("Dang-Nhap")%>?action=dang-nhap"
                  method="post">
                <label for="usr-name">Tài khoản</label>
                <input type="text" id="usr-name" name="usr-name" placeholder="Tài khoản"
                       value="<%if(request.getParameter("usr-name")!=null){%><%=request.getParameter("usr-name")%><%}%>">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Mật khẩu" value="">
                <div class="remember-pass">
                    <input id="remember" type="checkbox">
                    <label for="remember">Lưu mật khẩu</label>
                </div>
                <button id="confirm-btn" type="submit">ĐĂNG NHẬP</button>
                <div class="forgot-register">
                    <a data-toggle="modal" data-target="#myModal" href="">Quên mật khẩu</a>
                    <a href="register.jsp">Đăng ký</a>
                </div>
                <button onclick="return location.href='https://www.facebook.com/dialog/oauth?client_id=<%=Constants.FACEBOOK_APP_ID%>&redirect_uri=<%=Constants.FACEBOOK_REDIRECT_URL%>'"
                        id="login-wfb" type="button"><i class="fa fa-facebook" aria-hidden="true"></i>Đăng Nhập Bằng
                    Facebook
                </button>
                <button onclick="return location.href='https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=<%=Constants.GOOGLE_REDIRECT_URI%>&response_type=code&client_id=<%=Constants.GOOGLE_CLIENT_ID%>&approval_prompt=force'"
                        id="login-wgg"
                        type="button"><i class="fa fa-google" aria-hidden="true"></i>Đăng nhập bằng
                    Google
                </button>
            </form>
        </div>
    </div>
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Đặt Lại Mật Khẩu</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span style="color: #591410" aria-hidden="true">X</span></button>
                </div>
                <div class="modal-body">
                    <div id="forget-pass">
                        <form id="form-forget" class="form-style-fg" action="#" method="#">
                            <ul id="frame-forget-pass">
                                <li class="row">
                                    <div class="col-sm-12 col-xs-6">
                                        <h5 class="modal-title suc-mail">Vui lòng nhập địa chỉ email bạn đã đăng ký trên <span style="color: #0a535d;font-size: 16px;font-style: italic;font-weight: 600;">ATM</span></h5>
                                    </div>
                                    <div id="err-mail">Có gì sai sai!!!</div>
                                    <div class="col-sm-12 col-xs-6">
                                        <input type="text" id="email" name="email" placeholder="Email">
                                    </div>
                                </li>
                            </ul>
                            <div class="btn-submit">
                                <button type="submit" class="update-btn">Xác nhận</button>
                            </div>
                        </form>
                    </div>
                </div>
                <%--                <div class="modal-footer">--%>
                <%--                    <button type="button" class="tbn-cancle" data-dismiss="modal">Đóng--%>
                <%--                    </button>--%>
                <%--                </div>--%>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</section>
<%--footer--%>
<%@include file="Libs/footer-animation.jsp" %>
<%--footer--%>
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<!--js--end-->
<script src="assets/js/validation-form/vali-login.js"></script>
<script src="assets/js/validation-form/vali-forget.js"></script>

</body>

</html>