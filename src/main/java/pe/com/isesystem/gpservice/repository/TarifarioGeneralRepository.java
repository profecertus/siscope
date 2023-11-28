package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pe.com.isesystem.gpservice.model.TarifarioGeneral;
import pe.com.isesystem.gpservice.model.TarifarioGeneralId;

import java.util.List;
import java.util.Optional;

@Repository
public interface TarifarioGeneralRepository extends JpaRepository<TarifarioGeneral, TarifarioGeneralId> {

    @Modifying
    @Query(value = "INSERT INTO TARIFARIO_GENERAL(id_proveedor, id_tipo_servicio, id_dia, monto, estado, estado_reg) " +
            "SELECT :idProveedor, :idTipoServicio, CAST(TO_CHAR(current_date, 'YYYYMMDD') AS NUMERIC), 0, true, true FROM DUAL",
           nativeQuery = true)
    void  insertTarifario(@Param("idProveedor") Long idProveedor, @Param("idTipoServicio") Long idTipoServicio);

    Optional<TarifarioGeneral> findById_IdProveedorAndId_IdTipoServicioAndId_IdDia(Long idProveedor, Long idTipoServicio, Long idDia);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM tarifario_general WHERE id_proveedor = :idProveedor AND id_dia = :idDia AND id_tipo_servicio NOT IN :nombres", nativeQuery = true)
    void eliminaNoEstan(@Param("nombres") List<Long> nombres, @Param("idProveedor") Long idProveedor, @Param("idDia")Long idDia);
}



