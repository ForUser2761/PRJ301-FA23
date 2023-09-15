<%-- 
    Document   : display
    Created on : Sep 15, 2023, 8:44:00 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="home?action=search" method="POST">
            <input type="text" name="keyword" placeholder="Hay nhap vao tu khoa de tim kiem"/> 
            <input type="submit" value="SEARCH">
        </form>
        <br/>
        <br/>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Password</th>
            </tr>
            <c:forEach items="${listAccount}" var="account">
                <tr>
                    <!--Id-->
                    <td>${account.id}</td>
                    <!--Username-->
                    <td>${account.name}</td>
                    <!--Password-->
                    <td>${account.password}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
