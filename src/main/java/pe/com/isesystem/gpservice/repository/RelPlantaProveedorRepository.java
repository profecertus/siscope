package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelPlantaProveedor;
import pe.com.isesystem.gpservice.model.RelPlantaProveedorId;

import java.util.List;

@Repository
public interface RelPlantaProveedorRepository extends JpaRepository<RelPlantaProveedor, RelPlantaProveedorId> {

    List<RelPlantaProveedor> findAllByIdPlanta_Id(Long idPlanta);

    @Modifying
    @Query(value = "INSERT INTO REL_PLANTA_PROVEEDOR(ID_PLANTA, ID_PROVEEDOR, ID_TIPO_SERVICIO) VALUES(:idPlanta, :idProveedor, :idTipoServicio)", nativeQuery = true)
    void grabarRelPlantaProveedor(@Param("idPlanta") Long idPlanta, @Param("idProveedor") Long idProveedor, @Param("idTipoServicio") Long idTipoServicio);

    @Modifying
    @Query(value = "DELETE FROM REL_PLANTA_PROVEEDOR WHERE ID_PLANTA = :idPlanta AND ID_TIPO_SERVICIO = :idTipoServicio", nativeQuery = true)
    void eliminarRelPlantaProveedor(@Param("idPlanta") Long idPlanta,  @Param("idTipoServicio") Long idTipoServicio);
}
