package pe.com.isesystem.gpservice.dto;

import lombok.*;
import pe.com.isesystem.gpservice.model.Moneda;
import pe.com.isesystem.gpservice.model.TipoDocumento;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TrabajadorDto  implements Serializable {
    private TrabajadorIdDto id;
    private TipoDocumentoDto idTipodoc;
    private String nombres;
    private String apellidoPat;
    private String apellidoMat;
    private FormaPagoDto idFormaPago;
    private BancoDto idBanco;
    private MonedaDto idMoneda;
    private String estado;
    private String estadoReg;
}
