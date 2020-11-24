<%-- 
    Document   : adminpage
    Created on : Nov 23, 2020, 9:53:36 PM
    Author     : MSI GV62
--%>

<%@page import="services.ThongKeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="common/admin.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <title>Quản lý kiến nghị</title>
    </head>
    <body>
        <% 
        ThongKeService tk = new ThongKeService();
        %>
        <div class="wrapper">
            <div class="sidebar">
                <h2>Quản Lý</h2>
                <ul>
                    <li><a href="adminpage.jsp"><i class="fas fa-home"></i>Trang chủ</a></li>
                    <li><a href="#"><i class="fas fa-user"></i>Hồ Sơ</a></li>
                    <li><a href="quanly"><i class="fas fa-address-card"></i>Thông Tin Kiến Nghị</a></li>                    
                    <li><a href="#"><i class="fas fa-address-book"></i>Gửi Kiến Nghị</a></li>
                    <li><a href="login.jsp">Đăng Xuất</a></li>
                </ul> 
                <div class="social_media">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="main_content">
                <div class="header"><h1>THỐNG KÊ QUẢN LÝ KIẾN NGHỊ</h1></div>  
            <div class="info">
                <br/>
                <div><h2>Số Lượng Kiến Nghị <% out.print(tk.SoLuong); %></h2></div>
                <div><h2>Đã Trả Lời <% out.print(tk.DaTraLoi); %></h2></div>
                <div><h2>Chưa Trả Lời <% out.print(tk.ChuaTraLoi); %></h2></div>
                <div><h2>Các Loại Kiến Nghị <% out.print(tk.CacLoai); %></h2></div>
                <div><h2>Đã Phân Loại <% out.print(tk.DaPhanLoai); %></h2></div>
                <div><h2>Chưa Phân Loại <% out.print(tk.ChuaPhanLoai); %></h2></div>
            </div>
    </div>
</div>
    </body>
</html>
