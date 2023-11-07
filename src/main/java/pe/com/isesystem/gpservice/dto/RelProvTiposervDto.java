package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.RelProvTiposerv}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelProvTiposervDto implements Serializable {
    //RelProvTiposervIdDto id;
    ProveedorDto idProveedor;
    //TipoServicioDto idTipoServicio;
    //Boolean estado;
    //Boolean estadoReg;
}