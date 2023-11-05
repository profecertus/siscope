package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
import org.hibernate.annotations.Nationalized;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "Moneda")
@Table(name = "MONEDA")
public class Moneda {
    @Id
    @Column(name = "ID_MONEDA", nullable = false)
    private Long id;

    @Column(name = "NOMBRE", length = 20)
    private String nombre;

    @Nationalized
    @Column(name = "ABREVIATURA", length = 5)
    private String abreviatura;

}