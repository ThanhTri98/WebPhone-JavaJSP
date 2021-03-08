<%@ page import="MODEL.TinTuc" %>
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

    <title>Cập nhật tin tức</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <script src="../plugin/ckeditor/ckeditor.js"></script>
    <script src="../plugin/ckfinder/ckfinder.js"></script>
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
                                <a href="news-manage.jsp">Quản lý tin tức</a>
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
                                <i class="fa  fa-newspaper-o fa-fw"></i>
                                Cập nhật tin tức
                            </div>
                        </div>
                        <%
                            TinTuc tinTuc = (TinTuc) request.getAttribute("tintuc");
                            assert tinTuc != null;
                        %>
                        <div class="panel-body">
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style"
                                      action="<%=Util.fullPathAdmin("cap-nhat-tin-tuc")%>" method="POST"
                                      enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="xulysua">
                                    <input type="hidden" name="id" value="<%=tinTuc.getMaTinTuc()%>">
                                    <ul class="row">
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-6">
                                                <input type="text" id="title" name="title"
                                                       value="<%=tinTuc.getTieuDe()!=null?tinTuc.getTieuDe():""%>">
                                                <label for="title">Tiêu đề<span>*</span></label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-6">
                                                                <textarea id="description" name="description"
                                                                          placeholder="Nhập nội dung..." maxlength="190"
                                                                          required><%=tinTuc.getMoTa() != null ? tinTuc.getMoTa() : ""%></textarea>
                                                <label for="description" class="mg-area">Mô tả</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-4 col-xs-6">
                                                <select id="type" name="type">
                                                    <%if (tinTuc.getLoai() == 0) {%>
                                                    <option value="0">Tin tức mới</option>
                                                    <option value="1">Tin tức KM</option>
                                                    <%} else {%>
                                                    <option value="1">Tin tức KM</option>
                                                    <option value="0">Tin tức mới</option>
                                                    <%}%>
                                                </select>
                                                <label for="type" class="level-span">Type</label>
                                            </div>
                                            <input type="hidden" name="change-img" value="<%=tinTuc.getAnhMoTa()!=null?tinTuc.getAnhMoTa():""%>">
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="file" id="link-img"
                                                       name="link-img" accept="image/jpeg,image/png">
                                                <label for="link-img">Ảnh mô tả</label>
                                            </div>
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="date" id="date-post"
                                                       name="date-post"
                                                       value="<%=tinTuc.getNgayViet()!=null?tinTuc.getNgayViet():""%>">
                                                <label for="date-post" class="level-span">Ngày
                                                    viết</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-6">
                                                <textarea id="content"
                                                          name="content"><%=tinTuc.getNoiDung() != null ? tinTuc.getNoiDung() : ""%></textarea>
                                                <label for="content" class="mg-area">Nội dung</label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                        <a href="news-manage.jsp" class="btn default btn-xs black go-to-back">Trở
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

<
<%@include file="Libs-Admin/fragment-footer.jsp" %>

<!-- Custom Theme JavaScript -->
<script src="js/validation-form/vali-form.js"></script>
<script>
    $(document).ready(function () {
        var ckeditor = CKEDITOR.replace("content");
        CKFinder.setupCKEditor(ckeditor, '/plugin/ckfinder')
    })
</script>

</body>
</html>
