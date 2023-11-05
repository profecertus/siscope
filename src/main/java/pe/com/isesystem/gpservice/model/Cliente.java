package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "Cliente")
@Table(name = "CLIENTE")
public class Cliente {
    @Id
    @Column(name = "RUC", nullable = false, length = 11)
    private String ruc;

    @Column(name = "NOMBRE", length = 100)
    private String nombre;

}