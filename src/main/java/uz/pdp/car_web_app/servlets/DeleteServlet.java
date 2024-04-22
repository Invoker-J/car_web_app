package uz.pdp.car_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.car_web_app.repo.CarRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "deleteCar", value = "/delete/car")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID id = UUID.fromString(req.getParameter("carId"));
        CarRepo.deleteCar(id);
        System.out.println("Delete Boldi ========================================================================================================================================");
        resp.sendRedirect("/admin/car.jsp");
    }
}
