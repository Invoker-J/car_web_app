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

        .button {
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    List<Car> cars = entityManager.createQuery("from Car ", Car.class).getResultList();
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 col-lg-2 d-none d-md-block bg-white sidebar">
            <%@include file="sidebar.jsp" %>
        </nav>

        <!-- Content -->
<%--        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">--%>
<%--            <h1>Car page</h1>--%>
<%--            <h4>helle from car page</h4>--%>
<%--        </main>--%>
        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4 col-4 ">
            <h1>User</h1>

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
                                <td><img width="80" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>">
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
                                    <a class="btn button" href="addDetail.jsp?carId=<%=car.getId()%>">Add details</a>
                                </td>
                            </tr>
                        <% }%>
                </tbody>
            </table>


            <a href="addCar.jsp">Go add car</a>
        </main>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
