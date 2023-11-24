package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.Moneda;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class TarifarioCamaraDTO implements Serializable {
    private TarifarioGeneralIdDTO id;
    private PlantaDto idPlanta;
    private CamaraDto placa;
    private DiaSemanaDTO idDia;
    private MonedaDto idMoneda;
    private Number monto;
    private Long estado;
    private Long estadoReg;
}
