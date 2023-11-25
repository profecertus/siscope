package pe.com.isesystem.gpservice.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaClienteIdDto {
    private String ruc;
    private Long idPlanta;
}
