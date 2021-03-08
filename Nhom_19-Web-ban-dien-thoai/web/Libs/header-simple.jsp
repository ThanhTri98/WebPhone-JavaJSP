<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<div id="header-top">
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
    <div id="main-header" class="header-cart">
        <div class="container">
            <div class="header-logo space-between">
                <div class="header-main-logo d-flex space-between header-simple">
                    <a href="./index.jsp" class="logo">
                        <img src="./assets/img/common/logo-atm.png" height="87" width="128" alt="atm"/>
                    </a>
                </div>
                <div class="hotline">
                    <div class="icon-phone"><i class="fa fa-phone" aria-hidden="true"></i></div>
                    <div class="text-phone">
                        <span>Hotline</span>
                        <h6>0xx-xxx-xxxx</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>