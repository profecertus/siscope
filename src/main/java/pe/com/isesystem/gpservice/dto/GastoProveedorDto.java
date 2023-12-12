package pe.com.isesystem.gpservice.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class GastoProveedorDto {
    private Long idProveedor;
    private Long idTipoServicio;
    private String razonSocial;
}
