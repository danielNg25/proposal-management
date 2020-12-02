<%-- 
    Document   : login
    Created on : Oct 16, 2020, 9:18:32 PM
    Author     : 11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="common/login.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Nunito:600,700,900" rel="stylesheet">
        <title>Đăng Nhập</title>
    </head>
    <body id="body">
        <div id="login-card" class="card">
            <div class="card-body">
                <h2 class="text-center">Đăng Nhập</h2>
                <br>
                    <form action="login">
                    <div class="form-group">
                      <input type="text" class="form-control" id="email" placeholder="User Name" name="username">
                    </div>
                    <div class="form-group">
                       <input type="password" class="form-control" id="email" placeholder="Password" name="password">
                    </div>
                    <button type="submit" id="button" class="btn btn-primary deep-purple btn-block ">Đăng Nhập</button>
                    <br>
                    <br>
                    <div id="btn" class="text-center">
                        <button type="button" class="btn btn-primary btn-circle btn-sm"><i class="fa fa-facebook"></i></button>
                        <button type="button" class="btn btn-danger btn-circle btn-sm"><i class="fa fa-google"></i></button>
                        <button type="button" class="btn btn-info btn-circle btn-sm"><i class="fa fa-twitter"></i></button>
                    </div>
                </form>
                <%
                    String err = request.getParameter("err");
                        if ("1".equals(err)) {
                            out.print("<h5 style=\"color: red;\">Username or password is incorrect</h5>");
                    }
                %>
            </div>
        </div>
    </body>
</html>
