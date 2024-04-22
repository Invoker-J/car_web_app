package uz.pdp.car_web_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.car_web_app.entity.enums.RoleName;

import java.util.List;
import java.util.UUID;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue
    @Column(insertable = true, columnDefinition = "uuid default uuid_generate_v4()")
    private UUID id;

    private String firstName;

    private String lastName;

    private Integer age;

    private String email;

    private String password;
    @ManyToMany(cascade = CascadeType.PERSIST)
    private List<Role> role;

    public boolean hasRole(RoleName roleName) {
        for (Role userRole : this.getRole()) {
            if (userRole.getName().equals(roleName)) {
                return true;
            }
        }
        return false;
    }
}

















