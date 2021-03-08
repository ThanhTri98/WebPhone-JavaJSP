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

    <title>Cập nhật nhà cung cấp</title>

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
                                <a href="producer.jsp">Nhà cung cấp</a>
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
                                <i class="fa  fa-home fa-fw"></i>
                                Cập nhật nhà cung cấp
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="update" class="like-form">
                                <form id="form-validate" class="form-style" action="<%=Util.fullPath("Admin/suaNCC")%>?action=xulysua" method="post">
                                    <ul class="row">
                                        <%  String ma_ncc = request.getParameter("id-producer");
                                            String ten_ncc = request.getParameter("name-producer");
                                            String diachi_ncc = request.getParameter("add-producer");%>
                                        <li class="row">
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="text" id="id-producer" name="id-producer" value="<%=ma_ncc!=null?ma_ncc:""%>">
                                                <input type="hidden" name="id-producer-temp" value="<%=ma_ncc!=null?ma_ncc:""%>">
                                                <label for="id-producer" >Mã nhà cung cấp<span>*</span></label>
                                            </div>
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="text" id="name-producer" name="name-producer" value="<%=ten_ncc!=null?ten_ncc:""%>">
                                                <label for="name-producer" >Tên nhà cung cấp<span>*</span></label>
                                            </div>
                                            <div class="col-sm-4 col-xs-6">
                                                <input type="text" id="add-producer" name="add-producer" value="<%=diachi_ncc!=null?diachi_ncc:""%>" >
                                                <label for="add-producer" >Địa chỉ<span>*</span></label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="btn-submit">
                                        <a href="producer.jsp" class="btn default btn-xs black go-to-back">Trở lại</a>
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
