<%@ page import="static uz.pdp.car_web_app.config.DBConfig.entityManager" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="uz.pdp.car_web_app.entity.CarDetail" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/21/2024
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome for icons -->
</head>

<body>

<%
    List<Car> cars = entityManager.createQuery("from Car ", Car.class).getResultList();
%>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 col-lg-2 d-none d-md-block bg-white sidebar">
            <%@include file="sidebar.jsp" %>
        </nav>

        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4 col-4 ">

            <div class="container mt-9">
                <form action="addCar.jsp" class="row align-items-center">
                    <div class="col">
                        <h1>User</h1>
                    </div>
                    <div class="col">
                        <button class="btn btn-success float-right">Go add car</button>
                    </div>
                </form>
            </div>
            <br>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Company</th>
                    <th>Details</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                    <%for (Car car : cars) { %>
                            <tr>
                                <td><img width="50" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>">
                                </td>
                                <td><%=car.getName()%></td>
                                <td><%=car.getCompany().getName()%></td>
                                <td>
                                    <ul>
                                        <% if (!car.getCarDetailList().isEmpty()) { %>
                                                <% for (CarDetail carDetail : car.getCarDetailList()) {%>
                                                        <li><%=carDetail.getKey() + ": " + carDetail.getValue()%></li>
                                                   <% } %>
                                            <% }else {%>
                                        <li>No details</li>
                                            <% }%>
                                    </ul>
                                </td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <a href="addDetail.jsp?carId=<%=car.getId()%>" class="btn btn-outline-success btn-sm m-1">Add Detail</a>
                                        <a href="/delete/car?carId=<%=car.getId()%>" class="btn btn-outline-danger btn-sm m-1">Delete</a>
                                        <a href="updateCar.jsp?carId=<%=car.getId()%>" class="btn btn-outline-primary btn-sm m-1">Update</a>
                                    </div>
                                </td>
                            </tr>
                        <% }%>
                </tbody>
            </table>



        </main>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
