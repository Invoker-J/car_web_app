package uz.pdp.car_web_app.repo;

import uz.pdp.car_web_app.entity.User;

import java.util.List;

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
}
