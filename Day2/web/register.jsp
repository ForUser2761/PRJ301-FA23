<%-- 
    Document   : register
    Created on : Sep 6, 2023, 9:11:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="register" method="POST">
            Username: <input type="text" name="username" value="" />
            <br/>            <br/>
            Password: <input type="password" name="password" value="" />
            <br/>            <br/>
            <button type="submit">Sumit</button>
        </form>
    </body>
</html>
