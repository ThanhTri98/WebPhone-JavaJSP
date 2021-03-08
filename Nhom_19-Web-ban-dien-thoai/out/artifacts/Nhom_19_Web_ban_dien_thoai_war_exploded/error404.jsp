<%@ page import="libs.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>404 Error</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>
<body>
<!--header-->
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
<!--header-->
<section id="body">
    <div id="error404">
        <div class="container">
            <div class="content-error">
                <div class="main-error">
                    <div class="img-error">
                        <img src="<%=Util.fullPath("assets/img/common/404.jpg")%>" height="513" width="767" alt=""/>
                    </div>

                    <div class="right-error">
                        <div class="error_title">404 ERROR!</div>
                        <div class="error_text">Trang bạn đang tìm kiếm không tồn tại. Chúng tôi xin lỗi vì sự bất tiện
                            này.
                        </div>
                        <div class="back-home"><a href="index.jsp" class="error_back"><i class="fa fa-home"
                                                                                         aria-hidden="true"></i>Quay Lại
                            Trang Chủ</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp" %>
<!--footer-->
<!--js--start-->
<script src="<%=Util.fullPath("assets/bootstrap/js/bootstrap.min.js")%>"></script>
<script src="<%=Util.fullPath("assets/js/bs-animation.js")%>"></script>

<!--js--end-->
</body>

</html>