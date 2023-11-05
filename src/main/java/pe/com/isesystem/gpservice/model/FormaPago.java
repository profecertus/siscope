package pe.com.isesystem.gpservice.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "FormaPago")
@Table(name = "FORMA_PAGO")
public class FormaPago {
    @Id
    @Column(name = "ID_FORMA_PAGO", nullable = false)
    private Long id;

    @Column(name = "NOMBRE", length = 50)
    private String nombreFormaPago;

    @Column(name = "ESTADO")
    private Boolean estado;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}