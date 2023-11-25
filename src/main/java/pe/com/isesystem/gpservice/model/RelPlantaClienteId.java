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
public class RelPlantaClienteId implements Serializable {
    private static final long serialVersionUID = -8130424634257313203L;
    @Column(name = "ruc", nullable = false, length = 11)
    private String ruc;

    @Column(name = "id_planta", nullable = false)
    private Integer idPlanta;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelPlantaClienteId entity = (RelPlantaClienteId) o;
        return Objects.equals(this.ruc, entity.ruc) &&
                Objects.equals(this.idPlanta, entity.idPlanta);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ruc, idPlanta);
    }

}