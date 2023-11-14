package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TarifarioGeneral;
import pe.com.isesystem.gpservice.model.TarifarioGeneralId;

@Repository
public interface TarifarioGeneralRepository extends JpaRepository<TarifarioGeneral, TarifarioGeneralId> {

    @Query(value = "INSERT INTO TARIFARIO_GENERAL(id_proveedor, id_tipo_servicio, id_dia, monto, estado, estado_reg) VALUES(:idProveedor, :idTipoServicio, :idDia, 0,true, true)",
           nativeQuery = true)
    <S extends TarifarioGeneral> S  insertTarifario(@Param("idProveedor") Long idProveedor, @Param("idTipoServicio") Long idTipoServicio, @Param("idDia") Long idDia);

}



