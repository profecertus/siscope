package pe.com.isesystem.gpservice.dto;

import lombok.*;
import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.Moneda}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MonedaDto implements Serializable {
    Long idMoneda;
    String nombre;
    String abreviatura;
}