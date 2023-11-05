package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.TipoServicio;

import java.io.Serializable;

/**
 * DTO for {@link TipoServicio}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TipoServicioDto implements Serializable {
    Long id;
    String nombre;
    UnidadMedidaDto idUm;
    Boolean estado;
    Boolean estadoReg;
}