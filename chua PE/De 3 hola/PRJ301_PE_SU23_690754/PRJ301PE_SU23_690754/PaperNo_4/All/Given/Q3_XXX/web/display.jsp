<%-- 
    Document   : display
    Created on : Oct 18, 2023, 8:11:33 PM
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
        <h2>List of Students:</h2>

        <table border="1">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Date of birth</th>
                    <th>Gender</th>
                    <th>Select</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listStudent}" var="std">
                    <tr>
                        <td>${std.getStudentID()}</td>
                        <td>${std.getStudentName()}</td>
                        <td>${std.getBirthDate()}</td>
                        <td>${std.isGender() == '1' ? 'Male' : 'Female'}</td>
                        <td><a href="#" target="target">Select</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <br/>
        Detail of information: 
        <table>
            <tr>
                <td class="label">Code:</td>
                <td class="input"><input type="text"></td>
                <td class="label">Name:</td>
                <td class="input"><input type="text"></td>
            </tr>
            <tr>
                <td class="label">Date of birth:</td>
                <td class="input"><input type="text"></td>
                <td class="label">Gender:</td>
                <td>
                    <input type="radio" id="male" name="gender" value="male">
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="female" checked>
                    <label for="female">Female</label>
                </td>
            </tr>
            <tr>
                <td class="label">Class:</td>
                <td class="input">
                    <select>
                        <c:forEach items="${listClass}" var="cl">
                            <option value="${cl.getClassID()}">${cl.getClassName()}</option>
                        </c:forEach>
                    </select>
                </td>
                <td></td>
                <td><button>Update</button></td>
            </tr>
        </table>
    </body>
</html>
