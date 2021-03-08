<%@ page import="java.sql.SQLException" %>
<%@ page import="MODEL.ThanhVien" %>
<%@ page import="java.util.List" %>
<%@ page import="admin.dao.ThanhVienDAO" %>
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

    <title>Quản lý tài khoản</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <%@include file="Libs-Admin/frag-table-header.jsp" %>

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
                                Tài khoản
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
                                            <h4 class="modal-title">THÊM TÀI KHOẢN</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="update-info" class="like-form">
                                                <%
                                                   ThanhVien thanhVien = (ThanhVien) request.getAttribute("thanhvien");
                                                %>
                                                <form class="form-style" action="<%=Util.fullPath("Admin/themAcc")%>"
                                                      method="post" id="form-validate">
                                                    <input type="hidden" name="action" value="them">
                                                    <ul class="row">
                                                        <li class="row">
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="usr-name" name="usr-name"
                                                                       value="<%=thanhVien!=null?thanhVien.getTaiKhoan():""%>">
                                                                <label for="usr-name">Tài khoản<span>*</span></label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="password" name="password"
                                                                       value="<%=thanhVien!=null?thanhVien.getMatKhau():""%>">
                                                                <label for="password">Mật khẩu<span>*</span></label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="full-name" name="full-name"
                                                                       value="<%=thanhVien!=null?thanhVien.getHoTen():""%>">
                                                                <label for="full-name">Họ tên<span>*</span></label>
                                                            </div>
                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-4 col-xs-6">
                                                                <select id="gender" name="gender">
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                </select>
                                                                <label for="gender" class="level-span">Giới tính</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="text" id="email" name="email"
                                                                       value="<%=thanhVien!=null?thanhVien.getEmail():""%>">
                                                                <label for="email">Email<span>*</span></label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <input type="number" id="sdt" name="sdt"
                                                                       value="<%=thanhVien!=null?thanhVien.getSoDienThoai():""%>">
                                                                <label for="sdt">Điện thoại<span>*</span></label>
                                                            </div>

                                                        </li>
                                                        <li class="row">
                                                            <div class="col-sm-8 col-xs-6">
                                                                <input type="text" id="address" name="address"
                                                                       value="<%=thanhVien!=null?thanhVien.getDiaChi():""%>">
                                                                <label for="address">Địa chỉ</label>
                                                            </div>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <select id="level" name="level">
                                                                    <option value="0">User</option>
                                                                    <option value="1">Admin</option>
                                                                </select>
                                                                <label for="level" class="level-span">Level</label>
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
                        <div class="panel-body">
                            <%@include file="Libs-Admin/dialog-admin.jsp" %>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr class="text-small">
                                        <th>#</th>
                                        <th>Họ & Tên</th>
                                        <th>Giới tính</th>
                                        <th>Email</th>
                                        <th>Điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Level</th>
                                        <th class="remove" style="text-align: center">Sửa</th>
                                        <th class="remove" style="text-align: center">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%try {%>
                                    <%
                                        List<ThanhVien> ds_tv = ThanhVienDAO.findAll();
                                        int i = 1;
                                    %>
                                    <%if (ds_tv != null) {%>
                                    <%for (ThanhVien tv : ds_tv) {%>
                                    <tr class="odd gradeX">
                                        <td><%=i++%></td>
                                        <td><%=tv.getHoTen()%></td>
                                        <td><%=tv.getGioiTinh()%></td>
                                        <td><%=tv.getEmail()%></td>
                                        <td><%=tv.getSoDienThoai()%></td>
                                        <td><%=tv.getDiaChi()%></td>
                                        <td style="text-align: center"><%if (tv.getLevel() == 0) {%>
                                            <span class="label label-success">User</span>
                                            <%} else if (tv.getLevel() == 1) { %>
                                            <span class="label label-danger">Admin</span>
                                            <%}%>
                                        </td>
                                        <td style="text-align: center"><a
                                                href="<%=Util.fullPath("Admin/suaAcc")%>?action=sua&usr-name=<%=tv.getTaiKhoan()%>"
                                                class="btn default btn-xs purple btn-edit">
                                            <i class="fa fa-edit"></i></a></td>
                                        <td style="text-align: center">
                                            <a data-toggle="modal" data-target="#<%=tv.getTaiKhoan()%>cf"
                                               class="btn default btn-xs black btn-delete"><i class="fa fa-trash-o"></i></a>
                                            <div id="<%=tv.getTaiKhoan()%>cf" class="modal fade modal-confirm" role="dialog">
                                                <div class="modal-dialog modal-sm">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <p class="text-content">Xác nhận xóa tài khoản <em><%=tv.getTaiKhoan()%></em></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" onclick="return location.href='<%=Util.fullPath("Admin/xoaAcc")%>?action=xoa&usr-name=<%=tv.getTaiKhoan()%>'" class="btn-cf">Xác nhận</button>
                                                            <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    } catch (SQLException e) {
                                    %>
                                    <%}%>
                                    </tbody>
                                </table>
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

<%@include file="Libs-Admin/frag-table-footer.jsp" %>
<!-- Custom Theme JavaScript -->
<script src="js/form-style.js"></script>
<script src="js/validation-form/vali-form.js"></script>

</body>
</html>
