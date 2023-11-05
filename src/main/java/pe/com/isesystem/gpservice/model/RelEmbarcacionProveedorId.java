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
public class RelEmbarcacionProveedorId implements Serializable {
    private static final long serialVersionUID = -3974812541277794934L;
    @Column(name = "ID_EMBARCACION", nullable = false)
    private Long idEmbarcacion;

    @Column(name = "ID_PROOVEDOR", nullable = false)
    private Long idProovedor;

    @Column(name = "ID_TIPO_SERVICIO", nullable = false)
    private Long idTipoServicio;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelEmbarcacionProveedorId entity = (RelEmbarcacionProveedorId) o;
        return Objects.equals(this.idEmbarcacion, entity.idEmbarcacion) &&
                Objects.equals(this.idProovedor, entity.idProovedor) &&
                Objects.equals(this.idTipoServicio, entity.idTipoServicio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idEmbarcacion, idProovedor, idTipoServicio);
    }

}