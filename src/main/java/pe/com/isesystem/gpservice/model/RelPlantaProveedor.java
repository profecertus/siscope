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
@Entity(name = "RelPlantaProveedor")
@Table(name = "REL_PLANTA_PROVEEDOR")
public class RelPlantaProveedor {
    @EmbeddedId
    private RelPlantaProveedorId id;

    @MapsId("idPlanta")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_PLANTA", nullable = false)
    private Planta idPlanta;

    @MapsId("id")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "ID_PROVEEDOR", referencedColumnName = "ID_PROVEEDOR", nullable = false),
            @JoinColumn(name = "ID_TIPO_SERVICIO", referencedColumnName = "ID_TIPO_SERVICIO", nullable = false)
    })
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private RelProvTiposerv relProvTiposerv;

}