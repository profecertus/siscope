package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RelEmbarcacionProveedorDto  implements Serializable {
    private EmbarcacionDto idEmbarcacion;
    private ProveedorDto idProovedor;
    private TipoServicioDto idTipoServicio;
}
