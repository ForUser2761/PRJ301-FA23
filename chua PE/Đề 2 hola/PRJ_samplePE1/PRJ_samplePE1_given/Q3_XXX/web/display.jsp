<%-- 
    Document   : display
    Created on : Oct 17, 2023, 8:30:30 PM
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
        <form action="insert" method="POST">
            Id <input type="text" name="id" value="" />
            <br/>
            Name<input type="text" name="name" value="" />
            <br/>

            Gender <input type="radio" name="gender" value="male" /> Male
            <input type="radio" name="gender" value="female" /> Female
            <br/>

            Dob <input type="text" name="dob" value="" />
            <br/>

            Skills
            <br/>
            <c:forEach items="${listSkills}" var="skill">
                <input type="checkbox" name="skill" value="${skill.id}" /> ${skill.name}
                <br/>
            </c:forEach>
            <input type="submit" value="Insert" />
        </form>
    </body>
</html>
