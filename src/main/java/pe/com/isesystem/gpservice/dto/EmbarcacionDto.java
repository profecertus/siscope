package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmbarcacionDto  implements Serializable {
    private Long idEmbarcacion;
    private ProveedorDto idProveedor;
    private String nombre;
    private String numMatricula;
    private Integer numEje;
    private BigDecimal tonelaje;
    private Boolean estado;
    private Boolean estadoReg;
    private List<RelEmbarcacionProveedorDto> relEmbarcacionProveedorDto;
}
