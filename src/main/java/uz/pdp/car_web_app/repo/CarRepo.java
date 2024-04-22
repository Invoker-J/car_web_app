package uz.pdp.car_web_app.repo;

import uz.pdp.car_web_app.entity.Car;

import java.util.List;
import java.util.UUID;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;

public class CarRepo {
    public static List<Car> findAll() {
        return entityManager.createQuery("from Car ",Car.class).getResultList();
    }

    public static void deleteCar(UUID id) {
        entityManager.getTransaction().begin();
        Car car = entityManager.find(Car.class, id);
        entityManager.remove(car);
        entityManager.getTransaction().commit();
    }

    public static Car findById(UUID carId) {
       return entityManager.find(Car.class,carId);
    }
}
