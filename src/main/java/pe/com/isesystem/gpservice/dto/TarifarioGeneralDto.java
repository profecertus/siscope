package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TarifarioGeneralDto implements Serializable {
    private Long idProveedor;
    private Long idTipoServicio;
    private Long idAnio;
    private Long idMoneda;
    private Number monto;
    private Boolean estado;
    private Boolean estadoReg;
}
