package uz.pdp.car_web_app.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.car_web_app.entity.User;
import uz.pdp.car_web_app.entity.enums.RoleName;

import java.io.IOException;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;
import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;

@WebFilter(urlPatterns = "/admin/*")
public class SecurityFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        Object object = req.getSession().getAttribute("currentUser");
        if (object != null) {
            User user = (User) object;
            if (user.hasRole(RoleName.ROLE_ADMIN)||user.hasRole(RoleName.ROLE_SUPER_ADMIN)) {
                filterChain.doFilter(req, resp);
                return;
            }
        }

        for (Cookie cookie : req.getCookies()) {
            if (cookie.getName().equals("userId")) {
                UUID userId = UUID.fromString(cookie.getValue());
                User user = entityManagerFactory.createEntityManager().find(User.class, userId);
                if (user != null) {

                    req.setAttribute("currentUser", user);
                    if (user.hasRole(RoleName.ROLE_ADMIN)||user.hasRole(RoleName.ROLE_SUPER_ADMIN)) {
                        filterChain.doFilter(req, resp);
                        return;
                    }
                    break;
                }
            }
        }
        resp.sendRedirect("/404");
    }
}
