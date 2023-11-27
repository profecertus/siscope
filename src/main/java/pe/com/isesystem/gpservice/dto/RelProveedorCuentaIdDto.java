package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelProveedorCuentaIdDto implements Serializable {
    private Long idProveedor;
    private Long idBanco;
    private String numeroCuenta;

}
