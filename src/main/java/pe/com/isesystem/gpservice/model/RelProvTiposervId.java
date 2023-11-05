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
public class RelProvTiposervId implements Serializable {
    private static final long serialVersionUID = -1004528893334442757L;
    @Column(name = "ID_PROVEEDOR", nullable = false)
    private Long idProveedor;

    @Column(name = "ID_TIPO_SERVICIO", nullable = false)
    private Long idTipoServicio;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelProvTiposervId entity = (RelProvTiposervId) o;
        return Objects.equals(this.idProveedor, entity.idProveedor) &&
                Objects.equals(this.idTipoServicio, entity.idTipoServicio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProveedor, idTipoServicio);
    }

}