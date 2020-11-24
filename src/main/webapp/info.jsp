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
        <div>
            <%
                List<KienNghi> listKienNghi = (List<KienNghi>) request.getAttribute("listKN");
                for (KienNghi kn : listKienNghi)
                    out.print("<h2>" + kn.toString() + "</h2>");
            %>
        </div>
    </body>
</html>