package pe.com.isesystem.gpservice.dto;

import lombok.*;

import pe.com.isesystem.gpservice.model.Destino;
import pe.com.isesystem.gpservice.model.Planta;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaDestinoDto implements Serializable {
   //private RelPlantaDestinoIdDto id;
   //private PlantaDto idPlanta;
   private DestinoDto idDestino;

}
