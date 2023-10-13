<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .register-container {
                max-width: 400px;
                margin: 0 auto;
                margin-top: 100px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }
            .register-container h2 {
                text-align: center;
                margin-bottom: 30px;
            }
            .register-container .form-group {
                margin-bottom: 20px;
            }
            .register-container label {
                font-weight: bold;
            }
            .register-container .btn {
                width: 100%;
            }
            .register-container .btn-link {
                background-color: transparent;
                color: #007bff;
                border-color: transparent;
            }
            .register-container .btn-link:hover {
                background-color: transparent;
                color: #0056b3;
                border-color: transparent;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="register-container">
                <h2>Register</h2>
                <form action="authen?action=register" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter your username" required name="username"> 
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" required name="password">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email" required name="email">
                    </div>
                    <div class="form-group">
                        <div style="color:red">${error}</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
                <div class="text-center mt-3 d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/authen?action=login" class="btn btn-link">Login</a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

