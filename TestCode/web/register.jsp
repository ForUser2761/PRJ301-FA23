<%-- 
    Document   : register
    Created on : Sep 4, 2023, 2:10:07 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký tài khoản</title>
    </head>
    <body>
        <h1>Đăng ký tài khoản</h1>
        <form action="register" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>

            <label>Gender:</label>
            <input type="radio" id="male" name="gender" value="male"> Male
            <input type="radio" id="female" name="gender" value="female"> Female<br><br>

            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="admin">Admin</option>
                <option value="user">User</option>
            </select><br><br>

            <label>Hobbies:</label><br>
            <input type="checkbox" id="hobby1" name="hobbies" value="Reading"> Reading
            <input type="checkbox" id="hobby2" name="hobbies" value="Gaming"> Gaming
            <input type="checkbox" id="hobby3" name="hobbies" value="Cooking"> Cooking<br><br>

            <input type="submit" value="Đăng ký">
        </form>
    </body>
</html>

