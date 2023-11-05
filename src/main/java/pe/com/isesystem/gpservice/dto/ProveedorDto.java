package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.Proveedor}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProveedorDto implements Serializable {
    Long id;
    String razonSocial;
    String nombreComercial;
    TipoDocumentoDto idTipodoc;
    String numeroDocumento;
    String direccion;
    String telefono;
    String correo;
    Boolean estado;
    Boolean estadoReg;
}