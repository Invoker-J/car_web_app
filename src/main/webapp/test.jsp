<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.car_web_app.repo.CompanyRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="uz.pdp.car_web_app.repo.CarRepo" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
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
                <div class="card p-3">
                    <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>">
                    <h4 margin="0"><%=car.getName()%>
                    </h4>
<%--                    <h5 margin="0">Price: <%=car.getPrice()%>$</h5>--%>

<%--                    <%if (basket.getBasketProducts().containsKey(car)) { %>--%>
<%--                    <a href="#"--%>
<%--                       class="btn btn-outline-dark text-center align-text-bottom bg-secondary">--%>
<%--                        Chosen--%>
<%--                    </a>--%>
<%--                    <% } else {%>--%>
                    <a href="http://localhost:8080/add/category?id=<%=car.getId()%>"
                       class="btn btn-outline-dark text-center align-text-bottom bg-info">
                        Choose
                    </a>
<%--                    <% } %>--%>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

</body>

</html>
