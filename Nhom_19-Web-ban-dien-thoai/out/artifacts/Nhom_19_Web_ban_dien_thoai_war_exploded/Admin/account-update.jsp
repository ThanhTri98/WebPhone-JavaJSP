<%@ page import="libs.Util" %>
<%@ page import="MODEL.ThanhVien" %>
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

    <title>Sửa thông tin tài khoản</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <link rel="stylesheet" href="css/form-style.css">


</head>
<body>

<div id="wrapper">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">ATM</a>
        </div>

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
        </ul>

        <ul class="nav navbar-right navbar-top-links">
            <li class="dropdown navbar-inverse">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> Bình luận mới
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-users fa-fw"></i> Thành viên mới
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> Admin <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=Util.fullPath("AD/login.jsp")%>"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                </span>
                        </div>
                    </li>
                    <li>
                        <a href="index.jsp" class="active"><i class="fa  fa-dashboard fa-fw"></i> Thống kê</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Danh mục<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="producer.jsp"><i class="fa  fa-home fa-fw"></i>Nhà cung cấp</a>
                            </li>
                            <li>
                                <a href="products-manage.jsp"><i class="fa  fa-pencil-square-o fa-fw"></i>Quản lý
                                    sản
                                    phẩm</a>
                            </li>
                            <li>
                                <a href="comments-manage.jsp"><i class="fa  fa-comments fa-fw"></i>Quản lý bình
                                    luận</a>
                            </li>
                            <li>
                                <a href="news-manage.jsp"><i class="fa  fa-newspaper-o fa-fw"></i>Quản lý tin
                                    tức</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="revenue.jsp"><i class="fa fa-table fa-fw"></i>Doanh thu</a>
                    </li>
                    <li>
                        <a href="oder-manage.jsp"><i class="fa  fa-shopping-bag fa-fw"></i> Quản lý đơn hàng</a>
                    </li>
                    <li>
                        <a href="account-manage.jsp"><i class="fa  fa-user fa-fw"></i>Quản lý tài khoản</a>
                    </li>
                    <li>
                        <a href="member.jsp"><i class="fa fa-users fa-fw"></i>Thành viên</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
                                <a href="account-manage.jsp">Quản lý tài khoản</a>
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
                                <i class="fa  fa-user fa-fw"></i>
                                Cập nhật thông tin tài khoản
                            </div>
                        </div>
                        <div class="panel-body">
                            <%
                                ThanhVien thanhVien =(ThanhVien) request.getAttribute("thanhvien");assert thanhVien != null;
                            %>
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style"
                                      action="<%=Util.fullPath("Admin/suaAcc")%>?action=xulysua" method="post">
                                    <ul class="row">
                                        <li class="row">
                                            <input type="hidden" name="usr-name" value="<%=thanhVien.getTaiKhoan()%>">
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="text" id="full-name" name="full-name"
                                                       value="<%=thanhVien.getHoTen()%>">
                                                <label for="full-name">Họ tên<span>*</span></label>
                                            </div>
                                            <div class="col-sm-2 col-xs-6">
                                                <select id="gender" name="gender">
                                                    <%if (thanhVien.getGioiTinh().equals("Nam")) {%>
                                                    <option value="Nam">Nam</option>
                                                    <option value="Nữ">Nữ</option>
                                                    <%} else {%>
                                                    <option value="Nữ">Nữ</option>
                                                    <option value="Nam">Nam</option>
                                                    <%}%>
                                                </select>
                                                <label for="gender" class="level-span">Giới tính</label>
                                            </div>
                                            <div class="col-sm-3 col-xs-6">
                                                <input type="text" id="email" name="email"
                                                       value="<%=thanhVien.getEmail()%>">
                                                <input type="hidden" name="email-temp" value="<%=thanhVien.getEmail()%>">
                                                <label for="email">Email<span>*</span></label>
                                            </div>
                                            <div class="col-sm-3 col-xs-6">
                                                <input type="number" id="sdt" name="sdt" value="<%=thanhVien.getSoDienThoai()%>">
                                                <label for="sdt">Điện thoại<span>*</span></label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-10 col-xs-6">
                                                <input type="text" id="address" name="address"
                                                       value="<%=thanhVien.getDiaChi()%>">
                                                <label for="address">Địa chỉ</label>
                                            </div>
                                            <div class="col-sm-2 col-xs-6">
                                                <select id="level" name="level">
                                                    <%if (thanhVien.getLevel()==0) {%>
                                                    <option value="0">User</option>
                                                    <%} else {%>
                                                    <option value="1">Admin</option>
<%--                                                    <option value="0">0 (User)</option>--%>
                                                    <%}%>
                                                </select>
                                                <label for="level" class="level-span">Level</label>
                                            </div>

                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                        <a href="account-manage.jsp" class="btn default btn-xs black go-to-back">Trở
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

<script src="js/validation-form/vali-form.js"></script>

</body>
</html>
