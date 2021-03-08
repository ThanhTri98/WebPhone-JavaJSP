<%@ page import="java.sql.ResultSet" %>
<%@ page import="libs.SelectAll" %>
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
    <meta name="author" content="">

    <title>Quản lý bình luận</title>

    <%@include file="Libs-Admin/fragment-main.jsp"%>

    <%@include file="Libs-Admin/frag-table-header.jsp" %>


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
                                <a href="#">Danh mục</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="comments-manage.jsp">Quản lý bình luận</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-comments"></i>
                            Quản lý bình luận
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <%@include file="Libs-Admin/dialog-admin.jsp" %>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên khách hàng</th>
                                        <th>Nội dung</th>
                                        <th>Sản phẩm</th>
                                        <th>Ngày bình luận</th>
                                        <th class="remove" style="text-align: center">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%try{%>
                                    <%ResultSet rs = SelectAll.selectAllFromTable("binhluan"); assert rs!=null;%>
                                   <%while(rs.next()){%>
                                    <tr class="odd gradeX">
                                        <td><%=rs.getString("id")%></td>
                                        <td><%=rs.getString("hoten")%></td>
                                        <td><%=rs.getString("noidung")%></td>
                                        <td><%=rs.getString("sanpham")%></td>
                                        <td><%=rs.getString("ngaybinhluan")%></td>
                                        <td style="text-align: center">
                                            <a data-toggle="modal" data-target="#<%=rs.getString("id")%>cf"
                                               class="btn default btn-xs black btn-delete"><i class="fa fa-trash-o"></i></a>
                                            <div id="<%=rs.getString("id")%>cf" class="modal fade modal-confirm" role="dialog">
                                                <div class="modal-dialog modal-sm">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <p class="text-content">Xác nhận xóa bình luận</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" onclick="return location.href='<%=Util.fullPath("Admin/CommentController?id=")+rs.getString("id")%>'" class="btn-cf">Xác nhận</button>
                                                            <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <%}catch (ClassNotFoundException | SQLException e){%>
                                    <%}%>
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


</body>
</html>
