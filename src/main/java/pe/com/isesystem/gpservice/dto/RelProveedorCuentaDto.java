package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelProveedorCuentaDto implements Serializable{
    private RelProveedorCuentaIdDto id;
    private ProveedorDto idProveedor;
    private BancoDto idBanco;
    private MonedaDto idMoneda;
    private Boolean estado;
    private Boolean estadoReg;
}
