<%-- 
    Document   : display
    Created on : Sep 4, 2023, 2:22:50 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách tài khoản</title>
</head>
<body>
    <h1>Danh sách tài khoản</h1>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Gender</th>
            <th>Role</th>
            <th>Hobbies</th>
        </tr>
        <c:forEach items="${accountList}" var="account">
            <tr>
                <td>${account.username}</td>
                <td>${account.gender}</td>
                <td>${account.role}</td>
                <td>
                    <c:forEach items="${account.hobbies}" var="hobby">
                        ${hobby}<br>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
