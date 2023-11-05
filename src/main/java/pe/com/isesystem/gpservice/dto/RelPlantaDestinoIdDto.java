package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaDestinoIdDto implements Serializable {
    private Long idPlanta;
    private Long idDestino;
}
