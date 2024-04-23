package uz.pdp.car_web_app.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.car_web_app.entity.Role;
import uz.pdp.car_web_app.entity.User;
import uz.pdp.car_web_app.repo.RoleRepo;
import uz.pdp.car_web_app.repo.UserRepo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;

@WebServlet(name = "edit user", value = "/user/edit")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        UUID userId = UUID.fromString(req.getParameter("userId"));
        String[] userRoles = req.getParameterValues("userRoles");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        Integer age = Integer.parseInt(req.getParameter("age"));
        String password = req.getParameter("password");

        User findUser = UserRepo.findByUserId(userId);

        List<Role> roles = new ArrayList<>();

        for (String userRole : userRoles) {
            Role role = RoleRepo.findById(UUID.fromString(userRole));

            roles.add(role);
        }

        User user = User.builder()
                .id(findUser.getId())
                .firstName(firstName)
                .lastName(lastName)
                .email(email)
                .password(password)
                .age(age)
                .role(roles)
                .build();

        UserRepo.edit(user);
        entityManager.getTransaction().commit();
        req.getSession().invalidate();

        resp.sendRedirect("http://localhost:8080/superadmin/user.jsp");
    }
}
