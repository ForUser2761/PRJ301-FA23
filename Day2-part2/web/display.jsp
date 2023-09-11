<%-- 
    Document   : display
    Created on : Sep 11, 2023, 8:23:59 PM
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
        <h1>Danh sách tài khoản</h1>
        <form action="home?action=search" method="POST">
            <input type="text" placeholder="Nhap vao username" name="username"/>
            <button type="submit">Search</button>
        </form>
        <br/><br/>
        
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Gender</th>
                <th>Role</th>
                <th>Hobbies</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${listAccount}" var="account">
                <tr>
                    <!--Username-->
                    <td>${account.username}</td>
                    <!--Password-->
                    <td>${account.password}</td>
                    <!--Gender-->
                    <td>${account.gender == 'Male' ? "Male" : "Female"}</td>
                    <!--Role-->
                    <td>${account.role.name}</td>
                    <!--Hobbies-->
                    <td>
                        <c:forEach items="${account.hobbies}" var="hobby">
                            ${hobby}<br>
                        </c:forEach>
                    </td>
                    <td>
                        <form action="home?action=delete&username=${account.username}" method="POST">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
