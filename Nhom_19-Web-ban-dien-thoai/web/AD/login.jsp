<%@ page import="libs.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/metisMenu.min.css" rel="stylesheet">
    <link href="css/timeline.css" rel="stylesheet">
    <link href="css/startmin.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="logo">
                <img src="../assets/img/common/logo-atm.png" height="87" width="128" alt="atm"/></div>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Đăng nhập vào trang Admin</h3>
                </div>
                <div class="panel-body">
                    <form role="form" id="form-login"
                          action="<%=Util.fullPath("AD/Admin-Dang-Nhap")%>?action-ad=dang-nhap"
                          method="post">
                        <fieldset>
                            <div class="form-group">
                                <input id="usr-name" class="form-control" placeholder="Tài khoản" name="usr-name"
                                       type="text">
                            </div>
                            <div class="form-group">
                                <input id="password" class="form-control" placeholder="Mật khẩu" name="password"
                                       type="password" value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Lưu mật khẩu
                                </label>
                            </div>
                            <div class="btn-login-admin">
                                <button type="submit" class="btn btn-lg btn-success btn-block">Đăng nhập</button>
                            </div>
                            <% String err = (String) request.getAttribute("err-ad");%>
                            <%if (err != null) {%>
                            <div class="err-login-frame">
                                <span class="err-login"><%=err%></span>
                            </div>
                            <%}%>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<%@include file="../Admin/Libs-Admin/footer.jsp" %>
<%--footer--%>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/metisMenu.min.js"></script>
<script src="js/raphael.min.js"></script>
<script src="js/startmin.js"></script>
<script src="../assets/js/validation-form/vali-login.js"></script>

</body>
</html>
