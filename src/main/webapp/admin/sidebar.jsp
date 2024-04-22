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

</body>
</html>
