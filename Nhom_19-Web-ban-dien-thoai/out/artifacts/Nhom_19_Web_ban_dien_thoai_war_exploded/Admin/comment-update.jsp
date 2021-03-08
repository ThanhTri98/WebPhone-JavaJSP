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

    <title>Update Comment</title>

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
                                <a href="#">Danh mục</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="comments-manage.jsp">Quản lý bình luận</a>
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
                                <i class="fa  fa-comments fa-fw"></i>Cập nhật bình luận
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style" action="#" method="#">
                                    <ul class="row">
                                        <li class="row">
                                            <div class="col-sm-2 col-xs-12">
                                                <input type="text" id="id" name="id">
                                                <label for="id">#*</label>
                                            </div>
                                            <div class="col-sm-5 col-xs-12">
                                                <input type="text" id="full-name" name="full-name">
                                                <label for="full-name">Tên khách hàng*</label>
                                            </div>
                                            <div class="col-sm-5 col-xs-12">
                                                <input type="date" id="date-post" name="date-post" value="">
                                                <label for="date-post">Ngày gửi</label>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div class="col-sm-12 col-xs-12">
                                                <textarea id="comment" name="comment"
                                                          placeholder="Nhập nội dung..."></textarea>
                                                <label for="comment" class="mg-area">Nội dung</label>
                                            </div>

                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                        <a href="comments-manage.jsp" class="btn default btn-xs black go-to-back">Trở
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
<%@include file="Libs-Admin/fragment-footer.jsp"%>

<script src="js/validation-form/vali-form.js"></script>
<script>
    $(document).ready(function () {
        let date = new Date();
        $('#date-post').val(date.getFullYear().toString() + '-' + (date.getMonth() + 1).toString() + '-' + date.getDate().toString());
    });
</script>

</body>
</html>
