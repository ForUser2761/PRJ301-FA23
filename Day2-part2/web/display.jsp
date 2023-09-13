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

        <button onclick="addNew()">Add new</button>

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
                        <button onclick="update(`${account.username}`,
                                        `${account.password}`,
                                        `${account.gender}`,
                                        `${account.hobbies}`)">Update</button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <br/><br/>
        <form action="home?action=register" method="POST" id="form-add" style="display: none">
            <h1>Form dang ki </h1>
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

        <form action="home?action=update" method="POST" id="form-update" style="display: none">
            <h1>Form dang ki </h1>
            Username <input type="text" name="username" value="" id="username-update"/>
            <br/><br/>
            Password <input type="password" name="password" id="password-update"/>
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

            function update(username, password, gender, hobbies) {
                let formAdd = document.getElementById("form-update");
                //chinh sua thuoc tinh display = block
                if (formAdd.style.display == "block") {
                    formAdd.style.display = "none";
                } else {
                    formAdd.style.display = "block";
                }
                //get username cua form update
                let usernameInput = document.getElementById("username-update");
                usernameInput.value = username;
                //get password cua form update
                let passwordUpdate = document.getElementById("password-update");
                passwordUpdate.value = password;
                //....

            }

        </script>   
    </body>

</html>
