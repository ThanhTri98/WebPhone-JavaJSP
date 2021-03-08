<%@ page import="java.util.List" %>
<%@ page import="MODEL.TinTuc" %>
<%@ page import="website.dao.NewsDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Tin Tuc</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>
<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div id="news" class="bg-news">
        <div class="container">
            <div class="content-news justify-space-between">
                <div class="news-new">
                    <h5>TIN TỨC MỚI NHẤT</h5>
                    <div class="content-left">
                        <%try {%>
                        <%List<TinTuc> dstt = NewsDAO.loadTinTuc();%>
                        <%if(dstt!=null){%>
                        <%for(TinTuc tt:dstt){%>
                        <%if(tt.getLoai()==0){%>
                        <div class="frame-content">
                            <a href="<%=Util.fullPath("chi-tiet-tin-tuc")%>?id=<%=tt.getMaTinTuc()%>">
                                <div class="img-news">
                                    <img src="<%=Util.fullPath(tt.getAnhMoTa())%>" alt="">
                                </div>
                                <div class="title-news">
                                    <h6><%=tt.getTieuDe()%></h6>
                                    <span class="date"><%=tt.getNgayViet()%></span>
                                    <figure class="content-news-main"><%=tt.getMoTa()%>...</figure>
                                </div>
                            </a>
                        </div>
                        <%}%>
                        <%}%>
                        <%}%>
                    </div>
                    <div class="justify-center see-plus-news">
                        <button class="see-btn-news" type="button">Xem thêm<i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="sale-new">
                    <h5>TIN KHUYẾN MÃI MỚI NHẤT</h5>
                    <div class="content-right">
                        <%if(dstt!=null){%>
                        <%for(TinTuc tt:dstt){%>
                        <%if(tt.getLoai()==1){%>
                        <div class="news-text-img-subs">
                            <a href="<%=Util.fullPath("chi-tiet-tin-tuc")%>?id=<%=tt.getMaTinTuc()%>">
                                <div class="img-news">
                                    <img src="<%=Util.fullPath(tt.getAnhMoTa())%>" alt=""/>
                                </div>
                                <figure>
                                    <div class="text-news"><%=tt.getTieuDe()%></div>
                                    <span class="date"><%=tt.getNgayViet()%></span>
                                    <p class="content-sale"><%=tt.getMoTa()%></p>
                                </figure>
                            </a>
                        </div>
                        <%}%>
                        <%}%>
                        <%}%>
                    </div>
                    <div class="justify-center see-plus-news">
                        <button class="see-btn-news" type="button">Xem thêm<i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <%} catch (SQLException e) {%>
                <%}%>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp" %>
<!--footer-->
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<!--js page-->
<script>
    $(document).ready(function () {
        $('.see-btn-news').click(function () {
            let parent = this.parentNode.parentNode;
            let child = parent.children.item(1);
            if (this.innerHTML.includes('Xem thêm')) {
                this.innerHTML = this.innerHTML.replace('Xem thêm', 'Thu gọn');
                child.style.height = 'max-content';
            } else {
                this.innerHTML = this.innerHTML.replace('Thu gọn', 'Xem thêm');
                child.style.height = '500px';
            }

        });
    });
</script>
<!--js page-->
<!--js--start-->
</body>

</html>