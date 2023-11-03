<%-- 
    Document   : foodList
    Created on : 30-10-2022
    Author     : hd
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${account == null || account.roleID != 'ADMIN'}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food List Page</title>
    </head>
    <body>
        <!--your code here-->
        <h1>Welcome ${account.fullName}</h1>
        <a href="MainController?action=logout">Logout</a>

        <br/>
        <br/>
        <br/>

        <form action="MainController">
            <input type="text" name="action" value="search" style="display: none"/>
            Name: <input type="text" name="name" value="" />
            <input type="submit" value="Search" />
        </form>
        <br/>
        <br/>
        <br/>

        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Cooking Time</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="m" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${m.id}</td>
                        <td>${m.name}</td>
                        <td>${m.price}</td>
                        <td>${m.cookingTime}</td>
                        <td>${m.description}</td>
                        <td>${m.status}</td>
                        <td>
                            <a href="MainController?action=update&id=${m.id}"> Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
