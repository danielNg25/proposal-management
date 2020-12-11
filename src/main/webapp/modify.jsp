<%-- 
    Document   : modify
    Created on : Dec 10, 2020, 8:13:00 PM
    Author     : 11
--%>

<%@page import="models.KienNghiGop"%>
<%@page import="services.KienNghiService"%>
<%@page import="java.util.List"%>
<%@page import="models.KienNghi"%>
<%@page import="Bean.KienNghiGopBean"%>
<%@page import="services.GopKienNghiService"%>
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
    <title>Quản lý kiến nghị</title>
  </head>
  <body>
    <%
      int kngID = Integer.parseInt(request.getParameter("kngID"));
      KienNghiGopBean kngb = GopKienNghiService.getKienNghiGopBean(kngID);
      List<KienNghi> kienNghiThanhPhan = kngb.getThanhPhanGop();
      KienNghiGop kng = kngb.getKienNghiGop();
      List<KienNghi> listKienNghiChuaGop = KienNghiService.getKienNghiChuaGop();
      String err = request.getParameter("err");
    %>
    <div class="wrapper">
      <div class="sidebar">
        <h2>Chỉnh sửa</h2>
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
        <form action="chinhSua" id="chinhSuaGop" method="post">
          <input type="hidden" name="kngID" value="<%=kngID%>">
          <div class="row justify-content-center">
            <div class="col-lg-11">
              <br>
              <a href="/QuanLyKienNghi/quanly" class="btn btn-primary btn-lg">Quay lại</a>

              <hr>
              <div class="row">
                <div class="col-lg-7">
                  <p class="font-weight-bold">Tiêu đề gộp:</p>
                  <p class="font-weight-normal"><%=kng.getTieuDeGop()%></p>
                </div>
                <div class="col-lg-5">
                  <p class="font-weight-bold">Số lần phản ánh: </p>
                  <p class="font-weight-normal"><%=kng.getSoLanPA()%></p>
                </div>
                <div class="col-lg-12">
                  <p class="font-weight-bold">Nội dung gộp:</p>
                  <p class="font-weight-normal"><%=kng.getNoiDungGop()%></p>
                </div>
              </div>
              <hr>
              <div class="row justify-content-center">
                <%
                  if ("1".equals(err) || "2".equals(err)) {
                    out.print("<h5 style=\"color: red;\">Chưa chọn kiến nghị!</h5>");
                  }
                  if ("3".equals(err)) {
                    out.print("<h5 style=\"color: red;\">Chưa điền tiêu đề hoặc nội dung!</h5>");
                  }
                %>
              </div>
              <div class="header"><h2>Xóa kiến nghị</h2></div>
              <table class="table table-hover table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Phân loại</th>
                    <th scope="col">Ngày phản ánh</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col" style="width: 2%"></th>
                  </tr>
                </thead>
                <tbody>
                  <% for (int j = 0; j < kienNghiThanhPhan.size(); ++j) {
                      KienNghi kn = kienNghiThanhPhan.get(j);
                      String checkboxIDThanhPhan = "customCheckThanhPhan" + Integer.toString(j);
                      int idThanhPhan = kn.getMaKienNghi();
                  %>

                  <tr>
                    <td><%=j + 1%></td>
                    <td><%=kn.getPhanLoai()%></td>
                    <td><%=kn.getNgayPhanAnh()%></td>
                    <td><%=kn.getTrangThai()%></td>
                    <td>
                      <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="<%=checkboxIDThanhPhan%>" name="deleteKNTP"
                               value="<%=idThanhPhan%>">
                        <label class="custom-control-label" for="<%=checkboxIDThanhPhan%>"></label>
                      </div>
                    </td>
                  </tr>
                  <% }%>
                </tbody>
              </table>

              <div class="row justify-content-center">
                <button type="submit" name="xoaTP" form="chinhSuaGop" class="btn btn-warning">Xóa</button>
              </div>
              <hr>
              <div class="header"><h2>Thêm kiến nghị</h2></div>    
              <table class="table table-hover table-bordered">
                <thead class="thead-light">
                  <tr>
                    <th scope="col" style="width: 2%"></th>
                    <th scope="col">Tiêu đề</th>
                    <th scope="col">Phân loại</th>
                    <th scope="col">Ngày phản ánh</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col" style="width: 2%"></th>
                  </tr>
                </thead>
                <!--</form>-->

                <tbody>

                  <% for (int i = 0; i < listKienNghiChuaGop.size(); ++i) {
                      KienNghi kn = listKienNghiChuaGop.get(i);
                      String hrefToggleId = "#" + "toggle" + i;
                      String toggleId = "toggle" + i;
                      int id = kn.getMaKienNghi();
                      String checkboxID = "customCheck" + Integer.toString(i);
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
                    <td>
                      <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="<%=checkboxID%>" name="insertKNTP"
                               value="<%=id%>">
                        <label class="custom-control-label" for="<%=checkboxID%>"></label>
                      </div>
                    </td>
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
                      </div></td>
                  </tr>
                  <% }%>

                </tbody>
              </table>
              <div class="row justify-content-center">
                <button type="submit" name="themTP" form="chinhSuaGop" class="btn btn-warning">Thêm</button>
              </div>
              <hr>
              <div class="header"><h2>Thay đổi</h2></div>
              <div class="form-group">
                <label for="inputTieuDe">Tiêu đề gộp mới</label>
                <input type="text" class="form-control" id="inputTieuDe" name="tieuDeGopMoi">
              </div>
              <div class="form-group">
                <label for="inputNoiDung">Nội dung gộp mới</label>
                <textarea class="form-control" id="inputNoiDung" rows="5" name="noiDungGopMoi"></textarea> 
              </div>

              <div class="row justify-content-center">
                <button type="submit" name="thayDoi" form="chinhSuaGop" class="btn btn-warning">Đồng ý</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
