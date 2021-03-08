<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Thành Viên</title>

    <%@include file="Libs-Admin/fragment-main.jsp"%>

    <%@include file="Libs-Admin/frag-table-header.jsp" %>

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
                                <a href="index.jsp">Thành viên</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading  d-flex">
                            <div>
                                <i class="fa fa-shopping-cart"></i>
                                Thành viên
                            </div>
                            <a class="add " data-toggle="modal" data-target="#myModal" href="#">
                                <div id="add" class=""><i class="fa fa-plus"></i>
                                    <span>Thêm mới</span>
                                </div>
                            </a>
                            <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">THÊM THÀNH VIÊN</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="update-info" class="like-form">
                                                <form id="form-validate">
                                                    <ul class="row">
                                                        <li class="row">
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="full-name" name="full-name">
                                                                <label for="full-name" class="name-span">Họ & Tên*</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="email" name="email">
                                                                <label for="email" class="email-span">Email*</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="number" id="sdt" name="sdt">
                                                                <label for="sdt" class="sdt-span">Điện thoại*</label>
                                                            </div>
                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="level" name="level" value="Thành viên">
                                                                <label for="level" class="level-span">Chức vụ</label>
                                                            </div>
                                                            <div class="col-sm-8 col-xs-6">
                                                                <input type="text" id="address" name="address">
                                                                <label for="address" class="address-span">Địa chỉ</label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <div class="btn-submit">
                                                        <button type="submit" id="update-btn">SUBMIT</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </div>

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Họ & Tên</th>
                                        <th>Chức vụ</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX">
                                        <td>1</td>
                                        <td>Võ Thanh Trí</td>
                                        <td><span class="label label-danger">
									Nhóm trưởng</span></td>
                                        <td>vothanhtri100898@gmail.com</td>
                                        <td>0368991161</td>
                                        <td>Bình Định</td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td>2</td>
                                        <td>Ngô Vĩ An</td>
                                        <td><span class="label label-success">
									Thành viên</span></td>
                                        <td>ngovianpanda123@gmail.com</td>
                                        <td>0368542322</td>
                                        <td>Long An</td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td>3</td>
                                        <td>Lý Đức Mạnh</td>
                                        <td><span class="label label-success">
									Thành viên</span></td>
                                        <td>ducmanh98@gmail.com</td>
                                        <td>0335467765</td>
                                        <td>DakLak</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<%@include file="Libs-Admin/footer.jsp" %>
<%--footer--%>

<%@include file="Libs-Admin/fragment-footer.jsp"%>

<%@include file="Libs-Admin/frag-table-footer.jsp"%>
<!-- Custom Theme JavaScript -->
<script src="js/form-style.js"></script>
<script src="js/validation-form/vali-form.js"></script>
</body>
</html>
