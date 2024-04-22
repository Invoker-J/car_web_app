package uz.pdp.car_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import uz.pdp.car_web_app.entity.Car;
import uz.pdp.car_web_app.entity.Company;
import uz.pdp.car_web_app.repo.CarRepo;
import uz.pdp.car_web_app.repo.UserRepo;

import java.io.IOException;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;
@MultipartConfig
@WebServlet(name = "updateCar", value = "/update/car")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("photo");
        byte[] bytes = part.getInputStream().readAllBytes();
        String name = req.getParameter("name");
        UUID companyId = UUID.fromString(req.getParameter("companyId"));
        Company company = entityManager.find(Company.class, companyId);

        entityManager.getTransaction().begin();

        Car car = CarRepo.findById(UUID.fromString(req.getParameter("carId")));

        car.setCompany(company);
        car.setPhoto(bytes);
        car.setName(name);

        entityManager.persist(car);

        entityManager.getTransaction().commit();
        resp.sendRedirect("/admin/car.jsp");
    }
}
