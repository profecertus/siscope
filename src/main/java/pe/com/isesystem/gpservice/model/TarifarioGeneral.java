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
@Entity(name = "TarifarioGeneral")
@Table(name = "tarifario_general")
public class TarifarioGeneral {
    @EmbeddedId
    private TarifarioGeneralId id;

    @MapsId("id")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "id_proveedor", referencedColumnName = "id_proveedor", nullable = false),
            @JoinColumn(name = "id_tipo_servicio", referencedColumnName = "id_tipo_servicio", nullable = false)
    })
    private RelProvTiposerv relProvTiposerv;

    @MapsId("idAnio")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_anio", nullable = false)
    private Semana idAnio;

    @Column(name = "id_moneda")
    private Integer idMoneda;

    @Column(name = "monto", precision = 10, scale = 2)
    private BigDecimal monto;

    @Column(name = "estado")
    private Boolean estado;

    @Column(name = "estado_reg")
    private Boolean estadoReg;

}