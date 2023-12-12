package pe.com.isesystem.gpservice.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class GastoMontoDto {
    private String abreviatura;
    private Number precio;
    private String precioCadena;
}
