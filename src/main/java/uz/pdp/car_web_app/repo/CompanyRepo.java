package uz.pdp.car_web_app.repo;

import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import uz.pdp.car_web_app.entity.Company;

import java.util.List;

import static uz.pdp.car_web_app.config.DBConfig.entityManager;

public class CompanyRepo {
    public List<Company> findAll() {
        TypedQuery<Company> fromCompany = entityManager.createQuery("from Company ", Company.class);
        return fromCompany.getResultList();
    }
}
