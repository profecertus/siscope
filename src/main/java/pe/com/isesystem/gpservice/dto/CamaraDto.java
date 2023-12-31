package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CamaraDto  implements Serializable {
    private String placa;
    private String marca;
    private String modelo;
    private Long eje;
    private ProveedorDto idProveedor;
    private Boolean estado;
    private Boolean estadoReg;
}
