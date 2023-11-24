package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class PlantaDto  implements Serializable {
    private Long idPlanta;
    private String nombrePlanta;
    private String direccion;
    private UbigeoDto codUbigeo;
    private Boolean estado;
    private Boolean estadoReg;
}
