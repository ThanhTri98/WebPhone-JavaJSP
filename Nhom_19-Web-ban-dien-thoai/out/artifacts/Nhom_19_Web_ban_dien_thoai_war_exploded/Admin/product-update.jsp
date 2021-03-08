<%@ page import="MODEL.ChiTietSanPham" %>
<%@ page import="MODEL.NhaCungCap" %>
<%@ page import="admin.dao.ProducerDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="ATM" content="">

    <title>Cập nhật sản phẩm</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <link rel="stylesheet" href="css/form-style.css">

</head>
<body>
<div id="wrapper">
    <%--   frame--%>
    <%@include file="Libs-Admin/frames.jsp" %>
    <%--   frame--%>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="page-bar page-header">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="index.jsp">Home</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Danh mục</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="products-manage.jsp">Quản lý sản phẩm</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading  d-flex">
                            <div>
                                <i class="fa  fa-pencil-square-o fa-fw"></i>
                                Cập nhật sản phẩm
                            </div>
                        </div>
                        <%
                            ChiTietSanPham ctsp = (ChiTietSanPham) request.getAttribute("ctsp");
                            assert ctsp != null;
                        %>
                        <div class="panel-body">
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style"
                                      action="<%=Util.fullPath("Admin/suaPro")%>" method="get">
                                    <input type="hidden" name="action" value="xulysua">
                                    <input type="hidden" name="id-product"
                                           value="<%=ctsp.getSanPham().getMaSanPham()%>">
                                    <ul class="row">
                                        <li class="row">
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="text" id="name-product" name="name-product"
                                                       value="<%=ctsp.getSanPham().getTenSanPham()%>">
                                                <label for="name-product">Tên sản phẩm<span>*</span></label>
                                            </div>
                                            <div class="col-sm-4 col-xs-6">
                                                <select id="type" name="type">
                                                    <%if (ctsp.getSanPham().getLoai() == 0) {%>
                                                    <option value="0">Sản phẩm Mới</option>
                                                    <option value="1">Sản phẩm Hot</option>
                                                    <option value="2">Sản phẩm khuyến mãi</option>
                                                    <%} else if (ctsp.getSanPham().getLoai() == 1) {%>
                                                    <option value="1">Sản phẩm Hot</option>
                                                    <option value="2">Sản phẩm khuyến mãi</option>
                                                    <option value="0">Sản phẩm Mới</option>
                                                    <%} else {%>
                                                    <option value="2">Sản phẩm khuyến mãi</option>
                                                    <option value="1">Sản phẩm Hot</option>
                                                    <option value="0">Sản phẩm Mới</option>
                                                    <%}%>
                                                </select>
                                                <label for="type" class="level-span">Loại</label>
                                            </div>
                                            <div class="col-sm-4 col-xs-6">
                                                <select id="producer" name="producer">
                                                    <%try {%>
                                                    <%List<NhaCungCap> ds_ncc = ProducerDAO.findAll();%>
                                                    <%if (ds_ncc != null) {%>
                                                    <%for (NhaCungCap ncc : ds_ncc) {%>
                                                    <%if (ncc.getTenNhaCungCap().equals(ctsp.getSanPham().getNhaCungCap())) {%>
                                                    <option value="<%=ncc.getTenNhaCungCap()%>"
                                                            selected="selected"><%=ncc.getTenNhaCungCap()%>
                                                    </option>
                                                    <%} else {%>
                                                    <option value="<%=ncc.getTenNhaCungCap()%>"><%=ncc.getTenNhaCungCap()%>
                                                    </option>
                                                    <%}%>
                                                    <%}%>
                                                    <%}%>
                                                    <%} catch (SQLException e) {%>
                                                    <%}%>
                                                </select>
                                                <label for="producer" class="level-span">Nhà cung
                                                    cấp<span>*</span></label>
                                            </div>
                                            <label for="producer" class="level-span">Nhà cung
                                                cấp<span>*</span></label>
                                        <li class="row">
                                            <div class="col-sm-3 col-xs-6">
                                                <input type="number" id="sale-price" name="sale-price"
                                                       value="<%=(long)ctsp.getSanPham().getGiaDaGiam()%>">
                                                <label for="sale-price">Giá đã giảm</label>
                                            </div>
                                            <div class="col-sm-3 col-xs-6">
                                                <input type="number" id="price" name="price"
                                                       value="<%=(long)ctsp.getSanPham().getGiaBan()%>">
                                                <label for="price">Giá bán</label>
                                            </div>
                                            <div class="col-sm-2 col-xs-6">
                                                <input type="number" id="count-product" name="count-product"
                                                       value="<%=ctsp.getSanPham().getSoLuong()%>">
                                                <label for="count-product">Số lượng<span>*</span></label>
                                            </div>
                                            <div class="col-sm-2 col-xs-6">
                                                <input type="text" id="link-img" name="link-img"
                                                       value="<%=ctsp.getSanPham().getHinhAnh()%>">
                                                <label for="link-img">Hình ảnh</label>
                                            </div>
                                            <div class="col-sm-2 col-xs-6">
                                                <select id="status" name="status">
                                                    <%if (ctsp.getSanPham().getTrangTHai() == 0) {%>
                                                    <option value="0">Ẩn</option>
                                                    <option value="1">Gần hết hàng</option>
                                                    <option value="2">Mở bán</option>
                                                    <%} else if (ctsp.getSanPham().getTrangTHai() == 1) {%>
                                                    <option value="1">Gần hết hàng</option>
                                                    <option value="0">Ẩn</option>
                                                    <option value="2">Mở bán</option>
                                                    <%} else {%>
                                                    <option value="2">Mở bán</option>
                                                    <option value="1">Gần hết hàng</option>
                                                    <option value="0">Ẩn</option>
                                                    <%}%>
                                                </select>
                                                <label for="status" class="level-span">Trạng thái</label>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="row">
                                        <h3 class="col-sm-12"
                                            style="text-align: center;margin-bottom: 20px;color: #215862;font-weight: 600">
                                            Chi tiết sản phẩm</h3>
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-6">
                                                <input type="text" id="gift" name="gift"
                                                       value="<%=ctsp.getQuaTang()!=null?ctsp.getQuaTang():""%>">
                                                <label for="gift">Quà tặng</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="screen" name="screen"
                                                       value="<%=ctsp.getThongSoKyThuat().getManHinh()%>">
                                                <label for="screen">Màn hình</label>
                                            </div>
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="hdh" name="hdh"
                                                       value="<%=ctsp.getThongSoKyThuat().getHeDieuHanh()%>">
                                                <label for="hdh">Hệ điều hành</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="cpu" name="cpu"
                                                       value="<%=ctsp.getThongSoKyThuat().getCPU()%>">
                                                <label for="cpu">CPU</label>
                                            </div>
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="ram" name="ram"
                                                       value="<%=ctsp.getThongSoKyThuat().getRAM()%>">
                                                <label for="ram">RAM</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="camera" name="camera"
                                                       value="<%=ctsp.getThongSoKyThuat().getCAMERA()%>">
                                                <label for="camera">CAMERA</label>
                                            </div>
                                            <div class="col-sm-6 col-xs-6">
                                                <input type="text" id="pin" name="pin"
                                                       value="<%=ctsp.getThongSoKyThuat().getPIN()%>">
                                                <label for="pin">PIN</label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                        <a href="<%=Util.fullPathAdmin("quan-ly-san-pham")%>" class="btn default btn-xs black go-to-back">Trở
                                            lại</a>
                                        <button type="submit" id="update-btn"><i class="fa fa-pencil-square-o fa-fw"
                                                                                 aria-hidden="true"></i>Cập nhật
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<%@include file="Libs-Admin/footer.jsp" %>
<%--footer--%>
<%@include file="Libs-Admin/fragment-footer.jsp" %>
<!-- Custom Theme JavaScript -->
<script src="js/validation-form/vali-form.js"></script>
</body>
</html>
