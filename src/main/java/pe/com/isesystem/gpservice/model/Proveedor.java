package pe.com.isesystem.gpservice.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(onlyExplicitlyIncluded = true)
@Entity(name = "Proveedor")
@Table(name = "PROVEEDOR")
public class Proveedor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_PROVEEDOR", nullable = false)
    private Long id;

    @Column(name = "RAZON_SOCIAL", nullable = false, length = 100)
    private String razonSocial;

    @Column(name = "NOMBRE_COMERCIAL", length = 100)
    private String nombreComercial;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_TIPODOC", nullable = true)
    private TipoDocumento idTipodoc;

    @Column(name = "NUMERO_DOCUMENTO", nullable = true, length = 20)
    private String numeroDocumento;

    @Column(name = "DIRECCION", length = 100)
    private String direccion;

    @Column(name = "TELEFONO", length = 15)
    private String telefono;

    @Column(name = "CORREO", length = 70)
    private String correo;

    @Column(name = "ESTADO", nullable = false)
    private Boolean estado = false;

    @Column(name = "ESTADO_REG", nullable = false)
    private Boolean estadoReg = false;

}