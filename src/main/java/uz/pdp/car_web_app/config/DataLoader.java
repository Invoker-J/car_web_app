package uz.pdp.car_web_app.config;

import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import uz.pdp.car_web_app.entity.Company;
import uz.pdp.car_web_app.entity.Role;
import uz.pdp.car_web_app.entity.User;
import uz.pdp.car_web_app.entity.enums.RoleName;


import java.util.ArrayList;
import java.util.List;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;
import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;

@WebListener
public class DataLoader implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        entityManagerFactory = Persistence.createEntityManagerFactory("car_market");
        entityManager = entityManagerFactory.createEntityManager();
//        initData();
        ServletContextListener.super.contextInitialized(sce);
    }

    private void initData() {
        List<Role> roles = new ArrayList<>();
        entityManager.getTransaction().begin();

        for (RoleName roleName: RoleName.values()) {
            Role role = Role.builder()
                    .name(roleName)
                    .build();
            entityManager.persist(role);
            roles.add(role);
        }

        Company company1 = Company.builder()
                .name("Chevrolet")
                .build();

        Company company2 = Company.builder()
                .name("BMW")
                .build();

        Company company3 = Company.builder()
                .name("AUDI")
                .build();
        entityManager.persist(company1);
        entityManager.persist(company2);
        entityManager.persist(company3);

        User user = User.builder()
                .age(18)
                .email("sh@gmail.com")
                .role(roles)
                .firstName("J")
                .lastName("Sh")
                .password("0505")
                .build();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
    }
}

