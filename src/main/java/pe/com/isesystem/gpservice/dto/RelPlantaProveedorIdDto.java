package pe.com.isesystem.gpservice.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelPlantaProveedorIdDto {
    private Long idPlanta;
    private Long idProveedor;
    private Long idTipoServicio;
}
