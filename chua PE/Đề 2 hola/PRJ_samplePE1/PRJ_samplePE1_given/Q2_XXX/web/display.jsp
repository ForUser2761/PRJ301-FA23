<%-- 
    Document   : display
    Created on : Oct 17, 2023, 8:09:14 PM
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
        <form action="search" method="POST">
            Name: <input type="text" name="keyword"/>
            <input type="submit" value="Search" />
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>DOb</th>
                    <th>Gender</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="st">
                <tr>
                    <td>${st.id}</td>
                    <td>${st.name}</td>
                    <td>${st.dob}</td>
                    <td>${st.gender}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
