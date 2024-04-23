<%@ page import="uz.pdp.car_web_app.repo.RoleRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/23/2024
  Time: 1:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>


<%
    List<Role> roles = RoleRepo.findAll();
    UUID userId = UUID.fromString(request.getParameter("userId"));
    User user = UserRepo.findByUserId(userId);

%>

<div class="row mt-4">
    <div class="col-4 offset-4">
        <div class="card p-2">
            <div class="text-center">
                <h1>Edit user</h1>
            </div>
            <form action="http://localhost:8080/user/edit" method="post">
                <input name="userId" type="hidden" value="<%=user.getId()%>">
                <input value="<%=user.getFirstName()%>" name="firstName" class="form-control my-3" type="text"
                       placeholder="Name">
                <input value="<%=user.getLastName()%>" name="lastName" class="form-control my-3" type="text"
                       placeholder="Name">
                <input value="<%=user.getAge()%>" name="age" class="form-control my-3" type="text"
                       placeholder="Name">
                <input value="<%=user.getEmail()%>" name="email" class="form-control my-3" type="text"
                       placeholder="Name">
                <input value="<%=user.getPassword()%>" name="password" class="form-control my-3" type="text"
                       placeholder="Name">
                <label for="userRoles" class="form-label">User Roles:</label>
                <select class="form-select" id="userRoles" name="userRoles" multiple aria-label="Select User Roles">

                    <% for (Role role : roles) { %>

                    <% boolean isSelected = user.getRole().contains(role); %>

                    <option value="<%=role.getId()%>"
                            <% if (isSelected) { %>selected<% } %>><%=role.getName()%>
                    </option>
                    <% } %>

                </select>
                <div class="text-center form-control my-3">
                    <button class="btn btn-success btn-lg w-100">edit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--<select name="categoryId" class="form-control">--%>
<%--    <option value="" selected disabled>Select category</option>--%>
<%--    <%for (Category category : categories) {%>--%>
<%--    <option value="<%=category.getId()%>"><%=category.getName()%>--%>
<%--    </option>--%>
<%--    <%}%>--%>
<%--</select>--%>

<%--<div class="container mt-4">--%>
<%--    <h3>Select User Roles</h3>--%>

<%--    <!-- Multi-Select Button with User Roles -->--%>
<%--    <div class="mb-3">--%>
<%--        <label for="userRoles" class="form-label">User Roles:</label>--%>
<%--        <select class="form-select" id="userRoles" name="userRoles" multiple aria-label="Select User Roles">--%>
<%--            <option value="admin">Admin</option>--%>
<%--            <option value="editor">Editor</option>--%>
<%--            <option value="viewer">Viewer</option>--%>
<%--            <option value="contributor">Contributor</option>--%>
<%--            <option value="guest">Guest</option>--%>
<%--            <!-- Add more user roles as needed -->--%>
<%--        </select>--%>
<%--    </div>--%>

<%--    <!-- Submit button to confirm choice -->--%>
<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--</div>--%>

<!-- Include Bootstrap JS (Optional if you need interactions) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
