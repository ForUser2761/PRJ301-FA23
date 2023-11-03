<%-- 
    Document   : login
    Created on : 30-10-2022
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <h1>Login information</h1>
        <form action="MainController" method="POST">
            <input type="text" name="action" value="login" style="display:none"/>
            Username <input type="text" name="username" value="" />
            Password <input type="password" name="password" value="" />
            <input type="submit" value="Login" />
            <div style="color:red">${error}</div>
        </form>
    </body>
    
</html>

