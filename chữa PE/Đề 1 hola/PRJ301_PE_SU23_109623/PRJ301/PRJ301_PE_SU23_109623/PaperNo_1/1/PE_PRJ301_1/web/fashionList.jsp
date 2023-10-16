<%-- 
    Document   : admin
    Created on : Mar 1, 2022, 8:29:12 PM
    Author     : hd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <c:if test="${user != null}">
            <h1>Welcome ${user.fullName}</h1>
            <a href="MainController?action=logout">Log out</a>

            <form action="MainController">
                <input type="text" name="action" value="search" style="display:none"/>
                <input type="text" name="keyword" value="" placeholder="Nhập vào name để tìm kiếm"/>
                <input type="submit" value="Search" />
            </form>

            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Size</th>
                        <th>Status</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${fashionList}" var="fas" varStatus="no">
                        <tr>
                            <td>${no.index + 1}</td>
                            <td>${fas.id}</td>
                            <td>${fas.name}</td>
                            <td>${fas.price}</td>
                            <td>${fas.size}</td>
                            <td>${fas.status}</td>
                            <td>${fas.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
