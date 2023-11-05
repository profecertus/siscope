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
public class RelPlantaProveedorId implements Serializable {
    private static final long serialVersionUID = 5485234218011150041L;
    @Column(name = "ID_PLANTA", nullable = false)
    private Long idPlanta;

    @Column(name = "ID_PROVEEDOR", nullable = false)
    private Long idProveedor;

    @Column(name = "ID_TIPO_SERVICIO", nullable = false)
    private Long idTipoServicio;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelPlantaProveedorId entity = (RelPlantaProveedorId) o;
        return Objects.equals(this.idProveedor, entity.idProveedor) &&
                Objects.equals(this.idPlanta, entity.idPlanta) &&
                Objects.equals(this.idTipoServicio, entity.idTipoServicio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProveedor, idPlanta, idTipoServicio);
    }

}