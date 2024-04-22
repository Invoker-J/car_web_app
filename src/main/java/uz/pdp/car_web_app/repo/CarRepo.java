package uz.pdp.car_web_app.repo;

import uz.pdp.car_web_app.entity.Car;

import java.util.List;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;

public class CarRepo {
    public static List<Car> findAll() {
        return entityManager.createQuery("from Car ",Car.class).getResultList();
    }
}
