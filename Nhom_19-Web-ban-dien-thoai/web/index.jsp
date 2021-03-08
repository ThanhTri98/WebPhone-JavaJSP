<%@ page import="MODEL.SanPham" %>
<%@ page import="website.dao.CategoryDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="MODEL.TinTuc" %>
<%@ page import="website.dao.NewsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home</title>
    <%@include file="Libs/fragment-header.jsp" %>
    <link rel="stylesheet" href="assets/libs/slick/slick.css">
    <link rel="stylesheet" href="assets/libs/slick/slick-theme.css">
    <!--    css-->
</head>

<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div id="banner">
        <div class="container d-flex">
            <div class="contain-slide">
                <div id="icon-pre" class="icon-flow"><i class="fa fa-angle-left" aria-hidden="true"></i></div>
                <div id="icon-next" class="icon-flow"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
                <div class="slides">
                    <div id="s1" class="slide">
                        <img src="assets/img/slider/1.png" alt="">
                    </div>
                    <div class="slide">
                        <img src="assets/img/slider/2.jpg" alt="">
                    </div>
                    <div class="slide">
                        <img src="assets/img/slider/3.png" alt="">
                    </div>
                    <div class="slide">
                        <img src="assets/img/slider/4.png" alt="">
                    </div>
                    <div class="slide">
                        <img src="assets/img/slider/5.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="news-banner">
                <div class="news-img news-bd">
                    <div class="news-img-top news-bd">
                        <a href="#"><img src="assets/img/news/news-img-1.png" height="110" width="398" alt=""/></a>
                    </div>
                    <div class="news-img-bot news-bd">
                        <a href="#"><img src="assets/img/news/new-img-2.png" height="110" width="398" alt=""/></a>
                    </div>
                </div>
                <div class="news-text news-bd">
                    <div class="news-text-title space-between">
                        <h6>TIN CÔNG NGHỆ NỔI BẬT</h6>
                        <a href="news.jsp">Xem tất cả</a>
                    </div>
                    <div class="news-text-img">
                        <%try {%>
                        <%List<TinTuc> dstt = NewsDAO.loadTinTuc();%>
                        <%if (dstt != null) {%>
                        <%for (int i = 0; i < 8; i++) {%>
                        <div class="news-text-img-subs space-between">
                            <div class="img-news"><a href="">
                                <img src="<%=Util.fullPath(dstt.get(i).getAnhMoTa())%>" alt=""/></a></div>
                            <div class="text-news"><a
                                    href="<%=Util.fullPath("chi-tiet-tin-tuc")%>?id=<%=dstt.get(i).getMaTinTuc()%>"><%=dstt.get(i).getTieuDe()%>
                            </a></div>
                        </div>
                        <%}%>
                        <%}%>
                        <%} catch (SQLException e) {%>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-home container"><img src="assets/img/banner/1200-75-1200x75.png" alt=""></div>
    <div id="products">
        <div class="container">
            <div id="main-products">
                <div class="title-product"><a href="#"><h2>SẢN PHẨM MỚI</h2></a></div>
                <div class="new-products box-shadow hover-ab">
                    <div class="autoplay slider" data-sizes="50vw">
                        <%--                        0:new, 1Hot, 2Sale--%>
                        <%try {%>
                        <%
                            List<SanPham> dsss_new = CategoryDAO.findCateByType(0);
                        %>
                        <%if (dsss_new != null) {%>
                        <%for (SanPham sp : dsss_new) {%>
                        <div class="owl-item">
                            <div class="item">
                                <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=sp.getMaSanPham()%>">
                                    <img src="<%=Util.fullPath(sp.getHinhAnh())%>" alt=""/>
                                    <%if (sp.getTenSanPham().length() < 10) {%>
                                    <h3 style="text-align: center"><%=sp.getTenSanPham()%>
                                    </h3>
                                    <%} else {%>
                                    <h3><%=sp.getTenSanPham()%>
                                    </h3>
                                    <%}%>
                                    <div class="price">
                                        <%if (sp.getGiaDaGiam() < sp.getGiaBan()) {%>
                                        <span><%=String.format("%, .0f", sp.getGiaBan())%>đ</span>
                                        <strong><%=String.format("%, .0f", sp.getGiaDaGiam())%>đ</strong>
                                        <%} else {%>
                                        <strong><%=String.format("%, .0f", sp.getGiaDaGiam())%>đ</strong>
                                        <%}%>
                                    </div>
                                    <%if (sp.getGiaDaGiam() < sp.getGiaBan()) {%>
                                    <label class="discount">GIẢM <%=String.format("%, .0f", (sp.getGiaBan() - sp.getGiaDaGiam())) + "đ"%>
                                    </label>
                                    <%}%>
                                </a>
                            </div>
                        </div>
                        <%}%>
                        <%}%>
                        <%} catch (SQLException e) {%>
                        <%}%>


                    </div>
                </div>
                <div class="title-product"><a href="#"><h2>SẢN PHẨM HOT</h2></a></div>
                <div class="hot-products box-shadow hover-ab">
                    <div class="regular slider" data-sizes="50vw">
                        <%try {%>
                        <%
                            List<SanPham> dsss_hot = CategoryDAO.findCateByTypeAndPrice(1, 5000000);
                        %>
                        <%if (dsss_hot != null) {%>
                        <%for (int i = 0; i < dsss_hot.size() && i < 24; i++) {%>
                        <div>
                            <div class="owl-item">
                                <div class="item">
                                    <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=dsss_hot.get(i).getMaSanPham()%>">
                                        <img src="<%=Util.fullPath(dsss_hot.get(i).getHinhAnh())%>" alt=""/>
                                        <h3><%=dsss_hot.get(i).getTenSanPham()%>
                                        </h3>
                                        <div class="price">
                                            <%if (dsss_hot.get(i).getGiaDaGiam() < dsss_hot.get(i).getGiaBan()) {%>
                                            <span><%=String.format("%, .0f", dsss_hot.get(i).getGiaBan()) + "đ"%></span>
                                            <strong><%=String.format("%, .0f", dsss_hot.get(i).getGiaDaGiam()) + "đ"%>
                                            </strong>
                                            <%} else {%>
                                            <strong><%=String.format("%, .0f", dsss_hot.get(i).getGiaDaGiam()) + "đ"%>
                                            </strong>
                                            <%}%>
                                        </div>
                                        <%if (dsss_hot.get(i).getGiaDaGiam() < dsss_hot.get(i).getGiaBan()) {%>
                                        <label class="discount">GIẢM <%=String.format("%, .0f", (dsss_hot.get(i).getGiaBan() - dsss_hot.get(i).getGiaDaGiam())) + "đ"%>
                                        </label>
                                        <%
                                            }
                                            i++;
                                        %>
                                    </a>

                                </div>
                            </div>
                            <div class="owl-item">
                                <div class="item">
                                    <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=dsss_hot.get(i).getMaSanPham()%>">
                                        <img src="<%=Util.fullPath(dsss_hot.get(i).getHinhAnh())%>" alt=""/>
                                        <h3><%=dsss_hot.get(i).getTenSanPham()%>
                                        </h3>
                                        <div class="price">
                                            <%if (dsss_hot.get(i).getGiaDaGiam() < dsss_hot.get(i).getGiaBan()) {%>
                                            <span><%=String.format("%, .0f", dsss_hot.get(i).getGiaBan()) + "đ"%></span>
                                            <strong><%=String.format("%, .0f", dsss_hot.get(i).getGiaDaGiam()) + "đ"%>
                                            </strong>
                                            <%} else {%>
                                            <strong><%=String.format("%, .0f", dsss_hot.get(i).getGiaDaGiam()) + "đ"%>
                                            </strong>
                                            <%}%>
                                        </div>
                                        <%if (dsss_hot.get(i).getGiaDaGiam() < dsss_hot.get(i).getGiaBan()) {%>
                                        <label class="discount">GIẢM <%=String.format("%, .0f", (dsss_hot.get(i).getGiaBan() - dsss_hot.get(i).getGiaDaGiam())) + "đ"%>
                                        </label>
                                        <%}%>
                                    </a>

                                </div>
                            </div>
                        </div>
                        <%}%>
                        <%}%>
                        <%} catch (SQLException e) {%>
                        <%}%>

                    </div>

                </div>
                <div class="title-product"><a href="#"><h2>SẢN PHẨM KHUYẾN MẠI</h2></a></div>
                <div class="sale-products box-shadow hover-ab">
                    <div class="regular slider" data-sizes="50vw">
                        <%try {%>
                        <%
                            ResultSet rs = CategoryDAO.findCateByTypeAndGift(2);
                            int count = 0;
                        %>
                        <%if (rs != null) {%>
                        <%while (rs.next() && count < 24) {%>
                        <div>
                            <div class="owl-item">
                                <div class="item">
                                    <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=rs.getString("masanpham")%>">
                                        <img src="<%=Util.fullPath(rs.getString("hinhanh"))%>" alt=""/>
                                        <h3><%=rs.getString("tensanpham")%>
                                        </h3>
                                        <div class="price">
                                            <%if (rs.getDouble("giadagiam") < rs.getDouble("giaban")) {%>
                                            <span><%=String.format("%, .0f", rs.getDouble("giaban"))%>đ</span>
                                            <strong><%=String.format("%, .0f", rs.getDouble("giadagiam"))%>đ</strong>
                                            <%} else {%>
                                            <strong><%=String.format("%, .0f", rs.getDouble("giadagiam"))%>đ</strong>
                                            <%}%>
                                        </div>
                                        <%if (rs.getString("quatang") != null) {%>
                                        <div class="promo noimage">
                                            <p><%=rs.getString("quatang")%>
                                            </p>
                                        </div>
                                        <%}%>
                                        <%if (rs.getDouble("giadagiam") < rs.getDouble("giaban")) {%>
                                        <label class="discount">GIẢM <%=String.format("%, .0f", (rs.getDouble("giaban") - rs.getDouble("giadagiam"))) + "đ"%>
                                        </label>
                                        <%
                                            }
                                            count++;
                                            rs.next();
                                        %>
                                    </a>

                                </div>
                            </div>
                            <div class="owl-item">
                                <div class="item">
                                    <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=rs.getString("masanpham")%>">
                                        <img src="<%=Util.fullPath(rs.getString("hinhanh"))%>" alt=""/>
                                        <h3><%=rs.getString("tensanpham")%>
                                        </h3>
                                        <div class="price">
                                            <%if (rs.getDouble("giadagiam") < rs.getDouble("giaban")) {%>
                                            <span><%=String.format("%, .0f", rs.getDouble("giaban"))%>đ</span>
                                            <strong><%=String.format("%, .0f", rs.getDouble("giadagiam"))%>đ</strong>
                                            <%} else {%>
                                            <strong><%=String.format("%, .0f", rs.getDouble("giadagiam"))%>đ</strong>
                                            <%}%>
                                        </div>
                                        <%if (rs.getString("quatang") != null) {%>
                                        <div class="promo noimage">
                                            <p><%=rs.getString("quatang")%>
                                            </p>
                                        </div>
                                        <%}%>
                                        <%if (rs.getDouble("giadagiam") < rs.getDouble("giaban")) {%>
                                        <label class="discount">GIẢM <%=String.format("%, .0f", (rs.getDouble("giaban") - rs.getDouble("giadagiam"))) + "đ"%>
                                        </label>
                                        <%
                                            }
                                            count++;
                                        %>
                                    </a>

                                </div>
                            </div>
                        </div>
                        <%}%>
                        <%}%>
                        <%} catch (SQLException e) {%>
                        <%}%>


                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer.jsp" %>
<!--footer-->


<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<!--js--page-->
<script src="assets/js/slides-banner.js"></script>
<script src="assets/libs/slick/slick-types.js"></script>
<script src="assets/libs/slick/slick.js"></script>
<!--js page-->
<!--js--end-->

</body>

</html>