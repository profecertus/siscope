package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmpProveedorIdDto implements Serializable {
    private Long idProveedor;
    private Long idTipodoc;
    private String numeroDocumento;
}
