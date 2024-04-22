package uz.pdp.car_web_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.car_web_app.entity.enums.RoleName;

import java.util.UUID;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;
    @Enumerated(EnumType.STRING)
    private RoleName name;

}
