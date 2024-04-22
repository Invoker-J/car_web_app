<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/22/2024
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        padding: 0;
    }
</style>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title text-center">User Registration</h5>
                </div>
                <div class="card-body">
                    <form action="/register" method="post">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input name="firstName" type="text" class="form-control" id="firstName" placeholder="Enter first name">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input name="lastName" type="text" class="form-control" id="lastName" placeholder="Enter last name">
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input name="age" type="number" class="form-control" id="age" placeholder="Enter age">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input name="email" type="email" class="form-control" id="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Enter password">
                        </div>

                        <div class="form-group">
                            <label for="password_repeat">Repeat password</label>
                            <input name="rePassword" type="password" class="form-control" id="password_repeat" placeholder="Repeat password">
                        </div>
                        <!-- You can add more form fields here -->
                        <button class="btn btn-primary btn-block">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
