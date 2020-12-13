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
<%@page import="models.KienNghi"%>
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
        <h1>Hello World!</h1>
                <%
                    List<KienNghi> listKienNghi = PhanHoiService.getKienNghiPhanHoi(1);
                                        List<KienNghi> listKienNghiChuaGop = (List<KienNghi>) request.getAttribute("listKNCG");
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
