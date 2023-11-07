package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaProveedorDto  implements Serializable {
    private RelPlantaProveedorIdDto id;
    //private PlantaDto idPlanta;
    private RelProvTiposervDto relProvTiposerv;
}
