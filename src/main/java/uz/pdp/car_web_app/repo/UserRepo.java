package uz.pdp.car_web_app.repo;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import uz.pdp.car_web_app.entity.Car;
import uz.pdp.car_web_app.entity.User;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;

public class UserRepo {

    public static User findByEmailAndPassword(String email, String password) {
        User user = entityManager.createQuery("select u from User u where u.email =:email ", User.class)
                .setParameter("email", email).getSingleResult();

        if (user != null) {
            if (user.getPassword().equals(password)) {
                return user;
            }
        }

        throw new RuntimeException("User not found");
    }

    public static List<User> findAll() {
        return entityManager.createQuery("from User ", User.class).getResultList();
    }

    public static User getUserByCookie(HttpServletRequest request) {
        if (request.getCookies() == null) {
            return null;
        }
        for (Cookie cookie : request.getCookies()) {

            if (cookie.getName().equals("userId")) {
                return findByUserId(UUID.fromString(cookie.getValue()));
            }
        }
        return null;
    }

    private static User findByUserId(UUID uuid) {
        return entityManager.find(User.class,uuid);
    }
}
