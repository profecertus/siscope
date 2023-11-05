package pe.com.isesystem.gpservice.response;

import lombok.*;
import pe.com.isesystem.gpservice.dto.ProveedorDto;
import pe.com.isesystem.gpservice.dto.RelProvTiposervDto;
import pe.com.isesystem.gpservice.dto.TipoServicioDto;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.model.RelProvTiposerv;

import java.io.Serializable;
import java.util.List;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.Proveedor}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ResProveedorWithService implements Serializable {
    ProveedorDto proveedor;
    List<TipoServicioDto> tipoServicioDtos;
}