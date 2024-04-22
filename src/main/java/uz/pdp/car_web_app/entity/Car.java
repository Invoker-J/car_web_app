package uz.pdp.car_web_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Car {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;

    private String name;
    private byte[] photo;
    @ManyToOne
    private Company company;

    @OneToMany
    private List<CarDetail> carDetailList;


}
