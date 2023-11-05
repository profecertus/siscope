package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.*;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Embeddable
public class RelPlantaDestinoId implements Serializable {
    private static final long serialVersionUID = -8980324441104451232L;
    @Column(name = "ID_PLANTA", nullable = false)
    private Long idPlanta;

    @Column(name = "ID_DESTINO", nullable = false)
    private Long idDestino;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelPlantaDestinoId entity = (RelPlantaDestinoId) o;
        return Objects.equals(this.idPlanta, entity.idPlanta) &&
                Objects.equals(this.idDestino, entity.idDestino);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idPlanta, idDestino);
    }

}