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
@Entity(name = "RelProvTiposerv")
@Table(name = "REL_PROV_TIPOSERV")
public class RelProvTiposerv {
    @EmbeddedId
    private RelProvTiposervId id;

    @MapsId("idProveedor")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_PROVEEDOR", nullable = false)
    private Proveedor idProveedor;

    @MapsId("idTipoServicio")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_TIPO_SERVICIO", nullable = false)
    private TipoServicio idTipoServicio;

    @Column(name = "ESTADO", nullable = false)
    private Boolean estado = false;

    @Column(name = "ESTADO_REG", nullable = false)
    private Boolean estadoReg = false;

}