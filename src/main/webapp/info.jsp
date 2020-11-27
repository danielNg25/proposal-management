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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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
                    <div class="button">
                        
                    </div>

                    <table class="table table-hover table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col" style="width: 2%"></th>
                                <th scope="col">Tiêu đề</th>
                                <th scope="col">Phân loại</th>
                                <th scope="col">Ngày phản ánh</th>
                                <th scope="col">Trạng thái</th>
                                <!--                            <th scope="col">ID người gửi</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < n; i++) {
                                    String href = "#" + "toggle" + i;
                                    String id = "toggle" + i;
                            %>

                            <tr>
                            <td>
                                <span style="cursor: pointer;" class="accordion-toggle collapsed"
                                        data-toggle="collapse" href="<%=href%>">+</span>
                            </td>
                                <td><%=listKienNghi.get(i).getTieuDe()%></td>
                                <td><%=listKienNghi.get(i).getPhanLoai()%></td>
                                <td><%=listKienNghi.get(i).getNgayPhanAnh()%></td>
                                <td><%=listKienNghi.get(i).getTrangThai()%></td>
                            </tr>
                            <tr class="hide-table-padding">
                                <td></td>
                                <td colspan="4">
                                    <div id="<%=id%>" class="collapse in p-3">
                                        <div class="row">
                                            <h5>Nội dung kiến nghị:</h5>
                                        </div>
                                        <div class="row">
                                            <p><%=listKienNghi.get(i).getNoiDung()%></p>
                                        </div>
                                    </div></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table></div>
            </div>
        </div>



    </body>
</html>