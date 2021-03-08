<%@ page import="MODEL.ThanhVien" %>
<%@ page import="Utils.SessionUtil" %>
<%@ page import="website.model.GioHang" %>
<%@ page import="website.model.Item" %>
<%@ page import="libs.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Cart</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>

<body>
<!--header-->
<%@include file="Libs/header-simple.jsp" %>
<!--header-->
<section id="body">
    <div id="frame-cart">
        <div class="container d-flex">
            <div id="info-product">
                <div class="title-top space-between">
                    <div class="title-ic">
                        <%ThanhVien thanhVien = (ThanhVien) session.getAttribute("USER");%>
                        <%GioHang giohang = (GioHang) request.getAttribute("GH");%>
                        <span><i class="fa fa-shopping-cart"></i>Giỏ hàng của bạn(có</span>
                        <span id="count-pro"><%=giohang.totalCount()+" "%></span><span>sản phẩm)</span>
                    </div>
                    <%String follow = (String) getServletConfig().getServletContext().getAttribute("follow");%>
                    <a href="<%=follow!=null?Util.fullPath(follow):"/trang-chu"%>">Tiếp tục mua hàng</a>
                </div>
                <div class="contain-product">
                    <ul>
                        <%if (!giohang.getItem().isEmpty()) {%>
                        <%for (Item item : giohang.getItem()) {%>
                        <li class="item-cart">
                            <div class="d-flex">
                                <div class="img-pro"><a
                                        href="<%=Util.fullPath("chi-tiet-san-pham")%>?id=<%=item.getId()%>">
                                    <img src="<%=Util.fullPath(item.getSanPham().getHinhAnh())%>" alt=""/>
                                </a>
                                </div>
                                <div class="tit-cou">
                                    <h5><%=item.getSanPham().getTenSanPham()%>
                                    </h5>
                                    <div class="d-flex align-i-center">
                                        <span class="count">Số lượng:</span>
                                        <div class="frame-num d-flex">
                                            <button class="subject">-</button>
                                            <input type="number" class="number-pro" value="<%=item.getSoLuong()%>"
                                                   min="1" required>
                                            <button class="plus">+</button>
                                            <input type="hidden" class="msp"
                                                   value="<%=item.getSanPham().getMaSanPham()%>">
                                        </div>
                                        <span class="upgrade"><i class="fa fa-upload" aria-hidden="true"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="price-pro flex-direction-col">
                                <div class="flex-direction-col">
                                    <span class="price"><%=String.format("%,.0f", item.getGia()) + "đ"%></span>
                                    <span>(Giá đã bao gồm VAT)</span>
                                </div>
                                <input type="hidden" class="msp-trash" value="<%=item.getSanPham().getMaSanPham()%>">
                                <input type="hidden" class="tensp-trash" value="<%=item.getSanPham().getTenSanPham()%>">
                                <span class="trash"><i class="fa fa-trash" aria-hidden="true"></i></span>
                            </div>
                        </li>
                        <%}%>
                        <%}else{%>
                        <div class="cart-empty">Không có gì trong giỏ hàng.</div>
                        <%}%>
                    </ul>
                </div>
                <div class="payment space-between">
                    <div class="total d-flex align-i-center">
                        <%if(!giohang.getItem().isEmpty()){%>
                        <h5>TỔNG CỘNG</h5>
                        <span id="total"><%=String.format("%,.0f", giohang.totalPrice()) + "đ"%></span>
                        <%}%>
                    </div>
                    <%if (giohang.getItem() != null && giohang.getItem().size() > 0) {%>
                    <%if(thanhVien!=null){%>
                    <button onclick="return location.href='<%=Util.fullPath("thanh-toan")%>'" id="btn-submit">ĐẶT HÀNG</button>
                    <%}else{%>
                    <button data-toggle="modal" data-target="#checkout" id="btn-submit">ĐẶT HÀNG</button>
                    <div id="checkout" class="modal fade modal-confirm" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-body">
                                    <p class="text-content">Đăng nhập để thực hiện đặt hàng!</p>
                                </div>
                                <div class="modal-footer">
                                    <%getServletConfig().getServletContext().setAttribute("follow-login", "gio-hang");%>
                                    <button type="button" onclick="return location.href='<%=Util.fullPath("dang-nhap")%>'" class="btn-cf">Đăng nhập</button>
                                    <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <%}%>
                </div>
            </div>
            <div id="info-user">
                <div class="title-top title-ic">
                    <span>Thông tin nhận hàng</span>
                </div>
                <div class="form-info form-cart">
                    <form id="form-validate" class="form-style" action="#">
                        <div>
                            <span>Họ và Tên:</span>
                            <input type="text" id="full-name" name="full-name" value="<%=thanhVien!=null?thanhVien.getHoTen():""%>"
                                   disabled>
                        </div>
                        <div>
                            <span>Số điện thoại:</span>
                            <input name="sdt" id="sdt" type="number" value="<%=thanhVien!=null?thanhVien.getSoDienThoai():""%>" disabled>
                        </div>
                        <div>
                            <span>Địa chỉ Email:</span>
                            <input type="text" id="email" name="email" value="<%=thanhVien!=null?thanhVien.getEmail():""%>" disabled>
                        </div>
                        <div>
                            <span>Địa chỉ:</span>
                            <input type="text" id="address-oder" name="address-oder" value="<%=thanhVien!=null?thanhVien.getDiaChi():""%>"
                                   disabled>
                        </div>
                    </form>
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
<!--js page-->
<script src="assets/js/cart.js"></script>
<!--js page-->
<!--js--end-->
</body>

</html>