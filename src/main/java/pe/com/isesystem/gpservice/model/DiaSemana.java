package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "DiaSemana")
@Table(name = "dia_semana")
public class DiaSemana {
    @Id
    @Column(name = "id_dia", nullable = false)
    private Integer id;

    @Column(name = "nombre_dia", nullable = false, length = 20)
    private String nombreDia;

    @Column(name = "caracteristica", length = Integer.MAX_VALUE)
    private String caracteristica;

}