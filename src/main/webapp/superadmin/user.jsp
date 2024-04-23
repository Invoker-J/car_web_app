<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.car_web_app.entity.Role" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/21/2024
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <style>
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            z-index: 100;
            padding: 48px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
        }

        .sidebar-heading {
            text-align: center;
            padding: 20px 0;
        }

        .sidebar .nav-link {
            color: #495057;
            font-weight: 500;
        }

        .sidebar .nav-link:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<%
    List<User> users = UserRepo.findAll();
    UUID userId = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")) {
                userId = UUID.fromString(cookie.getValue());
            }
        }
    }
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 col-lg-2 d-none d-md-block bg-white sidebar">
            <div class="sidebar-sticky">
                <h3 class="sidebar-heading">Navigation</h3>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="../admin/car.jsp">
                            <i class="fas fa-car mr-2"></i> Car
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user.jsp">
                            <i class="fas fa-user mr-2"></i> User
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Content -->
        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
            <h1>User</h1>
            <h4>Hello from user</h4>
        <div>
            <table class="table table-striped">
                <thead>

                <tr>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Age</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Roles</th>
                    <th>#</th>
                </tr>

                </thead>

                <tbody>
                <%for (User user : users) {%>

                <% if (userId != user.getId()) {%>
                <tr>
                    <td><%= user.getFirstName() %>
                    </td>
                    <td><%= user.getLastName() %>
                    </td>
                    <td><%= user.getAge()%>
                    </td>
                    <td><%= user.getEmail()%>
                    </td>
                    <td><%= user.getPassword()%>
                    </td>
                    <td>
                        <ul>
                            <%for (Role role : user.getRole()) {%>

                            <li><%= role.getName()%>
                            </li>
                            <%}%>
                        </ul>
                    <td>
                        <a href="/admin/editUser.jsp?userId=<%=user.getId()%>" class="btn btn-info text-white">edit</a>
                        <a href="http://localhost:8080/user/delete?userId=<%=user.getId()%>"
                           class="btn btn-dark text-white">delete</a>
                    </td>
                </tr>
                <%}%>
                <%}%>
                </tbody>

            </table>

        </div>
        </main>



    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
