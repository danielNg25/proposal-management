<%-- 
    Document   : test
    Created on : Dec 13, 2020, 1:58:36 PM
    Author     : VietAnh
--%>
<%@page import="services.PhanHoiService"%>
<%@page import="models.PhanHoi"%>
<%@page import="Bean.KienNghiGopBean"%>
<%@page import="models.KienNghiGop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="models.KienNghi"%>
<%@page import="java.util.Calendar"%>
<%@page import="models.PhanHoiForUser"%>
<%@page import="java.util.Date"%>
<%@page import="models.NguoiDan"%>
<%@page import="models.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
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
                <%
                    
                    List<KienNghi> listKienNghi = (List<KienNghi>) request.getAttribute("listKN");
                    List<KienNghi> listChuaPhanHoi = (List<KienNghi>) request.getAttribute("listCPH");
                %>
        <table class="table table-hover table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 2%"></th>
                                    <th scope="col">Tiêu đề</th>
                                    <th scope="col">                                      
                                        <div class="dropdown">
                                            Phân loại
                                        </div>            
                                    </th>
                                    <th scope="col">
                                        Ngày phản ánh

                                    </th>
                                    <th scope="col">
                                        Trạng thái
                                        </div></th>
                                </tr>
                            </thead>
                            <!--</form>-->

                            <tbody>
                                
                                <%
                                    for (int i = 0; i < listChuaPhanHoi.size(); ++i) {
                                        KienNghi kn = listChuaPhanHoi.get(i);
                                        String hrefToggleId = "#" + "toggle1" + (i + listKienNghi.size());
                                        String toggleId = "toggle1" + (i + listKienNghi.size());

                                %>

                                <tr>
                                    <td></td>
                                    <td><%=kn.getTieuDe()%></td>
                                    <td><%=kn.getPhanLoai()%></td>
                                    <td><%=kn.getNgayPhanAnh()%></td>
                                    <td><%=kn.getTrangThai()%></td>
                                </tr>
                                
                                <% }
                                    %>
                                
                                <%
                                    for (int i = 0; i < listKienNghi.size(); ++i) {
                                        KienNghi kn = listKienNghi.get(i);
                                        String hrefToggleId = "#" + "toggle" + (i + listKienNghi.size());
                                        String toggleId = "toggle" + (i + listKienNghi.size());

                                %>

                                <tr>
                                    <td>
                                        <span style="cursor: pointer;" class="accordion-toggle collapsed"
                                              data-toggle="collapse" href="<%=hrefToggleId%>">+</span>
                                    </td>
                                    <td><%=kn.getTieuDe()%></td>
                                    <td><%=kn.getPhanLoai()%></td>
                                    <td><%=kn.getNgayPhanAnh()%></td>
                                    <td><%=kn.getTrangThai()%></td>
                                </tr>
                                <tr class="hide-table-padding">
                                    <td></td>
                                    <td colspan="5">
                                        <div id="<%=toggleId%>" class="collapse in p-3">
                                            <div class="row">
                                                <h5>Nội dung kiến nghị:</h5>
                                            </div>
                                            <div class="row">
                                                <p><%=kn.getNoiDung()%></p>
                                            </div>
                                            <div class="row">
                                                <h5>Nội dung phản hồi:</h5>
                                            </div>
                                            <div class="row">
                                                <p><%=kn.getNoiDungPhanHoi()%></p>
                                            </div>
                                            <div class="row">

                                            </div>
                                        </div></td>
                                </tr>
                                <% }
                                    %>

                            </tbody>
                        </table>
    </body>
</html>
