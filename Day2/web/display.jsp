<%-- 
    Document   : display
    Created on : Sep 6, 2023, 9:22:32 PM
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
        <h1>Username: ${account.getUsername()}</h1>
        <h1>Password: ${account.getPassword()}</h1>
    </body>
</html>
