package uz.pdp.car_web_app.repo;

import uz.pdp.car_web_app.config.DBConfig;
import uz.pdp.car_web_app.entity.Car;
import uz.pdp.car_web_app.entity.Role;

import java.util.List;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;

public class RoleRepo {
    public static List<Role> findAll() {
        return entityManager.createQuery("from Role ", Role.class).getResultList();
    }

    public static Role findById(UUID uuid) {
        return entityManager.find(Role.class, uuid);
    }
}
