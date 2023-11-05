package pe.com.isesystem.gpservice.model;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "Embarcacion")
@Table(name = "EMBARCACION")
public class Embarcacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_EMBARCACION", nullable = false)
    private Long id;

    @Column(name = "NOMBRE", length = 100)
    private String nombre;

    @Column(name = "NUM_MATRICULA", length = 50)
    private String numMatricula;

    @Column(name = "TONELAJE", precision = 10, scale = 2)
    private BigDecimal tonelaje;

    @Column(name = "ESTADO")
    private Boolean estado;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}