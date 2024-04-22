package uz.pdp.car_web_app.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class CarDetail {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;

    private String key;
    private String value ;
}
