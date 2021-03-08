<%@ page import="MODEL.ChiTietSanPham" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>San Pham</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>
<%
    List<ChiTietSanPham> ds_ctsp = (List<ChiTietSanPham>) request.getAttribute("category");
    String producer = (String) request.getAttribute("producer");
%>
<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div id="products">
        <div class="container">
            <div id="main-products">
                <div class="banner-product">
                    <%if (producer != null) {%>
                    <img src="assets/img/banner/banner_<%=producer%>.png" alt=""/>
                    <%}%>
                </div>
                <div class="product-child box-shadow hover-ab">
                    <%Integer count_sear = (Integer) request.getAttribute("count_sear");%>
                    <%if(count_sear!=null){%>
                    <div class="result-sear">
                        <h4>Tìm thấy<strong class="count_sear"><%=count_sear%></strong>kết quả</h4>
                    </div>
                    <%}%>
                    <%
                        String sort = (String) request.getAttribute("active");
                        String pages = (String) request.getAttribute("page");
                    %>
                    <%if(key==null){%>
                    <div class="sort">
                        <a href="<%=Util.fullPath("DienThoai")%>?cate=<%=producer%>&page=<%=pages!=null?pages:""%>"
                           class="click-sort
                           <%=sort==null?" active":""%>">Mới nhất</a>
                        <a href="<%=Util.fullPath("DienThoai")%>?cate=<%=producer%>&type=asc&page=<%=pages!=null?pages:""%>"
                           class="click-sort
                            <%=sort!=null&&sort.equalsIgnoreCase("asc")?" active":""%>">Giá: Thấp - Cao</a>
                        <a href="<%=Util.fullPath("DienThoai")%>?cate=<%=producer%>&type=desc&page=<%=pages!=null?pages:""%>"
                           class="click-sort
                            <%=sort!=null&&sort.equalsIgnoreCase("desc")?" active":""%>">Giá: Cao - Thấp</a>
                    </div>
                    <%}%>
                    <ul class="homeproduct filter-cate ">
                        <%if (ds_ctsp != null) {%>
                        <%for (ChiTietSanPham ctsp : ds_ctsp) {%>
                        <li>
                            <a href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=ctsp.getSanPham().getMaSanPham()%>">
                                <img src="<%=ctsp.getSanPham().getHinhAnh()%>" alt=""/>
                                <h3><%=ctsp.getSanPham().getTenSanPham()%>
                                </h3>

                                <div class="price">
                                    <%if (ctsp.getSanPham().getGiaDaGiam() < ctsp.getSanPham().getGiaBan()) {%>
                                    <span><%=String.format("%, .0f", ctsp.getSanPham().getGiaBan()) + "đ"%></span>
                                    <strong><%=String.format("%, .0f", ctsp.getSanPham().getGiaDaGiam()) + "đ"%>
                                    </strong>
                                    <%} else {%>
                                    <strong><%=String.format("%, .0f", ctsp.getSanPham().getGiaDaGiam()) + "đ"%>
                                    </strong>
                                    <%}%>
                                </div>
                                <div class="ratingresult">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <%if (ctsp.getXepHang() == 4.0) {%>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color: darkgray"></i>
                                    <%} else if (ctsp.getXepHang() == 4.5) {%>
                                    <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color: darkgray"></i>
                                    <%} else if (ctsp.getXepHang() == 5.0) {%>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <%} else {%>
                                    <i class="fa fa-star" aria-hidden="true" style="color: darkgray"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color: darkgray"></i>
                                    <%}%>
                                    <span><%=ctsp.getDanhGia() + " đánh giá"%></span>
                                </div>
                                <div class="promo noimage">
                                    <%if (ctsp.getQuaTang() != null) {%>
                                    <p><%=ctsp.getQuaTang()%>
                                    </p>
                                    <%}%>
                                </div>
                                <figure class="bginfo">
                                    <span><%=ctsp.getThongSoKyThuat().getManHinh()%></span>
                                    <span><%=ctsp.getThongSoKyThuat().getHeDieuHanh()%></span>
                                    <span><%=ctsp.getThongSoKyThuat().getCPU()%></span>
                                    <span><%=ctsp.getThongSoKyThuat().getRAM()%></span>
                                    <span><%=ctsp.getThongSoKyThuat().getCAMERA()%></span>
                                    <span><%=ctsp.getThongSoKyThuat().getPIN()%></span>
                                </figure>
                                <%if (ctsp.getSanPham().getGiaDaGiam() < ctsp.getSanPham().getGiaBan()) {%>
                                <label class="discount">GIẢM <%=String.format("%, .0f", (ctsp.getSanPham().getGiaBan() - ctsp.getSanPham().getGiaDaGiam())) + "đ"%>
                                </label>
                                <%}%>
                            </a>
                            <div class="btnbuy justify-center">
                                <div class="hover-btn-cart">
                                    <input type="hidden" class="msp-ajax" value="<%=ctsp.getSanPham().getMaSanPham()%>">
                                    <button class="btn_buynow buy-ajax">Thêm vào giỏ<i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
<%--                                    <p class="dia-log">+1</p>--%>
                                </div>
                            </div>
                        </li>
                        <%}%>
                        <%}%>
                    </ul>
                    <%if(key==null){%>
                    <div class="container pagina">
                        <div class="pagination" id="pagination"></div>
                    </div>
                    <input type="hidden" id="countPages" value="<%=request.getAttribute("countPages")%>">
                    <input type="hidden" id="producer" value="<%=producer%>">
                    <input type="hidden" id="page" value="<%=pages!=null?pages:""%>">
                    <input type="hidden" id="sort" value="<%=sort!=null?sort:""%>">
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp" %>
<!--footer-->
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<!--js--end-->
</body>
<script src="assets/js/pagination/jquery.twbsPagination.min.js" type="text/javascript"></script>
<script src="assets/js/addToCart_AJAX.js" type="text/javascript"></script>
<script>

</script>
<%if(key==null){%>
<script type="text/javascript">
    $(function () {
        let pages = parseInt($('#page').val());
        let countPage = parseInt($('#countPages').val());
        let totalPages = parseInt((countPage / 8).toString());
        let producer = $('#producer').val().toLowerCase();
        let sort = $('#sort').val();
        $('#pagination').twbsPagination({
            totalPages: totalPages,
            startPage: pages,
            visiblePages: totalPages - 1,
            onPageClick: function (event, page) {
                if (page !== pages) {
                    if (sort === "") {
                        return location.href = "http://localhost:8080/DienThoai?cate=" + producer + "&page=" + page;
                    } else {
                        return location.href = "http://localhost:8080/DienThoai?cate=" + producer + "&type=" + sort + "&page=" + page;
                    }
                }
            }
        });
    });
</script>
<%}%>
</html>