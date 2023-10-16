<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
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
        <form action="MainController">
            <input type="text" name="action" value="login" style="display:none" />
            Username: <input type="text" name="username" value="" />
            <br/>
            <br/>

            Password: <input type="password" name="password" value="" />
            <br/>
            <br/>
            <div style="color: red">${error}</div>
            <input type="submit" value="Login" />
        </form>
    </body>

</html>

