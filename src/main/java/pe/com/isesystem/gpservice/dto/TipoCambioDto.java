package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.TipoCambio;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * DTO for {@link TipoCambio}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TipoCambioDto implements Serializable {
    TipoCambioIdDto id;
    MonedaDto idMonedaOrig;
    BigDecimal valor;
}