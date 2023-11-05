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
@Entity(name = "EmpProveedor")
@Table(name = "EMP_PROVEEDOR")
public class EmpProveedor {
    @EmbeddedId
    private EmpProveedorId id;

    @MapsId("idProveedor")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_PROVEEDOR", nullable = false)
    private Proveedor idProveedor;

    @MapsId("idTipodoc")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ID_TIPODOC", nullable = false)
    private TipoDocumento idTipodoc;

    @Column(name = "NOMBRE", length = 70)
    private String nombre;

    @Column(name = "APELLIDO_PAT", length = 70)
    private String apellidoPat;

    @Column(name = "APELLIDO_MAT", length = 70)
    private String apellidoMat;

    @Column(name = "ESTADO_REG")
    private Boolean estadoReg;

}