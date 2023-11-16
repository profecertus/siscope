package pe.com.isesystem.gpservice.dto;

import lombok.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DiaSemanaDTO implements Serializable {
    private Long idDia;
    private Long idSemana;
    private String nombreDia;
    private String caracteristica;
}
