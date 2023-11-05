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
@Entity(name = "Banco")
@Table(name = "BANCO")
public class Banco {
    @Id
    @Column(name = "ID_BANCO", nullable = false)
    private Long id;

    @Column(name = "NOMBRE_BANCO", length = 70)
    private String nombreBanco;

    @Column(name = "ESTADO")
    private Boolean estado;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}