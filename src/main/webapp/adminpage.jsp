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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <title>Quản lý kiến nghị</title>
    </head>
    <body>
        <% 
        ThongKe tk = ThongKeService.getInfo();
        ThongKe Quy1 = ThongKeService.getThongKeQuy(1);
        ThongKe Quy2 = ThongKeService.getThongKeQuy(2);
        ThongKe Quy3 = ThongKeService.getThongKeQuy(3);
        ThongKe Quy4 = ThongKeService.getThongKeQuy(4);
        %>
        <div class="wrapper">
            <div class="sidebar">
                <h2>Quản Lý</h2>
                <ul>
                    <li><a href="adminpage.jsp"><i class="fas fa-home"></i>Trang chủ</a></li>
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
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary" onclick="drawChart1()">Quý 1</button>
                    <button type="button" class="btn btn-secondary" onclick="drawChart2()">Quý 2</button>
                    <button type="button" class="btn btn-secondary" onclick="drawChart3()">Quý 3</button>
                    <button type="button" class="btn btn-secondary" onclick="drawChart4()">Quý 4</button>
                </div>
              
            
                <div id="chart"></div>
              

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
                  var options = {'title':'Thống kê cả năm', 'width':900, 'height':700};

                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                }
                </script>
           
                <script>
                // Load google charts
                google.charts.load('current', {'packages':['corechart']});

                // Draw the chart and set the chart values
                function drawChart1() {
        
                 var data = google.visualization.arrayToDataTable([
                  ['Task', 'Number'],
                  ['Số lượng kiến nghị', <%=Quy1.getSoLuong() %>],
                  ['Đã trả lời', <%=Quy1.getDaTraLoi() %>],
                  ['Chưa trả lời', <%=Quy1.getChuaTraLoi() %>],
                  ['Các loại kiến nghị', <%=Quy1.getCacLoai() %>],
                  ['Đã phân loại', <%=Quy1.getDaPhanLoai() %>],
                  ['Chưa phân loại', <%=Quy1.getChuaPhanLoai() %>]
                ]); 

                  // Optional; add a title and set the width and height of the chart
                  var options = {'title':'Thống kê quý 1', 'width':900, 'height':700};

                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                }
                
                 function drawChart2() {
        
                 var data = google.visualization.arrayToDataTable([
                  ['Task', 'Number'],
                  ['Số lượng kiến nghị', <%=Quy2.getSoLuong() %>],
                  ['Đã trả lời', <%=Quy2.getDaTraLoi() %>],
                  ['Chưa trả lời', <%=Quy2.getChuaTraLoi() %>],
                  ['Các loại kiến nghị', <%=Quy2.getCacLoai() %>],
                  ['Đã phân loại', <%=Quy2.getDaPhanLoai() %>],
                  ['Chưa phân loại', <%=Quy2.getChuaPhanLoai() %>]
                ]); 

                  // Optional; add a title and set the width and height of the chart
                  var options = {'title':'Thống kê quý 2', 'width':900, 'height':700};

                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                }
                
                 function drawChart3() {
        
                 var data = google.visualization.arrayToDataTable([
                  ['Task', 'Number'],
                  ['Số lượng kiến nghị', <%=Quy3.getSoLuong() %>],
                  ['Đã trả lời', <%=Quy3.getDaTraLoi() %>],
                  ['Chưa trả lời', <%=Quy3.getChuaTraLoi() %>],
                  ['Các loại kiến nghị', <%=Quy3.getCacLoai() %>],
                  ['Đã phân loại', <%=Quy3.getDaPhanLoai() %>],
                  ['Chưa phân loại', <%=Quy3.getChuaPhanLoai() %>]
                ]); 

                  // Optional; add a title and set the width and height of the chart
                  var options = {'title':'Thống kê quý 3', 'width':900, 'height':700};

                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                }
                
                 function drawChart4() {
        
                 var data = google.visualization.arrayToDataTable([
                  ['Task', 'Number'],
                  ['Số lượng kiến nghị', <%=Quy4.getSoLuong() %>],
                  ['Đã trả lời', <%=Quy4.getDaTraLoi() %>],
                  ['Chưa trả lời', <%=Quy4.getChuaTraLoi() %>],
                  ['Các loại kiến nghị', <%=Quy4.getCacLoai() %>],
                  ['Đã phân loại', <%=Quy4.getDaPhanLoai() %>],
                  ['Chưa phân loại', <%=Quy4.getChuaPhanLoai() %>]
                ]); 

                  // Optional; add a title and set the width and height of the chart
                  var options = {'title':'Thống kê quý 4', 'width':900, 'height':700};

                  var chart = new google.visualization.BarChart(document.getElementById('chart'));
                  chart.draw(data, options);
                } 
                </script> 
               
    </div>
</div>
    </body>
</html>
