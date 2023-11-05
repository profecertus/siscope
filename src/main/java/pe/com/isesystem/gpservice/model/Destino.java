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
@Entity(name = "Destino")
@Table(name = "DESTINO")
public class Destino {
    @Id
    @Column(name = "ID_DESTINO", nullable = false)
    private Long id;

    @Column(name = "NOMBRE", length = 100)
    private String nombre;

    @Column(name = "ABREVIATURA", length = 20)
    private String abreviatura;

    @Column(name = "ESTADO")
    private Boolean estado;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}