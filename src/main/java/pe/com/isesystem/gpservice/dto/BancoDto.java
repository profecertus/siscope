package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BancoDto  implements Serializable {
    private Long idBanco;
    private String nombreBanco;
    private Boolean estado;
    private Boolean estadoReg;
}
