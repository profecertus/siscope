package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TarifarioPlanta;
import pe.com.isesystem.gpservice.model.TarifarioPlantaId;

@Repository
public interface TarifarioPlantaRepository extends JpaRepository<TarifarioPlanta, TarifarioPlantaId> {

    @Modifying
    @Query(value = "INSERT INTO TARIFARIO_PLANTA (id_dia, id_planta, id_proveedor, id_tipo_servicio, " +
            "id_moneda, monto, estado, estado_reg) " +
            "SELECT CAST(TO_CHAR(current_date AT TIME ZONE 'America/Lima', 'YYYYMMDD') AS NUMERIC), :idPlanta, " +
            ":idProveedor, :idTipoServicio, 1, 0, true, true FROM DUAL",nativeQuery = true)
    void  insertTarifarioPlanta(@Param("idPlanta") Long idPlanta,
                                @Param("idProveedor") Long idProveedor,
                                @Param("idTipoServicio") Long idTipoServicio);

    @Query(value = "SELECT COALESCE(SUM(id_proveedor), 0) FROM TARIFARIO_PLANTA " +
            "WHERE id_planta = :idPlanta  and " +
            "id_tipo_servicio = :idTipoServicio",nativeQuery = true)
    Long existe(@Param("idPlanta") Long idPlanta,
                @Param("idTipoServicio") Long idTipoServicio);

    @Modifying
    @Query(value = "DELETE FROM TARIFARIO_PLANTA " +
            " WHERE id_planta = :idPlanta AND " +
            " id_proveedor = :idProveedor AND " +
            " id_tipo_servicio = :idTipoServicio ", nativeQuery = true)
    void eliminarTarifarioPlanta(@Param("idPlanta") Long idPlanta,
                                 @Param("idProveedor") Long idProveedor,
                                 @Param("idTipoServicio") Long idTipoServicio);

}
