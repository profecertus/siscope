package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TrabajadorIdDto implements Serializable {
    Long idTipodoc;
    String numeroDocumento;
}
