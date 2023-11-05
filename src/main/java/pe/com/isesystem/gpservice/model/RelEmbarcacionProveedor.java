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
@Entity(name = "RelEmbarcacionProveedor")
@Table(name = "REL_EMBARCACION_PROVEEDOR")
public class RelEmbarcacionProveedor {
    @EmbeddedId
    private RelEmbarcacionProveedorId id;

    @MapsId("id")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "ID_PROOVEDOR", referencedColumnName = "ID_PROVEEDOR", nullable = false),
            @JoinColumn(name = "ID_TIPO_SERVICIO", referencedColumnName = "ID_TIPO_SERVICIO", nullable = false)
    })
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private RelProvTiposerv relProvTiposerv;

}