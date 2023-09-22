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
                        <!--Delete-->
                        <form action="home?action=delete&id=${account.id}" method="POST">
                            <input type="submit" value="Delete"/>
                        </form>
                        <!--Update-->
                        <button onclick="update(`${account.name}`, `${account.password}`, `${account.id}`)">Update</button>
                    </td>

                </tr>
            </c:forEach>

        </table>

        <!--Form dang ki-->
        <form action="home?action=add" method="POST" id="form-add" style="display: none">
            <h1>Form dang ki </h1>
            <br/><br/>
            Username <input type="text" name="username"/>
            <br/><br/>
            Password <input type="password" name="password"/>

            <button type="submit">Register</button>
        </form>

        <!--Form update-->
        <form action="home?action=update" method="POST" id="form-update" style="display: none">
            <h1>Form Update </h1>
            <br/><br/>
            <input type="text" name="id" style="display:none"/>
            Username <input type="text" name="username" />
            <br/><br/>
            Password <input type="password" name="password"/>

            <button type="submit">Update</button>
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

            function update(username, password, id) {
                //hien thi ra form update
                let formUpdate = document.getElementById("form-update");
                if (formUpdate.style.display == "block") {
                    formUpdate.style.display = "none";
                } else {
                    formUpdate.style.display = "block";
                }

                //lay cac username, password tu tham so dap vao ben trong form
                let usernameInput = document.querySelector("#form-update input[name='username']");
                let passwordInput = document.querySelector("#form-update input[name='password']");
                let idInput = document.querySelector("#form-update input[name='id']");
                
                console.log(id);
                usernameInput.value = username;
                passwordInput.value = password;
                idInput.value = id;
            }
        </script>
    </body>
</html>
