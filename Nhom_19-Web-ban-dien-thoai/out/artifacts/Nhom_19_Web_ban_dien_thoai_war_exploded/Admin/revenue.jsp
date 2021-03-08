<%@ page import="MODEL.GioHang_DB" %>
<%@ page import="java.util.List" %>
<%@ page import="admin.dao.OderDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="libs.SumObj" %>
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

    <title>Doanh Thu</title>

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
                                <a href="revenue.jsp">Doanh thu</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-money"></i>
                            Doanh Thu
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <%try {%>
                            <%double total = SumObj.totalSum("giohang", "sotien");%>
                            <span class="dia-revenue">TỔNG DOANH THU:<strong
                                    style="color:#d10000"><%=" " + String.format("%,.0f", total) + "đ"%></strong></span>
                            <%} catch (SQLException e) {%>
                            <%}%>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên khách hàng</th>
                                        <th>Ngày giao dịch</th>
                                        <th>Số tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%try {%>
                                    <%
                                        List<GioHang_DB> ghdb = OderDAO.gioHangDB();
                                        assert ghdb != null;
                                        int count = 0;
                                    %>
                                    <%for (GioHang_DB gh : ghdb) {%>
                                    <tr class="odd gradeX">
                                        <td><%=++count%>
                                        </td>
                                        <td><%=gh.getHoten()%>
                                        </td>
                                        <td><%=gh.getNgayThanhToan()%>
                                        </td>
<%--                                        <td><%=String.format("%,.0f", gh.getSoTien()) + "đ"%></td>--%>
                                        <td>Đang tải...</td>
                                    </tr>
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
<!-- Custom Theme JavaScript -->
</body>
</html>
