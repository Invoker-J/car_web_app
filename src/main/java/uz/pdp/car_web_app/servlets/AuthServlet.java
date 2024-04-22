package uz.pdp.car_web_app.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.car_web_app.entity.User;
import uz.pdp.car_web_app.entity.enums.RoleName;
import uz.pdp.car_web_app.repo.UserRepo;

import java.io.IOException;

import static uz.pdp.car_web_app.entity.enums.RoleName.ROLE_ADMIN;
import static uz.pdp.car_web_app.entity.enums.RoleName.ROLE_USER;

@WebServlet(name = "login",value = "/auth/login")
public class AuthServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = UserRepo.findByEmailAndPassword(email,password);

        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user);

        Cookie cookie = new Cookie("userId", user.getId().toString());
        cookie.setMaxAge(60*60);
        cookie.setPath("/");
        cookie.setSecure(false);
        resp.addCookie(cookie);

        if (user.hasRole(RoleName.ROLE_SUPER_ADMIN )||user.hasRole(ROLE_ADMIN)) {
            resp.sendRedirect("/admin/admin.jsp");
        }else if (user.hasRole(ROLE_USER)) {
            resp.sendRedirect("/");
        }

    }
}
