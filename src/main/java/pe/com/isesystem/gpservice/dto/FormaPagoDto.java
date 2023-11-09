package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FormaPagoDto  implements Serializable {
    private Long idFormaPago;
    private String nombreFormaPago;
    private Boolean estado;
    private Boolean estadoReg;
}
