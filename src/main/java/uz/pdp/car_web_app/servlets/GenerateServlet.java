package uz.pdp.car_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.car_web_app.entity.CarDetail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "eddDetail", value = "/admin/add/detail")
public class GenerateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        String value = req.getParameter("value");
        UUID carId = UUID.fromString(req.getParameter("carId"));
        CarDetail carDetail = CarDetail.builder()
                .key(key)
                .value(value)
                .build();

        List<CarDetail> carDetails = new ArrayList<>();
        HttpSession session = req.getSession();
        Object object = session.getAttribute("details");
        if (object != null) {
            carDetails = (List<CarDetail>) object;
        }
        carDetails.add(carDetail);
        session.setAttribute("details",carDetails);
        resp.sendRedirect("/admin/addDetail.jsp?carId=" + carId);
    }
}
