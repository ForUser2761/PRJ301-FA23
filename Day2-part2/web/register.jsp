<%-- 
    Document   : register
    Created on : Sep 11, 2023, 7:39:26 PM
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
        <h1>Day la trang dang ki</h1>
        <form action="register" method="POST">
            Username <input type="text" name="username"/>
            <br/><br/>
            Password <input type="password" name="password"/>
            <br/><br/>
            Gender <input type="radio" name="gender" value="male"/> Male
            <input type="radio" name="gender" value="female"/> Female
            <br/><br/>
            Role <select name="role">
                <c:forEach items="${listRole}" var="role">
                    <option value="${role.id}">${role.name}</option>
                </c:forEach>

            </select>
            <br/><br/>
            Hobbies 
            <input type="checkbox" name="hobbies" value="Reading" /> Reading
            <input type="checkbox" name="hobbies" value="Gaming"/> Gaming
            <input type="checkbox" name="hobbies" value="Cooking"/> Cooking
            <input type="checkbox" name="hobbies" value="Racing" /> Racing
            <br/><br/>
            
            <button type="submit">Register</button>
        </form>
    </body>
</html>
