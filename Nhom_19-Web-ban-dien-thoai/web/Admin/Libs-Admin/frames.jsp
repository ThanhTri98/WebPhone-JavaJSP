<%@ page import="libs.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="./index.jsp">ATM</a>
    </div>

    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>

    <ul class="nav navbar-nav navbar-left navbar-top-links">
        <li><a href="<%=Util.fullPath("trang-chu")%>"><i class="fa fa-home fa-fw"></i> Website</a></li>
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
                <i class="fa fa-user fa-fw"></i>${USER.getHoTen()} <b class="caret"></b>
            </a>
            <ul class="dropdown-menu dropdown-user">
<%--                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>--%>
<%--                </li>--%>
<%--                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>--%>
<%--                </li>--%>
<%--                <li class="divider"></li>--%>
                <li><a href="<%=Util.fullPath("AD/Admin-Dang-Xuat")%>?action-ad=dang-xuat"><i
                        class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                    <a href="./index.jsp" class="active"><i class="fa  fa-dashboard fa-fw"></i> Thống kê</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Danh mục<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./producer.jsp"><i class="fa  fa-home fa-fw"></i>Nhà cung cấp</a>
                        </li>
                        <li>
                            <a href="./products-manage.jsp"><i class="fa  fa-pencil-square-o fa-fw"></i>Quản lý sản
                                phẩm</a>
                        </li>
                        <li>
                            <a href="./comments-manage.jsp"><i class="fa  fa-comments fa-fw"></i>Quản lý bình
                                luận</a>
                        </li>
                        <li>
                            <a href="./news-manage.jsp"><i class="fa  fa-newspaper-o fa-fw"></i>Quản lý tin tức</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="./revenue.jsp"><i class="fa fa-table fa-fw"></i>Doanh thu</a>
                </li>
                <li>
                    <a href="./oder-manage.jsp"><i class="fa  fa-shopping-cart fa-fw"></i> Quản lý đơn hàng</a>
                </li>
                <li>
                    <a href="./account-manage.jsp"><i class="fa  fa-user fa-fw"></i>Quản lý tài khoản</a>
                </li>
                <li>
                    <a href="./member.jsp"><i class="fa fa-users fa-fw"></i>Thành viên</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>