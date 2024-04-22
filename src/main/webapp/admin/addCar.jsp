<%@ page import="uz.pdp.car_web_app.repo.CompanyRepo" %>
<%@ page import="uz.pdp.car_web_app.entity.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.grammars.hql.HqlParser" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/21/2024
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add car</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>
<%
//    Object attachmentId = session.getAttribute("attachmentId");

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
<%--                <div class="card-body">--%>
<%--                    <div class="form-group">--%>
<%--                        <form action="/file" enctype="multipart/form-data" method="post">--%>
<%--                            <label for="photo">--%>
<%--                            <% if (attachmentId == null) { %>--%>
<%--                                Photo--%>
<%--                                <% } else { %>--%>
<%--                                <img width="5" height="50" src="/file?id=<%=attachmentId%>>" alt="rasm">--%>
<%--                                <% } %>--%>
<%--                            </label>--%>
<%--                            <input type="hidden" value="/admin/addCar.jsp" name="redirection">--%>
<%--                            <input type="file" class="form-control-file" id="photo" name="file">--%>
<%--                            <button> upload </button>--%>
<%--                        </form>--%>
<%--                    </div>--%>


                    <form  enctype="multipart/form-data"  action="/add/car" method="post">
                        <div class="form-group">
                            <label for="photo">Photo</label>
                            <input type="file" class="form-control-file" id="photo" name="photo">
                        </div>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label for="company">Company</label>
                            <select class="form-control" id="company" name="companyId" required>
                                <option value="" selected disabled>Select company</option>
                                <% for (Company company : companyList) {%>
                                    <option value="<%=company.getId()%>"> <%=company.getName()%> </option>
                                <% }%>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</body>
</html>
