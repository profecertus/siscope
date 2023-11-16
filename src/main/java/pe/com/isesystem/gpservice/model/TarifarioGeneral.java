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

    @MapsId("idDia")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_dia", nullable = false)
    private DiaSemana idDia;

    @MapsId("idProveedor")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_proveedor", nullable = false)
    private Proveedor idProveedor;

    @MapsId("idTipoServicio")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_tipo_servicio", nullable = false)
    private TipoServicio idTipoServicio;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_moneda", nullable = false)
    private Moneda idMoneda;

    @Column(name = "monto", precision = 10, scale = 2)
    private BigDecimal monto;

    @Column(name = "estado")
    private Boolean estado;

    @Column(name = "estado_reg")
    private Boolean estadoReg;

}