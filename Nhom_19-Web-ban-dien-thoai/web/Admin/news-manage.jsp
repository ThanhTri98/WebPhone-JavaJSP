<%@ page import="MODEL.TinTuc" %>
<%@ page import="java.util.List" %>
<%@ page import="admin.dao.NewsDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.sun.jndi.toolkit.url.Uri" %>
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

    <title>Quản lý tin tức</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <%@include file="Libs-Admin/frag-table-header.jsp" %>

    <script src="../plugin/ckeditor/ckeditor.js"></script>
    <script src="../plugin/ckfinder/ckfinder.js"></script>
    <link rel="stylesheet" href="css/form-style.css">
    <style>
        @media (min-width: 768px) {
            .modal-dialog {
                width: 1100px;
                margin: 30px auto;
            }
        }
    </style>
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
                                <a href="news-manage.jsp">Quản lý tin tức</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-heading  d-flex">
                            <div>
                                <i class="fa fa-newspaper-o"></i>
                                Tin tức
                            </div>
                            <a class="add " data-toggle="modal" data-target="#myModal" href="#">
                                <div id="add" class=""><i class="fa fa-plus"></i>
                                    <span>Thêm mới</span>
                                </div>
                            </a>
                            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">THÊM TIN TỨC</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="update-info" class="like-form">
                                                <form id="form-validate" class="form-style" action="<%=Util.fullPathAdmin("them-tin-tuc")%>" method="POST" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="them">
                                                    <ul class="row">
                                                        <li class="row">
                                                            <div class="col-sm-12 col-xs-6">
                                                                <input type="text" id="title" name="title" value="" minlength="1" required>
                                                                <label for="title">Tiêu đề<span>*</span></label>
                                                            </div>
                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-12 col-xs-6">
                                                                <textarea id="description" name="description"
                                                                          placeholder="Nhập nội dung..." maxlength="190"
                                                                          required></textarea>
                                                                <label for="description" class="mg-area">Mô tả</label>
                                                            </div>
                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-4 col-xs-6">
                                                                <select id="type" name="type">
                                                                    <option value="0">Tin tức mới</option>
                                                                    <option value="1">Tin tức KM</option>
                                                                </select>
                                                                <label for="type" class="level-span">Type</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="file" id="link-img"
                                                                       name="link-img" accept="image/jpeg,image/png">
                                                                <label for="link-img">Ảnh mô tả</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="date" id="date-post"
                                                                       name="date-post">
                                                                <label for="date-post" class="level-span">Ngày
                                                                    viết</label>
                                                            </div>
                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-12 col-xs-6">
                                                                <textarea id="content" name="content"></textarea>
                                                                <label for="content" class="mg-area">Nội dung</label>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                    <div class="btn-submit">
                                                        <button type="submit" id="update-btn">Thêm</button>
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
                            <%@include file="Libs-Admin/dialog-admin.jsp" %>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tiêu đề</th>
                                        <th>Ngày viết</th>
                                        <th>Loại</th>
                                        <th class="remove">Sửa</th>
                                        <th class="remove" style="text-align: center">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%try {%>
                                    <%
                                        List<TinTuc> dstt = NewsDAO.findAll();
                                        int count = 0;
                                    %>
                                    <%if (dstt != null) {%>
                                    <%for (TinTuc tt : dstt) {%>
                                    <tr class="odd gradeX">
                                        <td><%=++count%>
                                        </td>
                                        <td><%=tt.getTieuDe()%>
                                        </td>
                                        <td><%=tt.getNgayViet()%>
                                        </td>
                                        <td style="text-align: center; font-weight: 700">
                                            <%if (tt.getLoai() == 0) {%>
                                            <span style="color: #31de21">Mới</span>
                                            <%} else if (tt.getLoai() == 1) {%>
                                            <span style="color: #de8f04">Khuyến mãi</span>
                                            <%}%>
                                        </td>
                                        <td class="center"><a
                                                href="<%=Util.fullPathAdmin("cap-nhat-tin-tuc")%>?action=sua&id=<%=tt.getMaTinTuc()%>"
                                                class="btn default btn-xs purple btn-edit">
                                            <i class="fa fa-edit"></i></a></td>
                                        <td style="text-align: center">
                                            <a data-toggle="modal" data-target="#<%=tt.getMaTinTuc()%>cf"
                                               class="btn default btn-xs black btn-delete"><i class="fa fa-trash-o"></i></a>
                                            <div id="<%=tt.getMaTinTuc()%>cf" class="modal fade modal-confirm" role="dialog">
                                                <div class="modal-dialog modal-sm">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <p class="text-content">Xác nhận xóa tin tức</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" onclick="return location.href='<%=Util.fullPathAdmin("xoa-tin-tuc")%>?id=<%=tt.getMaTinTuc()%>&action=xoa'" class="btn-cf">Xác nhận</button>
                                                            <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                    <%} catch (SQLException e) {%>
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
<div class="page-footer">
    <div class="page-footer-inner">
        Môn Học: Lập Trình Web - Đồ Án: Website Bán Điện Thoại - Giáo Viên: Phan Đình Long
    </div>
</div>

<%@include file="Libs-Admin/fragment-footer.jsp" %>
<%@include file="Libs-Admin/frag-table-footer.jsp" %>
<!-- Custom Theme JavaScript -->
<script src="js/form-style.js"></script>
<script src="js/validation-form/vali-form.js"></script>
<script>
    $(document).ready(function () {
        var ckeditor = CKEDITOR.replace("content");
        CKFinder.setupCKEditor(ckeditor, '/plugin/ckfinder')
    })
</script>
</body>
</html>
