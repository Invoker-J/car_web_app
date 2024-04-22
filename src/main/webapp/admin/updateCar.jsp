<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.car_web_app.entity.Company" %>
<%@ page import="uz.pdp.car_web_app.repo.CompanyRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.car_web_app.entity.User" %>
<%@ page import="uz.pdp.car_web_app.repo.CarRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Car" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/23/2024
  Time: 2:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update car</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>
<%
    UUID carId = UUID.fromString(request.getParameter("carId"));
    Car car = CarRepo.findById(carId);
    CompanyRepo companyRepo = new CompanyRepo();
    List<Company> companyList = companyRepo.findAll();
%>



<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title text-center">Add Car</h5>
                </div>
                <form enctype="multipart/form-data" action="/update/car" method="post">
                    <div class="form-group">
                        <label for="photo" >Photo</label>
                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(car.getPhoto()) %>" class="img-fluid" alt="Car Photo">
                        <input type="file" class="form-control-file" id="photo" name="photo" value="<%=Base64.getEncoder().encodeToString( car.getPhoto())%>">
                    </div>

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required value="<%=car.getName()%>">
                    </div>

                    <div class="form-group">
                        <label for="company">Company</label>
                        <select class="form-control" id="company" name="companyId" required>
                            <option value="<%=car.getCompany().getId()%>" selected disabled><%=car.getCompany().getName()%></option>
                            <% for (Company company : companyList) {%>
                            <option value="<%=company.getId()%>"><%=company.getName()%>
                            </option>
                            <% }%>
                        </select>
                    </div>
                    <input type="hidden" name="carId" value="<%=car.getId()%>">
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


</body>
</html>
