<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.car_web_app.repo.UserRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.car_web_app.repo.CompanyRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="uz.pdp.car_web_app.repo.CarRepo" %>
<%@ page import="java.util.Base64" %>
<%@ page import="uz.pdp.car_web_app.entity.CarDetail" %>
<%@ page import="java.util.Objects" %>
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

    String companyId = null;
    if (request.getParameter("companyId") != null) {
        companyId = request.getParameter("companyId");
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
            <a class="btn btn-success text-white me-2 mx-1" href="register.jsp">Sign up</a>
            <% } %>
        </div>
    </div>
</nav>


<div class="row">

    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <%for (Company company : companies) {%>
            <a href="index.jsp?companyId=<%=company.getId()%>">
                <%if (Objects.equals(companyId, company.getId().toString())) {%>
                <li class="list-group-item ">
                    <button class="btn btn-dark btn-lg w-100"><%=company.getName()%>
                    </button>
                </li>
                <% continue;
                } %>
                <li class="list-group-item ">
                    <button class="btn btn-success w-100"><%=company.getName()%>
                    </button>
                </li>
            </a>
            <% } %>
        </ul>
    </div>

    <div class="col-9">
        <div class="row">
            <% for (Car car : cars) { %>
                <%if (Objects.equals(companyId, car.getCompany().getId().toString()) || companyId==null) { %>
            <div class="col-3">
                <div class="card p-3">
                    <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(car.getPhoto())%>">
                    <h4 margin="0"><%=car.getName()%>
                    </h4>
                    <% for (CarDetail carDetail : car.getCarDetailList()) { %>
                    <p><%=carDetail.getKey() + ": " + carDetail.getValue()%>
                    </p>
                    <% }%>

                </div>
            </div>
                <% }%>
            <% } %>
        </div>
    </div>
</div>

</body>

</html>
