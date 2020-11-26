<%-- 
    Document   : info
    Created on : Nov 24, 2020, 11:07:40 AM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="models.KienNghi"%>
<%@page import="models.KienNghi"%>
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
                <div>
                    <%
                        List<KienNghi> listKienNghi = (List<KienNghi>) request.getAttribute("listKN");
                        int n = listKienNghi.size();
                    %>
                </div>
                <table align="center" border="1" cellspacing="5" cellpadding="5">
                     <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Phân loại</th>
                            <th>Nội dung</th>
                            <th>Ngày phản ánh</th>
                            <th>Trạng thái</th>
                            <th>ID người gửi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(int i = 0; i <n; i++){ %>

                        <tr>
                            <td><%=listKienNghi.get(i).getMaKienNghi() %></td>
                            <td><%=listKienNghi.get(i).getTieuDe() %></td>
                            <td><%=listKienNghi.get(i).getPhanLoai() %></td>
                            <td><%=listKienNghi.get(i).getNoiDung() %></td>
                            <td><%=listKienNghi.get(i).getNgayPhanAnh() %></td>
                            <td><%=listKienNghi.get(i).getTrangThai() %></td>
                            <td><%=listKienNghi.get(i).getNguoigui_id() %></td>
                        </tr>
                        <% } %>
                    </tbody>
  
                </table>
            </div>
        </div>
          

       
    </body>
</html>