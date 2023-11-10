package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedor;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedorId;

import java.util.List;
import java.util.Optional;

@Repository
public interface RelEmbarcacionProveedorRepository extends JpaRepository<RelEmbarcacionProveedor, RelEmbarcacionProveedorId> {

    List<RelEmbarcacionProveedor> findAllById_IdEmbarcacion(Long idEmbarcacion);

    @Modifying
    @Query(value = "INSERT INTO REL_EMBARCACION_PROVEEDOR(ID_EMBARCACION, ID_PROOVEDOR, ID_TIPO_SERVICIO) VALUES(:idEmbarcacion, :idProveedor, :idTipoServicio)", nativeQuery = true)
    void grabarRelEmbarcacionProveedor(@Param("idEmbarcacion") Long idEmbarcacion, @Param("idProveedor") Long idProveedor, @Param("idTipoServicio") Long idTipoServicio);

    @Modifying
    @Query(value = "DELETE FROM REL_EMBARCACION_PROVEEDOR WHERE ID_EMBARCACION = :idEmbarcacion AND ID_TIPO_SERVICIO = :idTipoServicio", nativeQuery = true)
    void eliminarRelEmbarcacionProveedor(@Param("idEmbarcacion") Long idEmbarcacion,  @Param("idTipoServicio") Long idTipoServicio);


}
