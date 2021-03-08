<%@ page import="MODEL.ThanhVien" %>
<%@ page import="Utils.SessionUtil" %>
<%@ page import="libs.Util" %>
<%@ page import="website.model.GioHang" %>
<%@ page import="website.model.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<body>
<div data-aos="fade-down" data-aos-once="true" id="header-top">
    <div class="container">
        <div class="header-top d-flex space-between">
            <ul class="d-flex">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                <li><span>Hotline: 0xx-xxx-xxxx | Email: atm.pro@gmail.com</span></li>
            </ul>
            <ul class="d-flex">
                <li><a><i class="fa fa-truck fa-flip-horizontal"></i></a><span>Ship COD toàn quốc</span></li>
                <li><a><i class="fa fa-bar-chart"></i></a><span>Mặt hàng đa dạng</span></li>
                <li><a><i class="fa fa-heart"></i></a><span>Cam kết chất lượng</span></li>
            </ul>
        </div>
    </div>
</div>
<section id="header">
    <div id="main-header">
        <div class="container">
            <div class="header-logo space-between">
                <div class="header-main-logo d-flex space-between">
                    <a href="./index.jsp" data-aos="fade-right" data-aos-once="true" class="logo">
                        <img src="./assets/img/common/logo-atm.png" height="87" width="128" alt="atm"/>
                    </a>
                    <form id="serach-form" action="" method="post">
                        <div class="search">
                            <%String key = (String) request.getAttribute("key");%>
                            <input type="text" placeholder="Bạn cần tìm gì?" id="search" name="search" value="<%=key!=null?key:""%>" autocomplete="off">
                            <button type="submit" id="icon-search"><i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                            <ul class="wrap-suggestion"></ul>
                        </div>
                    </form>
                </div>
                <div data-aos="fade-left" data-aos-once="true" id="header-main-center">
                    <div class="news-request d-flex">
                        <div class="news"><a class="transform-para" href="./news.jsp">Tin tức</a></div>
                        <div class="request"><a class="transform-para" href="./question.jsp">Hỏi đáp</a></div>
                    </div>
                    <% ThanhVien thanhVien = (ThanhVien) SessionUtil.getInstance().getValue(request, "USER");%>
                    <ul class="icon-profile">
                        <li id="hello-user">
                            <div class="flex-user"><span>Xin chào</span>
                                <% if (thanhVien != null) {%>
                                <a href="./profile_user.jsp"><span
                                        class="user-text"></span>
                                    <%=thanhVien.getHoTen()%>
                                </a></div>
                            <a href="<%=Util.fullPath("Dang-Xuat")%>?action=dang-xuat"><span
                                    class="exit">Thoát</span></a>
                            <%}%>
                        </li>
                        <% if (thanhVien != null) {%>
                        <%if (thanhVien.getLevel() == 1) {%>
                        <li id="user">
                            <a style="margin-right: 10px" href="./Admin/index.jsp"><i
                                    class="fa fa-cog fa-spin ic-level"></i></a>
                            <span class="span-level">Admin</span>
                        </li>
                        <%}%>
                        <%} else {%>
                        <li id="user">
                            <i class="fa fa-user-circle-o" id="user-icon"></i>
                            <ul class="sub-user">
                                <li class="login"><a href="./login.jsp">Đăng nhập</a><span>/</span><a
                                        href="./register.jsp">Đăng ký</a></li>
                                <li><span>hoặc</span></li>
                                <li class="login-with-fb"><a href="https://www.facebook.com/dialog/oauth?client_id=<%=Constants.FACEBOOK_APP_ID%>&redirect_uri=<%=Constants.FACEBOOK_REDIRECT_URL%>">Đăng nhập bằng</a>
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </li>
                                <li class="login-with-gg"><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=<%=Constants.GOOGLE_REDIRECT_URI%>&response_type=code
    &client_id=<%=Constants.GOOGLE_CLIENT_ID%>&approval_prompt=force">Đăng nhập bằng</a>
                                    <i class="fa fa-google" aria-hidden="true"></i>
                                </li>
                            </ul>
                        </li>
                        <%}%>
                        <li style="width: 24px"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<div id="menu-header">
    <div class="container">
        <div id="menu">
            <ul class="list-menu d-flex">
                <%String pd = (String) request.getAttribute("producer");%>
                <li id="home-menu"><a href="<%=Util.fullPath("trang-chu")%>"><i
                        class="fa fa-home" aria-hidden="true"></i><span>TRANG CHỦ</span></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("iphone")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=iphone"><img
                        src="assets/img/common/logo-nsx/iPhone-(Apple)42-b_16.jpg" alt="i-phone"></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("samsung")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=samsung"><img
                        src="assets/img/common/logo-nsx/Samsung42-b_25.jpg" alt="samsung"></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("xiaomi")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=xiaomi"><img
                        src="assets/img/common/logo-nsx/Xiaomi42-b_31.png" alt="xiaomi"></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("vivo")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=vivo"><img
                        src="assets/img/common/logo-nsx/Vivo42-b_50.jpg" alt="vivo"></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("oppo")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=oppo"><img
                        src="assets/img/common/logo-nsx/OPPO42-b_57.jpg" alt="oppo"></a></li>
                <li class="<%=pd!=null&&pd.equalsIgnoreCase("huawei")?"active":""%>"><a
                        href="<%=Util.fullPath("DienThoai")%>?cate=huawei"><img
                        src="assets/img/common/logo-nsx/Huawei42-b_30.jpg" alt="hua"></a></li>
            </ul>
        </div>
    </div>
</div>
<ul style="position: sticky;top: 8px;z-index: 100;margin-top: -97px;float: right;right: 145px;">
    <li id="cart">
        <%GioHang gh = (GioHang) SessionUtil.getInstance().getValue(request, "giohang");%>
        <a href="<%=Util.fullPath("gio-hang")%>"><i class="fa fa-shopping-cart"></i></a><span
            class="amount"><%=gh != null ? gh.totalCount() : 0%></span>
    </li>
</ul>
<script src="assets/js/search_key.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        let wrap = $('.wrap-suggestion');
        $('#search').on('keyup', function () {
            let input = $('#search').val();
            if (input === "") {
                wrap.css("display", "none").html("");
            } else {
                $.ajax({
                    method: 'POST',
                    url: 'search',
                    data: {input: input},
                    success: function (result) {
                        if (result === "empty") {
                            wrap.css("display", "none");
                        } else {
                            wrap.css("display", "block");
                            wrap.html(result);
                        }
                    }
                })
            }
        });
    })
</script>
</body>
</html>