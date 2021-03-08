<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<section id="footer">
    <div id="footer-components">
        <div class="container">
            <div class="footer d-flex">
                <div class="footer-logo" data-aos="fade-up"
                     data-aos-anchor-placement="top-bottom" data-aos-duration="500">
                    <a class="link-home" href="./index.jsp">
                        <div class="logo">
                            <img src="<%=Util.fullPath("assets/img/common/logo-atm.png")%>" height="87" width="128" alt="atm"/>
                        </div>
                    </a>
                    <div class="text-logo"><span class="company-text">Công ty TNHH 3 thành viên ATM</span>
                        <ul>
                            <li>Địa chỉ: Nong Lam University</li>
                            <li>Hotline: 0xx-xxx-xxxx</li>
                            <li>Thời gian làm việc: 9h - 21h</li>
                        </ul>
                    </div>
                </div>
                <div class="footer-about-us" data-aos="fade-up"
                     data-aos-anchor-placement="top-bottom" data-aos-duration="700">
                    <div class="title"><span>VỀ ATM</span></div>
                    <ul>
                        <li>Võ Thanh Trí - 17130254</li>
                        <li>Ngô Vĩ An - 17130002</li>
                        <li>Lý Đức Mạnh - 17130120</li>
                    </ul>
                </div>
                <div class="footer-support" data-aos="fade-up"
                     data-aos-anchor-placement="top-bottom" data-aos-duration="900">
                    <div class="title"><span>HỖ TRỢ KHÁCH HÀNG</span></div>
                    <ul>
                        <li><a href="#">Phương thức đặt hàng</a></li>
                        <li><a href="#">Phương thức giao hàng</a></li>
                        <li><a href="#">Phương thức thanh toán</a></li>
                        <li><a href="#">Chính sách đổi trả</a></li>
                        <li><a href="./guarentee.jsp">Quy định bảo hành</a></li>
                    </ul>
                </div>
                <div class="footer-social" data-aos="fade-up"
                     data-aos-anchor-placement="top-bottom" data-aos-duration="1100">
                    <div class="title"><span>KẾT NỐI VỚI ATM</span>
                    </div>
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="copyright-atm">
    <span><i class="fa fa-copyright" aria-hidden="true"></i>Copyright 2019 ATM. Design by ATM</span>
</div>
<!--back-to-top-->
<div class='back-to-top'>
    <div>
        <i class="fa fa-chevron-up" aria-hidden="true"></i>
    </div>
</div>
<!--back-to-top-->
</body>
</html>