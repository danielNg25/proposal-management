<%-- 
    Document   : adminpage
    Created on : Nov 23, 2020, 9:53:36 PM
    Author     : MSI GV62
--%>

<%@page import="models.ThongKe"%>
<%@page import="services.ThongKeService"%>
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
        <% 
        ThongKe tk = ThongKeService.getInfo();
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
        
                <div id="chart"></div>

                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

                <script type="text/javascript">
                // Load google charts
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);

                // Draw the chart and set the chart values
                function drawChart() {
                  var data = google.visualization.arrayToDataTable([
                  ['Task', 'Number'],
                  ['Số lượng kiến nghị', <%=tk.getSoLuong() %>],
                  ['Đã trả lời', <%=tk.getDaTraLoi() %>],
                  ['Chưa trả lời', <%=tk.getChuaTraLoi() %>],
                  ['Các loại kiến nghị', <%=tk.getCacLoai() %>],
                  ['Đã phân loại', <%=tk.getDaPhanLoai() %>],
                  ['Chưa phân loại', <%=tk.getChuaPhanLoai() %>]
                ]);

                  // Optional; add a title and set the width and height of the chart
                  var options = {'title':'My Average Day', 'width':550, 'height':400};

                  // Display the chart inside the <div> element with id="piechart"
                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                }
                </script>
    </div>
</div>
    </body>
</html>
