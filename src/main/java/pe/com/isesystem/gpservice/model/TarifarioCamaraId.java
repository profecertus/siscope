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
public class TarifarioCamaraId implements Serializable {
    private static final long serialVersionUID = 8262075948424358027L;
    @Column(name = "id_planta", nullable = false)
    private Long idPlanta;

    @Column(name = "placa", nullable = false, length = 10)
    private String placa;

    @Column(name = "id_dia", nullable = false)
    private Long idDia;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        TarifarioCamaraId entity = (TarifarioCamaraId) o;
        return Objects.equals(this.idDia, entity.idDia) &&
                Objects.equals(this.idPlanta, entity.idPlanta) &&
                Objects.equals(this.placa, entity.placa);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idDia, idPlanta, placa);
    }

}