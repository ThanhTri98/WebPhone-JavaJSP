<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Trang cá nhân</title>
    <%@include file="Libs/fragment-header.jsp" %>
</head>

<body>
<!--header-->
<%@include file="Libs/header.jsp" %>
<!--header-->
<section id="body">
    <div class="container">
        <div id="user-profile">
            <div class="avatar-name-user">
                <div class="avatar-user" data-aos="zoom-in-right">
                    <img src="assets/img/common/avatar-user/avatar-admin.jpg" height="288" width="400" alt="avatar"/></div>
                <div class="user-info-name" data-aos="fade-left">
                    <span>Tài khoản của</span>
                    <span class="user-text"><%=thanhVien.getHoTen()%></span>
                </div>
            </div>
            <div class="info-address">
                <div class="info-user" data-aos="fade-right">
                    <span><i class="fa fa-user fa-fw"></i>Thông tin tài khoản</span>
                    <div id="update-info" class="like-form">
                        <h3 style="margin-bottom: 0">THÔNG TIN TÀI KHOẢN</h3>
                        <%String successInfo = (String) request.getAttribute("success-update");
                            String errInfo = (String) request.getAttribute("err-update");
                        %>
                        <%if (successInfo != null) {%>
                        <div class="justify-align-center">
                            <span class="update-infoDB" style="color: #0a7f7f"><%=successInfo%></span>
                        </div>
                        <%} else if (errInfo != null) {%>
                        <div class="justify-align-center">
                            <span class="update-infoDB"><%=errInfo%></span>
                        </div>
                        <%}%>
                        <form id="form-validate" class="form-infoUser form-style" action="<%=Util.fullPath("cap-nhat-thong-tin")%>?action=updateInfo" method="post">
                            <div>
                                <span>Họ và Tên*</span>
                                <input type="text" id="full-name" name="full-name" value="<%=thanhVien.getHoTen()%>">
                            </div>
                            <div>
                                <span>Địa chỉ Email*</span>
                                <input type="text" id="email" name="email" value="<%=thanhVien.getEmail()!=null?thanhVien.getEmail():""%>">
                                <input type="hidden" name="email-temp" value="<%=thanhVien.getEmail()!=null?thanhVien.getEmail():""%>">
                            </div>
                            <div id="Giới tính">
                                <span>Giới tính</span>
                                <select id="gender" name="gender">
                                    <%if(thanhVien.getGioiTinh()==null){%>
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                    <%}else if(thanhVien.getGioiTinh().equals("Nữ")){%>
                                    <option value="Nữ">Nữ</option>
                                    <option value="Nam">Nam</option>
                                    <%}else{%>
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                    <%}%>
<%--                                    <%if (thanhVien.getGioiTinh().equals("Nữ")) {%>--%>
<%--                                    <option value="Nữ">Nữ</option>--%>
<%--                                    <option value="Nam">Nam</option>--%>
<%--                                    <%} else {%>--%>
<%--                                    <option value="Nam">Nam</option>--%>
<%--                                    <option value="Nữ">Nữ</option>--%>
<%--                                    <%}%>--%>
                                </select>
                            </div>
                            <div>
                                <span>Số điện thoại*</span>
                                <input id="sdt" name="sdt" type="number"
                                       value="<%=thanhVien.getSoDienThoai()!=null?"0"+Integer.parseInt(thanhVien.getSoDienThoai()):""%>">
                            </div>
                            <div>
                                <span>Địa chỉ*</span>
                                <input type="text" id="address" name="address" value="<%=thanhVien.getDiaChi()!=null?thanhVien.getDiaChi():""%>">
                            </div>
                            <button class="update-btn">CẬP NHẬT</button>
                        </form>
                    </div>
                </div>
                <div class="address-user" data-aos="fade-right">
                    <span><i class="fa fa-address-book-o" aria-hidden="true"></i>Sổ địa chỉ</span>
                    <div id="book-address" class="like-form">
                        <h3>SỔ ĐỊA CHỈ</h3>
                        <div class="add-address">
                            <a><i class="fa fa-plus-circle" aria-hidden="true"></i>Thêm địa chỉ</a>
                        </div>

                        <div class="content-add">
                            <div class="default-add">
                                <ul>
                                    <li>
                                        <span class="user-text"><%=thanhVien.getHoTen()%></span>
                                        <div class="action">
                                            <span><i class="fa fa-check-circle" aria-hidden="true"></i>Mặc định</span>
                                            <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Địa chỉ:</span>
                                        <span class="address"><%=thanhVien.getDiaChi()!=null?thanhVien.getDiaChi():""%></span>
                                    </li>
                                    <li>
                                        <span>Số điện thoại:</span>
                                        <span class="sdt"><%=thanhVien.getSoDienThoai()!=null?"0"+Integer.parseInt(thanhVien.getSoDienThoai()):""%></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="">
                                <ul>
                                    <li>
                                        <span class="user-text"><%=thanhVien.getHoTen()%></span>
                                        <div class="action">
                                            <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                            <span><i class="fa fa-trash" aria-hidden="true"></i></span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Địa chỉ:</span>
                                        <span class="address">Địa chỉ 2</span>
                                    </li>
                                    <li>
                                        <span>Số điện thoại:</span>
                                        <span class="sdt">0xx-xxx-xxxx</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="">
                                <ul>
                                    <li>
                                        <span class="user-text"><%=thanhVien.getHoTen()%></span>
                                        <div class="action">
                                            <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                            <span><i class="fa fa-trash" aria-hidden="true"></i></span>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Địa chỉ:</span>
                                        <span class="address">Địa chỉ 3</span>
                                    </li>
                                    <li>
                                        <span>Số điện thoại:</span>
                                        <span class="sdt">0xx-xxx-xxxx</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <% String sucess = (String) request.getAttribute("success-changePass");
                    String erro = (String) request.getAttribute("err-changePass");
                %>
                <div class="change-pass-user" data-aos="fade-right">
                    <span><i class="fa fa-lock" aria-hidden="true"></i>Thay đổi mật khẩu</span>
                    <div id="change-pass" class="like-form">
                        <h3>ĐỔI MẬT KHẨU</h3>
                        <%if (sucess != null) {%>
                        <div class="justify-align-center">
                            <span class="changePass-nf" style="color: #0a7f7f"><%=sucess%></span>
                        </div>
                        <%} else if (erro != null) {%>
                        <div class="justify-align-center">
                            <span class="changePass-nf"><%=erro%></span>
                        </div>
                        <%}%>
                        <form id="form-change-pass" class="form-style"
                              action="<%=Util.fullPath("Doi-Mat-Khau")%>?action=doi-mat-khau" method="post">
                            <div>
                                <span>Mật khẩu hiện tại*</span>
                                <input type="password" id="current-pass" name="current-pass" value="">
                            </div>
                            <div>
                                <span>Mật khẩu mới*</span>
                                <input type="text" id="new-pass" name="new-pass" value="">
                            </div>
                            <div id="c-pass">
                                <span>Xác nhận mật khẩu*</span>
                                <input type="text" id="c-new-pass" name="c-new-pass">
                            </div>
                            <button type="submit" class="update-btn">CẬP NHẬT</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="Libs/footer-animation.jsp" %>
<!--footer-->
<!--js--start-->
<%@include file="Libs/fragment-footer.jsp" %>
<!--js--end-->
<!--js page-->
<script src="assets/js/profile-user.js"></script>
<script src="assets/js/validation-form/vali-form.js"></script>
<script src="assets/js/validation-form/vali-chang-pass.js"></script>

<!--js page-->
</body>

</html>