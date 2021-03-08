<%@ page import="MODEL.GioHang_DB" %>
<%@ page import="admin.dao.OderDAO" %>
<%@ page import="java.util.List" %>
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

    <title>Đơn Hàng</title>

    <%@include file="Libs-Admin/fragment-main.jsp" %>

    <%@include file="Libs-Admin/frag-table-header.jsp" %>


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
                                <a href="oder-manage.jsp">Quản lý đơn hàng</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-shopping-cart"></i>
                            Đơn hàng
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <%@include file="Libs-Admin/dialog-admin.jsp" %>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Tên khách hàng</th>
<%--                                        <th>Email</th>--%>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày tạo</th>
                                        <th class="remove" style="text-align: center">Xem chi tiết</th>
                                        <th class="remove" style="text-align: center">Trạng thái</th>
                                        <th class="remove" style="text-align: center">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%try {%>
                                    <%
                                        List<GioHang_DB> ghdb = OderDAO.gioHangDB();
                                        assert ghdb != null;
                                    %>
                                    <%for (GioHang_DB gh : ghdb) {%>
                                    <tr class="odd gradeX">
                                        <td><%=gh.getMaGioHang()%>
                                        </td>
                                        <td><%=gh.getHoten()%>
                                        </td>
<%--                                        <td><%=gh.getEmail()%>--%>
<%--                                        </td>--%>
                                        <td><%=gh.getSoDienThoai()%>
                                        </td>
                                        <td><%=gh.getDiaChi()%>
                                        </td>
                                        <td><%=gh.getNgayThanhToan()%>
                                        </td>
                                        <td style="text-align: center">
                                            <button data-toggle="modal" data-target="#<%=gh.getMaGioHang()%>"
                                                    class="label label-success" style="border: none">Xem chi tiết
                                            </button>
                                        </td>
                                        <td style="text-align: center"><span class="label label-warning">Chờ xác nhận</span></td>
                                        <td style="text-align: center">
                                            <a data-toggle="modal" data-target="#<%=gh.getMaGioHang()%>cf"
                                               class="btn default btn-xs black btn-delete"><i class="fa fa-trash-o"></i></a>
                                            <div id="<%=gh.getMaGioHang()%>cf" class="modal fade modal-confirm" role="dialog">
                                                <div class="modal-dialog modal-sm">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <p class="text-content">Xác nhận xóa đơn hàng <em><%=gh.getMaGioHang()%></em></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" onclick="return location.href='<%=Util.fullPath("Admin/oder")%>?mgh=<%=gh.getMaGioHang()%>'" class="btn-cf">Xác nhận</button>
                                                            <button type="button" class="tbn-cancle" data-dismiss="modal">Hủy</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <div id="<%=gh.getMaGioHang()%>" class="modal fade" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">CHI TIẾT ĐƠN HÀNG</h4>
                                                </div>
                                                <div class="modal-body modal-ctdh">
                                                    <%
                                                        List<GioHang_DB> ctdh = OderDAO.selectByID(gh.getMaGioHang());
                                                        assert ctdh != null;
                                                        int count = 0;
                                                    %>
                                                    <div class="form-ctdh">
                                                        <div class="title-top">
                                                            <ul class="row">
                                                                <li class="col-sm-1">#</li>
                                                                <li class="col-sm-4">Tên sản phẩm</li>
                                                                <li class="col-sm-2">Số lượng</li>
                                                                <li class="col-sm-2">Số tiền</li>
                                                                <li class="col-sm-3">Hình ảnh</li>
                                                            </ul>
                                                        </div>
                                                        <ul class="">
                                                            <%double total=0;%>
                                                            <%for (GioHang_DB ct : ctdh) {%>
                                                            <%total+=ct.getSoTien();%>
                                                            <li class="row">
                                                                <div class="col-sm-1"><%=++count%></div>
                                                                <div class="col-sm-4"><%=ct.getTenSanPham()%></div>
                                                                <div class="col-sm-2"><%=ct.getSoLuong()%></div>
                                                                <div class="col-sm-2"><%=String.format("%,.0f",ct.getSoTien())+"đ"%></div>
                                                                <div class="col-sm-3"><img src="<%=Util.fullPath(ct.getHinhanh())%>" alt="" width="80"></div>
                                                            </li>
                                                            <%}%>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="total">
                                                    <h4>Tổng cộng:</h4>
                                                    <span><%=String.format("%,.0f",total)+"đ"%></span>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn tbn-cancle"
                                                            data-dismiss="modal">Đóng
                                                    </button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
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
<%--footer--%>
<%@include file="Libs-Admin/footer.jsp" %>
<%--footer--%>
<%@include file="Libs-Admin/fragment-footer.jsp" %>
<%@include file="Libs-Admin/frag-table-footer.jsp" %>

</body>
</html>
