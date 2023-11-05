package pe.com.isesystem.gpservice.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "TipoCambio")
@Table(name = "TIPO_CAMBIO")
public class TipoCambio {
    @EmbeddedId
    private TipoCambioId id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_MONEDA_ORIG", nullable = false)
    private Moneda idMonedaOrig;

    @Column(name = "VALOR", nullable = false, precision = 10, scale = 2)
    private BigDecimal valor;

}