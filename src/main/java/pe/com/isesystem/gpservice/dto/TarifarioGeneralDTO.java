package pe.com.isesystem.gpservice.dto;


import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TarifarioGeneralDTO implements Serializable {
    private TarifarioGeneralIdDTO id;
    private ProveedorDto idProveedor;
    private TipoServicioDto idTipoServicio;
    private DiaSemanaDTO idDia;
    private MonedaDto idMoneda;
    private Number monto;
    private Boolean estado;
    private Boolean estadoReg;
}
