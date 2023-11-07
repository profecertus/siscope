package pe.com.isesystem.gpservice.response;

import lombok.*;
import pe.com.isesystem.gpservice.dto.DestinoDto;
import pe.com.isesystem.gpservice.dto.PlantaDto;
import pe.com.isesystem.gpservice.dto.RelPlantaProveedorDto;
import pe.com.isesystem.gpservice.dto.RelProvTiposervDto;

import java.io.Serializable;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ResPlantaWithDestino implements Serializable {
    PlantaDto plantaDto;
    List<DestinoDto> relPlantaDestinoDto;
    List<RelPlantaProveedorDto> relPlantaProveedorDtoList;

}
