<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Company" %>
<%@ page import="uz.pdp.car_web_app.repo.CompanyRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="uz.pdp.car_web_app.repo.CarRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/2/2024
  Time: 3:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">

</head>
<body>

<%
    //    User user = UserRepo.getUser(session);
    User user = null;

    Object obj = session.getAttribute("currentUser");
    if (obj != null) {
        user = (User) obj;
    }


    User optionalUser = UserRepo.getUserByCookie(request);
    if (optionalUser != null) {
        user = optionalUser;
    }




//    System.out.println("Basket: " + basket);

    List<Company> companies = CompanyRepo.findAll();

    List<Car> cars = CarRepo.findAll();
%>
<nav class="navbar bg-body-tertiary bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Car market</a>
        <div class="d-flex">

            <% if (user != null) { %>
            <a class="btn btn-success text-white me-2 mx-1" href="/auth/logout">Log out</a>
            <% } else { %>
            <a class="btn btn-success text-white me-2 mx-1" href="login.jsp">Login</a>
            <a class="btn btn-success text-white me-2 mx-1" href="signup.jsp">Sign up</a>
            <% } %>
        </div>
    </div>
</nav>


<div class="row">
    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <%for (Company company : companies) {%>
            <a href="user/pageByCategory.jsp?id=<%=company.getId()%>">
                <li class="list-group-item"><%=company.getName()%>
                </li>
            </a>
            <% } %>
        </ul>
    </div>



    <div class="col-9">
        <div class="row">
            <% for (Car car : cars) { %>
            <div class="col-3">
                <div class="card p-3" >
                    <%if(Objects.equals(car.getPhoto(),null)){%>
                    <% System.out.println(Arrays.toString(car.getPhoto()));
                        continue;}%>
                    <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>" alt="topilmadi">
                    <h4 margin="0"><%=car.getName()%></h4>
                    <h5 margin="0">Price: </h5>


                    <a href="http://localhost:8080/add/category?id=<%=car.getId()%>"
                       class="btn btn-outline-dark text-center align-text-bottom bg-info">
                        Choose
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </div>

</div>

</body>
</html>