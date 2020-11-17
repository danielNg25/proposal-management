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
        <title>Login Page</title>
    </head>
    <body>
        <form action="LoginController" method="POST"> 
            <h1>Login</h1>
            <h6>{{ message }}</h6>
            <input type="text" class="form-control" name="username" placeholder="User name">
            <input type="password" class="form-control" name="password" placeholder="Password">
            <button type="submit" class="btn btn-primary">Login</button>
            <hr>
        </form>
    </body>
</html>
