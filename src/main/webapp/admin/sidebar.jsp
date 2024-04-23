<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="uz.pdp.car_web_app.entity.enums.RoleName" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/21/2024
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    System.out.println("session.getAttribute(\"currentUser\") = " + session.getAttribute("currentUser"));
    User user = (User) session.getAttribute("currentUser");
%>

    <div class="sidebar-sticky">
        <h3 class="sidebar-heading">Navigation</h3>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="car.jsp">
                    <i class="fas fa-car mr-2"></i> Car
                </a>
            </li>
            <% if (user.hasRole(RoleName.ROLE_SUPER_ADMIN)) { %>
            <li class="nav-item">
                    <a class="nav-link" href="../superadmin/user.jsp">
                        <i class="fas fa-user mr-2"></i> User
                    </a>
            </li>
            <% } %>
        </ul>
    </div>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
