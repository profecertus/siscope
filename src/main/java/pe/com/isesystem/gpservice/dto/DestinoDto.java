package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DestinoDto implements Serializable {
    private Long idDestino;
    private String nombre;
    private String abreviatura;
    private Boolean estado;
    private Boolean estadoReg;
}
