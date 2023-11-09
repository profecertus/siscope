package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmpProveedorDto implements Serializable {
    private EmpProveedorIdDto id;
    private String nombre;
    private String apellidoPat;
    private String apellidoMat;
    private Boolean estadoReg;

}
