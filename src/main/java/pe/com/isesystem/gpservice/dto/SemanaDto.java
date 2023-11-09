package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

/**
 * DTO for {@link pe.com.isesystem.gpservice.model.Semana}
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SemanaDto implements Serializable {
    Long id;
    Long fechaInicio;
    Long fechaFin;
    String tipoSemana;
}