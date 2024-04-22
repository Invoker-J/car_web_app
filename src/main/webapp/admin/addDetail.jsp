<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.car_web_app.entity.CarDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/22/2024
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add car detail</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>

<%
    UUID carId = UUID.fromString(request.getParameter("carId"));
    List<CarDetail> carDetails = new ArrayList<>();
    Object object = session.getAttribute("details");
    if (object != null) {
        carDetails = (List<CarDetail>) object;
    }
%>

<% for (CarDetail carDetail : carDetails) {%>
        <p><%=carDetail.getKey() +": " + carDetail.getValue()%></p>
    <% }%>

<form action="/admin/add/detail" method="post">
    <div class="form-group d-flex">
        <input type="hidden" name="carId" value="<%=carId%>">
        <input type="text" name="key" class="form-control m-3" placeholder="Key">
        <input type="text" name="value" class="form-control m-3" placeholder="Value">
    </div>
    <button class="btn btn-dark m-3">Add</button>
    <br>
    <br>
    <br>
    <form action="/admin/detail" method="post">
        <input type="hidden" value="<%=carId%>" name="carId">
        <button class="btn btn-dark">Save Changes</button>
    </form>
</form>

</body>
</html>
