package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UbigeoDto implements Serializable {
    private String codUbigeo;
    private String departamento;
    private String provincia;
    private String distrito;
    private Boolean estadoReg;
}
