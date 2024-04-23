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

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;
import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;
@MultipartConfig
@WebServlet(name = "addCar", value = "/add/car")
public class AddCarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("photo");
        byte[] bytes = part.getInputStream().readAllBytes();
        String name = req.getParameter("name");
        UUID companyId = UUID.fromString(req.getParameter("companyId"));
        Company company = entityManager.find(Company.class, companyId);

        entityManager.getTransaction().begin();

        Car car = Car.builder()
                .company(company)
                .photo(bytes)
                .carDetailList(List.of())
                .name(name)
                .build();
        entityManager.persist(car);

        entityManager.getTransaction().commit();
        resp.sendRedirect("/admin/car.jsp");
    }
}
