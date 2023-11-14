package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TarifarioGeneral;
import pe.com.isesystem.gpservice.model.TarifarioGeneralId;

@Repository
public interface TarifarioGeneralRepository extends JpaRepository<TarifarioGeneral, TarifarioGeneralId> {

    @Modifying
    @Query(value = "INSERT INTO TARIFARIO_GENERAL(id_proveedor, id_tipo_servicio, id_dia, monto, estado, estado_reg) " +
            "SELECT :idProveedor, :idTipoServicio, CAST(TO_CHAR(current_date AT TIME ZONE 'America/Lima', 'YYYYMMDD') AS NUMERIC), 0, true, true FROM DUAL",
           nativeQuery = true)
    void  insertTarifario(@Param("idProveedor") Long idProveedor, @Param("idTipoServicio") Long idTipoServicio);

}



