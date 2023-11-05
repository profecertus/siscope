package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaProveedorDto  implements Serializable {
    private PlantaDto idPlanta;
    private ProveedorDto idProveedor;
    private TipoServicioDto idTipoServicio;
}
