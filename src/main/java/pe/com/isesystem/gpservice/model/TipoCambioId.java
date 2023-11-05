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
public class TipoCambioId implements Serializable {
    private static final long serialVersionUID = 2704509748874406360L;
    @Column(name = "ID_TIPOCAMBIO", nullable = false)
    private Long idTipocambio;

    @Column(name = "ID_MONEDA_DEST", nullable = false)
    private Long idMonedaDest;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        TipoCambioId entity = (TipoCambioId) o;
        return Objects.equals(this.idTipocambio, entity.idTipocambio) &&
                Objects.equals(this.idMonedaDest, entity.idMonedaDest);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idTipocambio, idMonedaDest);
    }

}