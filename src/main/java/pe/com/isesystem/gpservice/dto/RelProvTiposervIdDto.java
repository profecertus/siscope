package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.RelProvTiposervId}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelProvTiposervIdDto implements Serializable {
    Long idProveedor;
    Long idTipoServicio;
}