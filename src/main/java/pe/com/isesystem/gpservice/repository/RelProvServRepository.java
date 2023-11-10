package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelProvTiposerv;
import pe.com.isesystem.gpservice.model.RelProvTiposervId;
import java.util.List;



@Repository
@NonNullApi
public interface RelProvServRepository extends JpaRepository<RelProvTiposerv, RelProvTiposervId> {

    List<RelProvTiposerv> findAllById_IdProveedor(Long IdProveedor);


    @Query(value = "SELECT COUNT(1) FROM REL_PROV_TIPOSERV WHERE ID_PROVEEDOR = :idProveedor AND ID_TIPO_SERVICIO = :idServicio",nativeQuery = true)
    Long findAllById_IdProveedorAndOrId_IdTipoServicio(@Param("idProveedor") Long idProveedor, @Param("idServicio") Long idServicio);

    @Override
    List<RelProvTiposerv> findAllById(Iterable<RelProvTiposervId> relProvTiposervIds);

    @Modifying
    @Query(value = "INSERT INTO REL_PROV_TIPOSERV(ID_PROVEEDOR, ID_TIPO_SERVICIO, ESTADO, ESTADO_REG) VALUES(:idProveedor, :idServicio, true, true)", nativeQuery = true)
    void grabarRelacionProvServ(@Param("idProveedor") Long idProveedor, @Param("idServicio") Long idServicio);


    @Modifying
    @Query(value = "DELETE FROM rel_prov_tiposerv WHERE id_proveedor=:idProveedor AND ID_TIPO_SERVICIO NOT IN (SELECT ID_TIPO_SERVICIO FROM REL_PLANTA_PROVEEDOR WHERE  ID_PROVEEDOR = :idProveedor UNION SELECT ID_TIPO_SERVICIO FROM REL_EMBARCACION_PROVEEDOR WHERE ID_PROOVEDOR = :idProveedor)", nativeQuery = true)
    void eliminarRelacionProvServ(@Param("idProveedor") Long idProveedor);

}
