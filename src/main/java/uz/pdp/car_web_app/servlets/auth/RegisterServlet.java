package uz.pdp.car_web_app.servlets.auth;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.car_web_app.config.DBConfig;
import uz.pdp.car_web_app.entity.Role;
import uz.pdp.car_web_app.entity.User;
import uz.pdp.car_web_app.entity.enums.RoleName;

import java.io.IOException;
import java.util.List;

import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;

@WebServlet(name = "register", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("car_market");;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Integer age = Integer.parseInt(req.getParameter("age"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rePassword = req.getParameter("rePassword");

        if (!password.equals(rePassword)) {
            resp.sendRedirect("/register.jsp");
            return;
        }

        User user = User.builder()
                .firstName(firstName)
                .lastName(lastName)
                .age(age)
                .email(email)
                .role(List.of( Role.builder().name(RoleName.ROLE_USER).build()))
                .password(password)
                .build();

        entityManager.persist(user);
        System.out.println("======================================================================");
        entityManager.getTransaction().commit();
        resp.sendRedirect("/");
    }
}
