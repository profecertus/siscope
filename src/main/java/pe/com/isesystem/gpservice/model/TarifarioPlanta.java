package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "TarifarioPlanta")
@Table(name = "tarifario_planta")
public class TarifarioPlanta {
    @EmbeddedId
    private TarifarioPlantaId id;

    @Column(name = "id_moneda")
    private Integer idMoneda;

    @Column(name = "monto", precision = 10, scale = 2)
    private BigDecimal monto;

    @Column(name = "estado")
    private Boolean estado;

    @Column(name = "estador_reg")
    private Boolean estadorReg;

}