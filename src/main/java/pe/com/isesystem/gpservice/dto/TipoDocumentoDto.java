package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.TipoDocumento;

import java.io.Serializable;

/**
 * DTO for {@link TipoDocumento}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TipoDocumentoDto implements Serializable {
    Long id;
    String nombre;
    String abreviatura;
    Boolean estado;
    Boolean estadoReg;
}