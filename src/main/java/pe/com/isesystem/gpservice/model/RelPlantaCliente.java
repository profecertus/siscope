package pe.com.isesystem.gpservice.model;

import jakarta.persistence.*;
import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "RelPlantaCliente")
@Table(name = "rel_planta_cliente")
public class RelPlantaCliente {
    @EmbeddedId
    private RelPlantaClienteId id;

    @MapsId("ruc")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ruc", nullable = false)
    private Cliente ruc;
/*
    @MapsId("idPlanta")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_planta", nullable = false)
    private Planta idPlanta;
*/
}