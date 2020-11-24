<%-- 
    Document   : userpage
    Created on : Nov 19, 2020, 9:14:12 AM
    Author     : ACER
--%>

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
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Gửi phản ánh, kiến nghị</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarToggler">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarToggler">
                <ul class="navbar-nav ml-auto">
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
            <form>
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
                <div class="form-group">
                    <label for="inputTieuDe">Tiêu đề</label>
                    <input type="text" class="form-control" id="inputTieuDe" name="tieuDe" placeholder="Nhập tiêu đề PAKN">
                </div>
                <div class="form-group">
                    <label for="inputNoiDung">Nội dung</label>
                    <textarea class="form-control" id="inputNoiDung" rows="5" placeholder="Nội dung"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi phản ánh</button>
            </form>
        </div>
        </div>
    </div>
    </body>
</html>
