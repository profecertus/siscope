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
public class TarifarioGeneralId implements Serializable {
    private static final long serialVersionUID = 2331664205342368802L;
    @Column(name = "id_proveedor", nullable = false)
    private Integer idProveedor;

    @Column(name = "id_tipo_servicio", nullable = false)
    private Integer idTipoServicio;

    @Column(name = "id_anio", nullable = false)
    private Integer idAnio;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        TarifarioGeneralId entity = (TarifarioGeneralId) o;
        return Objects.equals(this.idAnio, entity.idAnio) &&
                Objects.equals(this.idProveedor, entity.idProveedor) &&
                Objects.equals(this.idTipoServicio, entity.idTipoServicio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAnio, idProveedor, idTipoServicio);
    }

}