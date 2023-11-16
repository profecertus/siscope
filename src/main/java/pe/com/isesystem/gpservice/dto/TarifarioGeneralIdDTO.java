package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TarifarioGeneralIdDTO implements Serializable {
    private Long idProveedor;
    private Long idTipoServicio;
    private Long idDia;
}
