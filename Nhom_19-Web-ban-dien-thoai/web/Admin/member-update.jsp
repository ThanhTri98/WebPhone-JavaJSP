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

    <title>Cập nhật thành viên</title>

    <%@include file="Libs-Admin/fragment-main.jsp"%>

    <link rel="stylesheet" href="css/form-style.css">



</head>
<body>
<div id="wrapper">
    <%--   frame--%>
    <%@include file="Libs-Admin/frames.jsp"%>
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
                                <a href="member.jsp">Thành viên</a>
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
                                <i class="fa  fa-users fa-fw"></i>
                                Cập nhật thành viên
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style" action="#" method="#">
                                    <ul class="row">
                                        <li class="row">
                                            <div class="col-sm-3 col-xs-12">
                                                <input type="text" id="full-name" name="full-name">
                                                <label for="full-name">Họ & Tên*</label>
                                            </div>
                                            <div class="col-sm-3 col-xs-12">
                                                <select id="level" name="level">
                                                    <option value="0">0 (Thành viên)</option>
                                                    <option value="1">1 (Nhóm trưởng)</option>
                                                </select>
                                                <label for="level" class="level-span">Chức vụ</label>
                                            </div>
                                            <div class="col-sm-3 col-xs-12">
                                                <input type="text" id="email" name="email">
                                                <label for="email">Email*</label>
                                            </div>
                                            <div class="col-sm-3 col-xs-12">
                                                <input type="number" id="sdt" name="sdt">
                                                <label for="sdt">Điện thoại*</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <input type="text" id="address" name="address">
                                                <label for="address">Địa chỉ</label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                         <a href="member.jsp" class="btn default btn-xs black go-to-back">Trở lại</a>
                                        <button type="submit" id="update-btn"><i class="fa fa-pencil-square-o fa-fw" aria-hidden="true"></i>Cập nhật</button>
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

<%@include file="Libs-Admin/fragment-footer.jsp"%>

<!-- Custom Theme JavaScript -->
<script src="js/validation-form/vali-form.js"></script>

</body>
</html>
