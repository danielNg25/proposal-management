<%-- 
    Document   : userpage
    Created on : Nov 19, 2020, 9:14:12 AM
    Author     : ACER
--%>

<%@page import="models.KienNghi"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="models.PhanHoiForUser"%>
<%@page import="java.util.Date"%>
<%@page import="models.NguoiDan"%>
<%@page import="models.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gửi phản ánh, kiến nghị</title>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="common/user.css">
        <script type="text/javascript" src="common/notificationUser.js" ></script>
    </head>
    <body>
        <%
            List<KienNghi> listPH = (List<KienNghi>) request.getAttribute("listPH");
            Calendar c1 = Calendar.getInstance();
            Calendar c2 = Calendar.getInstance();
            Date date1 = new Date();
            c1.setTime(date1);
            
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Gửi phản ánh, kiến nghị</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarToggler">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarToggler">
                    <ul class="navbar-nav ml-auto">
                        <li class="dropdown-item">
                            <div class="btn-group pull-right top-head-dropdown">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Thông báo <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <% if (listPH.size() > 0) {
                                            for (int i = 0; i < listPH.size(); i++) {
                                                Date date2 = listPH.get(i).getNgayPhanAnh();
                                                c2.setTime(date2);
                                                long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
                                            %> 
                                    <li>
                                        <a href="#" class="top-text-block">
                                            <div class="top-text-heading">Kiến Nghị <b><%=listPH.get(i).getTieuDe()%></b> đã được trả lời</div>
                                            <div class="top-text-light"><%= noDay%> Ngày trước</div>
                                        </a> 
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                    <li>
                                        <div class="loader-topbar"></div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                               role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${hoTen}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Hồ sơ</a>
                                <a class="dropdown-item" href="logout">Log out</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="main" class="container">
            <div class="row">
                <div class="col lg-10">                  
                    <form action="guikiennghi" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="inputHoTen">Người dân</label>
                                <input type="text" class="form-control" id="inputHoTen" value="${hoTen}" readonly>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="inputGioiTinh">Giới tính</label>
                                <input type="text" class="form-control" id="inputGioiTinh" value="${gioiTinh}" readonly>
                            </div>
                            <div class="form-group col-md-5">
                                <label for="inputCMND">CMND</label>
                                <input type="text" class="form-control" id="inputCMND" value="${cmnd}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputDiaChi">Địa chỉ</label>
                            <input type="text" class="form-control" id="inputDiaChi" value="${diaChi}" readonly>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputSDT">Số Điện Thoại</label>
                                <input type="text" class="form-control" id="inputSDT" value="${sdt}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmail">Email</label>
                                <input type="text" class="form-control" id="inputEmail" value="${email}" readonly>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-lg-10">
                                <label for="inputTieuDe">Tiêu đề</label>
                                <input type="text" class="form-control" id="inputTieuDe" name="tieuDe" placeholder="Nhập tiêu đề PAKN">
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="inputPhanLoai">Phân loại</label>
                                <select class="custom-select" id="inputPhanLoai" name="phanLoai">
                                    <option value="Chính sách" selected>Chính sách</option>
                                    <option value="Đất đai">Đất đai</option>
                                    <option value="Y tế">Y tế</option>
                                    <option value="Môi trường">Môi trường</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputNoiDung">Nội dung</label>
                            <textarea class="form-control" id="inputNoiDung" rows="5" placeholder="Nội dung" name="noiDung"></textarea> 
                        </div>
                        <div class="row justify-content-center">
                            <%
                                String err = request.getParameter("err");

                                if ("1".equals(err) 
                                    ) {
                                    out.print("<h5 style=\"color: red;\">Chưa điền tiêu đề hoặc nội dung </h5>");
                                }
                                String message = request.getParameter("mes");

                                if ("success".equals(message) 
                                    ) {
                                    out.print("<h5 style=\"color: green;\">Gửi thành công!</h5>");
                                }
                            %>
                        </div>
                        <div class="row justify-content-center">
                            <button type="submit" class="btn btn-primary">Gửi phản ánh</button>                      
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
