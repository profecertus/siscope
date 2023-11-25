package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ClienteDto  implements Serializable {
    private String ruc;
    private String nombre;

    @Getter(value = AccessLevel.NONE)
    private String cliente;

    public String getCliente(){
        return  this.nombre.concat(" - ").concat(this.ruc);
    }

}
