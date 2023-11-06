package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.Proveedor;

import java.io.Serializable;
import java.math.BigDecimal;

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
    private BigDecimal tonelaje;
    private String estado;
    private String estadoReg;
}
