package pe.com.isesystem.gpservice.dto;

import lombok.*;

import pe.com.isesystem.gpservice.model.Destino;
import pe.com.isesystem.gpservice.model.Planta;
import pe.com.isesystem.gpservice.model.RelPlantaClienteId;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaClienteDto implements Serializable {
    private RelPlantaClienteIdDto id;
    private ClienteDto ruc;
}
