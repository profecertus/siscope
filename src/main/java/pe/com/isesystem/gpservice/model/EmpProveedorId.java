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
public class EmpProveedorId implements Serializable {
    private static final long serialVersionUID = 1452031441339503854L;
    @Column(name = "ID_PROVEEDOR", nullable = false)
    private Long idProveedor;

    @Column(name = "ID_TIPODOC", nullable = false)
    private Long idTipodoc;

    @Column(name = "NUMERO_DOCUMENTO", nullable = false, length = 20)
    private String numeroDocumento;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        EmpProveedorId entity = (EmpProveedorId) o;
        return Objects.equals(this.idTipodoc, entity.idTipodoc) &&
                Objects.equals(this.idProveedor, entity.idProveedor) &&
                Objects.equals(this.numeroDocumento, entity.numeroDocumento);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idTipodoc, idProveedor, numeroDocumento);
    }

}