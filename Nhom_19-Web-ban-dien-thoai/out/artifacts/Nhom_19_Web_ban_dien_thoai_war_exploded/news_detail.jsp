<%@ page import="MODEL.TinTuc" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="website.dao.NewsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Chi Tiet Tin Tuc</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>
<body>
<!--header-->
<%@include file="Libs/header.jsp"%>
<!--header-->
<section id="body">
    <div id="news-detail" class="bg-news">
        <div class="container">
            <div class="content-news justify-space-between">
                <%TinTuc tintuc = (TinTuc) request.getAttribute("tintuc");%>
                <%if(tintuc!=null){%>
                <div class="content-post">
                    <h5 id="title-news"><%=tintuc.getTieuDe()%></h5>
                    <span class="date"><%=tintuc.getNgayViet()%></span>
                    <div class="content-left">
                        <%=tintuc.getNoiDung()%>
                        <div class="author"><b>Theo: </b><span>ATM</span></div>
                    </div>
                </div>
                <%}else{
                    response.sendRedirect(Util.fullPath("news.jsp"));
                }%>
                <div class="frame-hot-post">
                    <div class="hot-post">
                        <h5>BÀI VIẾT NỔI BẬT</h5>
                        <div class="content-right">
                            <%try{%>
                            <%List<TinTuc> dstt = NewsDAO.loadTinTuc();%>
                            <%if(dstt!=null){%>
                            <%for(int i =0;i<16;i++){%>
                            <div class="news-text-img-subs">
                                <a href="<%=Util.fullPath("chi-tiet-tin-tuc")%>?id=<%=dstt.get(i).getMaTinTuc()%>">
                                    <div class="img-news">
                                        <img src="<%=Util.fullPath(dstt.get(i).getAnhMoTa())%>" alt=""/>
                                    </div>
                                    <figure>
                                        <div class="text-news"><%=dstt.get(i).getTieuDe()%></div>
                                        <span class="date"><%=dstt.get(i).getNgayViet()%></span>
                                        <p class="content-sale"><%=dstt.get(i).getMoTa()%></p>
                                    </figure>
                                </a>
                            </div>
                            <%}%>
                            <%}%>
                            <%}catch (SQLException e){%>
                            <%}%>

                        </div>
                    </div>
                    <div class="social">
                        <h5>THEO DÕI ATM TRÊN SOCIAL</h5>
                        <div class="icon-social d-flex justify-content-around">
                            <div class="ss-facebook justify-center">
                                <i class="fa fa-facebook"></i>
                                <span>FACEBOOK</span>
                            </div>
                            <div class="ss-youtube justify-center">
                                <i class="fa fa-youtube-play"></i>
                                <span>YOUTUBE</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp"%>
<!--footer-->
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp"%>
<!--js--end-->
</body>

</html>