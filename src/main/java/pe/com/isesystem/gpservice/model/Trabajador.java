package pe.com.isesystem.gpservice.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "Trabajador")
@Table(name = "TRABAJADOR")
public class Trabajador {
    @EmbeddedId
    private TrabajadorId id;

    @MapsId("idTipodoc")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_TIPODOC", nullable = false)
    private TipoDocumento idTipodoc;

    @Column(name = "NOMBRES", nullable = false, length = 70)
    private String nombres;

    @Column(name = "APELLIDO_PAT", length = 70)
    private String apellidoPat;

    @Column(name = "APELLIDO_MAT", length = 70)
    private String apellidoMat;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_FORMA_PAGO", nullable = false)
    private FormaPago idFormaPago;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_BANCO", nullable = false)
    private Banco idBanco;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_MONEDA", nullable = false)
    private Moneda idMoneda;

    @Column(name = "ESTADO")
    private Boolean estado;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}