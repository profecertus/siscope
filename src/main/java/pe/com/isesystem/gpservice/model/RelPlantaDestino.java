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
@Entity(name = "RelPlantaDestino")
@Table(name = "REL_PLANTA_DESTINO")
public class RelPlantaDestino {
    @EmbeddedId
    private RelPlantaDestinoId id;

    @MapsId("idPlanta")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_PLANTA", nullable = false)
    private Planta idPlanta;

    @MapsId("idDestino")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_DESTINO", nullable = false)
    private Destino idDestino;

}