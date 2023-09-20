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
            <select name="property">
                <option value="id">Id</option>
                <option value="username">Username</option>
                <option value="password">Password</option>
            </select>
            <input type="submit" value="SEARCH">
        </form>

        <button onclick="addNew()">Add new</button>

        <br/>
        <br/>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Password</th>
                <td>ACTION</td>
            </tr>
            <c:forEach items="${listAccount}" var="account">
                <tr>
                    <!--Id-->
                    <td>${account.id}</td>
                    <!--Username-->
                    <td>${account.name}</td>
                    <!--Password-->
                    <td>${account.password}</td>
                    <td>
                        <form action="home?action=delete&id=${account.id}" method="POST">
                            <input type="submit" value="Delete"/>
                        </form>
                        
                    </td>
                </tr>
            </c:forEach>

        </table>


        <form action="home?action=add" method="POST" id="form-add" style="display: none">
            <h1>Form dang ki </h1>
            <br/><br/>
            Username <input type="text" name="username"/>
            <br/><br/>
            Password <input type="password" name="password"/>

            <button type="submit">Register</button>
        </form>

        <script>
            function addNew() {
                let formAdd = document.getElementById("form-add");
                //chinh sua thuoc tinh display = block
                if (formAdd.style.display == "block") {
                    formAdd.style.display = "none";
                } else {
                    formAdd.style.display = "block";
                }
            }
        </script>
    </body>
</html>
