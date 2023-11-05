package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.TipoCambioId}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TipoCambioIdDto implements Serializable {
    Long idTipocambio;
    Long idMonedaDest;
}