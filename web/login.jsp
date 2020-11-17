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
        <form action="login" method="post"> 
            <h1>Login</h1>
            <input type="text" name="username" placeholder="User name">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" value="login">
            <hr>
        </form>
    </body>
</html>
