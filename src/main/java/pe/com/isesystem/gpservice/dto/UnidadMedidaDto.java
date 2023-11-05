package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.UnidadMedida}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UnidadMedidaDto implements Serializable {
    Long id;
    String nombre;
    String abreviatura;
    Boolean estado;
    Boolean estadoReg;
}