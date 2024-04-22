package uz.pdp.car_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.car_web_app.entity.CarDetail;

import java.io.IOException;
import java.util.List;
import java.util.UUID;


@WebServlet(name = "add detail", value = "/admin/detail")

public class AddDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID carId = UUID.fromString(req.getParameter("carId"));
        HttpSession session = req.getSession();
        List<CarDetail> details = (List<CarDetail>) session.getAttribute("details");
    }
}

