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
@Entity(name = "Ubigeo")
@Table(name = "UBIGEO")
public class Ubigeo {
    @Id
    @Column(name = "COD_UBIGEO", nullable = false, length = 10)
    private String codUbigeo;

    @Column(name = "DEPARTAMENTO", length = 50)
    private String departamento;

    @Column(name = "PROVINCIA", length = 50)
    private String provincia;

    @Column(name = "DISTRITO", length = 50)
    private String distrito;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}