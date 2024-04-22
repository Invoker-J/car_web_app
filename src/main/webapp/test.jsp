<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.car_web_app.repo.CarRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/22/2024
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%List<User> users = UserRepo.findAll();%>
<%List<Car> cars = CarRepo.findAll();%>

<% for (Car car : cars) { %>
<img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>" alt="ERRRRRRRRRRR">
    <% } %>


</body>
</html>
