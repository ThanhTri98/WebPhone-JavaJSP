<%@ page import="MODEL.ChiTietSanPham" %>
<%@ page import="libs.Util" %>
<%@ page import="MODEL.BinhLuan" %>
<%@ page import="java.util.List" %>
<%@ page import="website.dao.CommentDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Chi Tiet San Pham</title>
    <%@include file="Libs/fragment-header.jsp" %>
    <style>
        #products {
            padding: 20px 0;
        }
    </style>
    <!--    style page-->
    <!--    css-->
</head>
<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div id="products">
        <div class="container">
            <div id="frame-detail" class="d-flex">
                <%
                    ChiTietSanPham ctsp = (ChiTietSanPham) request.getAttribute("ctsp");
                    assert ctsp != null;
                %>
                <div class="img-products">
                    <img src="<%=ctsp.getSanPham().getHinhAnh()%>" alt=""/>
                </div>
                <div class="detail-products">
                    <div class="title-top">
                        <h3><%=ctsp.getSanPham().getTenSanPham()%>
                        </h3>
                        <div class="d-flex">
                            <div class="text-producer d-flex">
                                <span>Thương hiệu:</span>
                                <span id="producer"><%=ctsp.getSanPham().getNhaCungCap()%></span>
                            </div>
<%--                            <div class="id-products d-flex">--%>
<%--                                <span>Mã sản phẩm:</span>--%>
<%--                                <span id="id-pro"><%=ctsp.getSanPham().getMaSanPham()%></span>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    <div class="price">
                        <div class="align-i-center">
                            <%if (ctsp.getSanPham().getGiaDaGiam() < ctsp.getSanPham().getGiaBan()) {%>
                            <strong><%=String.format("%, .0f", ctsp.getSanPham().getGiaDaGiam()) + "đ"%>
                                <span style="margin-right: 5px;font-size: 13px;"><%=String.format("%, .0f", ctsp.getSanPham().getGiaBan()) + "đ"%></span>
                            </strong>
                            <%} else {%>
                            <strong><%=String.format("%, .0f", ctsp.getSanPham().getGiaDaGiam()) + "đ"%>
                            </strong>
                            <%}%>
                        </div>
                        <span class="vat">(Đã bao gồm VAT)</span>
                    </div>
                    <div class="guarantee d-flex">
                        <span>Bảo hành: 24 tháng.</span>
                        <a href="guarentee.jsp">(Quy định bảo hành)</a>
                    </div>
                    <div class="add-to-cart d-flex">
                        <input type="hidden" class="msp-ajax" value="<%=ctsp.getSanPham().getMaSanPham()%>">
                        <button class="btn_buynow buy-ajax">THÊM VÀO GIỎ HÀNG</button>
                    </div>
                </div>
            </div>
            <div id="cmt-rating" class="justify-space-between">
                <div class="cmt">
                    <div class="info-tech">
                        <div>
                            <h4>THÔNG SỐ KỸ THUẬT</h4>
                            <ul>
                                <li><b>Màn hình</b>: <%=ctsp.getThongSoKyThuat().getManHinh()%>
                                </li>
                                <li><b>CPU</b>: <%=ctsp.getThongSoKyThuat().getCPU()%>
                                </li>
                                <li><b>RAM</b>: <%=ctsp.getThongSoKyThuat().getRAM()%>
                                </li>
                                <li><b>Camera</b>: <%=ctsp.getThongSoKyThuat().getCAMERA()%>
                                </li>
                                <li><b>PIN</b>: <%=ctsp.getThongSoKyThuat().getPIN()%>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="rating cmt-cus">
                        <%try {%>
                        <%List<BinhLuan> bls = CommentDAO.loadCmt(ctsp.getSanPham().getMaSanPham());%>
                        <ul>
                            <%if (bls != null) {%>
                            <h6>Có <%=bls.size()%> bình luận</h6>
                            <%for (BinhLuan bl : bls) {%>
                            <li class="cus">
                                <h6><%=bl.getHoTen()%></h6>
                                <span class="date"><%=bl.getNgayBinhLuan()%></span>
                                <p><%=bl.getNoiDung()%></p>
                            </li>
                            <%}%>
                            <%}else{%>
                            <h6>Chưa có bình luận</h6>
                            <%}%>
                        </ul>
                        <%} catch (SQLException e) {%>
                        <%}%>
                    </div>
                    <h5>Bình luận</h5>
                    <form id="cmt-post"
                          action="<%=Util.fullPath("xu-ly-binh-luan")%>?name=<%=thanhVien!=null?thanhVien.getHoTen():""%>&sp=<%=ctsp.getSanPham().getTenSanPham()%>&msp=<%=ctsp.getSanPham().getMaSanPham()%>"
                          method="post">
                        <textarea id="cmt" name="cmt" placeholder="Mời bạn để lại bình luận..."></textarea>
                        <div class="justify-center btn-detail">
                            <%if (thanhVien != null) {%>
                            <button type="submit" id="post">Gửi bình luận<i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            <%} else {%>
                            <button data-toggle="modal" data-target="#modal-cmt" type="button" id="post">Gửi bình luận<i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            <div id="modal-cmt" class="modal fade modal-confirm" role="dialog">
                                <div class="modal-dialog modal-sm">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <p class="text-content">Đăng nhập để tiếp tục bình luận!</p>
                                        </div>
                                        <div class="modal-footer">
                                            <%getServletConfig().getServletContext().setAttribute("follow-login", "chi-tiet-san-pham?"+request.getQueryString());%>
                                            <button type="button" onclick="return location.href='<%=Util.fullPath("dang-nhap")%>'" class="btn-cf">Đăng nhập</button>
                                            <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </form>

                </div>
                <div style="width: 38%">
                    <div class="rating space-between rt-pro">
                        <a href="#"><img src="<%=ctsp.getSanPham().getHinhAnh()%>" alt=""/></a>
                        <div class="rating-post">
                            <h6><%=ctsp.getSanPham().getTenSanPham()%>
                            </h6>
                            <h6>Đánh giá</h6>
                            <div id="rating">
                                <input type="radio" id="star5" name="rating" value="5"/>
                                <label class="full" for="star5" title="Awesome - 5 stars"></label>

                                <input type="radio" id="star4half" name="rating" value="4 and a half"/>
                                <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>

                                <input type="radio" id="star4" name="rating" value="4"/>
                                <label class="full" for="star4" title="Pretty good - 4 stars"></label>

                                <input type="radio" id="star3half" name="rating" value="3 and a half"/>
                                <label class="half" for="star3half" title="Meh - 3.5 stars"></label>

                                <input type="radio" id="star3" name="rating" value="3"/>
                                <label class="full" for="star3" title="Meh - 3 stars"></label>

                                <input type="radio" id="star2half" name="rating" value="2 and a half"/>
                                <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>

                                <input type="radio" id="star2" name="rating" value="2"/>
                                <label class="full" for="star2" title="Kinda bad - 2 stars"></label>

                                <input type="radio" id="star1half" name="rating" value="1 and a half"/>
                                <label class="half" for="star1half" title="Meh - 1.5 stars"></label>

                                <input type="radio" id="star1" name="rating" value="1"/>
                                <label class="full" for="star1" title="Sucks big time - 1 star"></label>

                                <input type="radio" id="starhalf" name="rating" value="half"/>
                                <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                            </div>
                            <div class="post-rating">
                                <button type="button">Gửi đánh giá của bạn</button>
                            </div>
                        </div>
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
<%@include file="Libs/fragment-footer.jsp" %>
<!--js--end-->
<!--js page-->
<script src="assets/js/addToCart_AJAX.js" type="text/javascript"></script>
<script>
    function calcRate(r) {
        const f = ~~r,//Tương tự Math.floor(r)
            id = 'star' + f + (r % f ? 'half' : '')
        id && (document.getElementById(id).checked = !0)
    }
</script>
<!--js page-->
</body>

</html>