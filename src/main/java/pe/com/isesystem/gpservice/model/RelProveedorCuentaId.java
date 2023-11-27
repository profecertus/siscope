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
public class RelProveedorCuentaId implements Serializable {
    private static final long serialVersionUID = -3405292919151738025L;
    @Column(name = "id_proveedor", nullable = false)
    private Integer idProveedor;

    @Column(name = "id_banco", nullable = false)
    private Integer idBanco;

    @Column(name = "numero_cuenta", nullable = false, length = 20)
    private String numeroCuenta;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RelProveedorCuentaId entity = (RelProveedorCuentaId) o;
        return Objects.equals(this.idBanco, entity.idBanco) &&
                Objects.equals(this.idProveedor, entity.idProveedor) &&
                Objects.equals(this.numeroCuenta, entity.numeroCuenta);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idBanco, idProveedor, numeroCuenta);
    }

}