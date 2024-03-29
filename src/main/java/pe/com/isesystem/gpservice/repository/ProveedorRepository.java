package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Proveedor;
import java.util.List;
import java.util.Optional;

@Repository
@NonNullApi
public interface ProveedorRepository extends JpaRepository<Proveedor, Long> {


    Optional<Proveedor> findById(Long id);

    List<Proveedor> getAllByEstadoRegOrderById(Boolean estadoReg);

    Page<Proveedor> findAllByEstadoRegOrderById (Pageable pageable, Boolean estadoReg);

    @Query(value = "SELECT CAST(TO_CHAR( CURRENT_TIMESTAMP, 'YYYYMMDD') AS NUMERIC )", nativeQuery = true)
    Long getFecha();

    @Override
    <S extends Proveedor> S save(S entity);

    @Query(value = "select p.id_proveedor, p.razon_social, rpt.id_tipo_servicio " +
            "from rel_prov_tiposerv rpt " +
            "inner join proveedor p " +
            "on rpt.id_proveedor = p.id_proveedor " +
            "where rpt.id_tipo_servicio = :tipoServicio", nativeQuery = true)
    List<Object[]> getProveedorPorTipo(@Param("tipoServicio") Long tipoServicio);

    @Query(value="select m.abreviatura, tg.monto, m.id_moneda " +
            "from tarifario_general tg " +
            "inner join moneda m " +
            "on m.id_moneda = tg.id_moneda " +
            "where tg.id_proveedor = :idProveedor " +
            "and tg.id_tipo_servicio = :tipoServicio " +
            "and tg.id_dia = :idDia", nativeQuery = true)
    List<Object[]> getMontoPorDia(@Param("idProveedor") Long idProveedor,
                                  @Param("tipoServicio") Long tipoServicio,
                                  @Param("idDia") Long idDia);

    @Query(value="select m.abreviatura, tg.monto, m.id_moneda " +
            "from tarifario_general tg " +
            "inner join moneda m " +
            "on m.id_moneda = tg.id_moneda " +
            "where tg.id_proveedor = :idProveedor " +
            "and tg.id_tipo_servicio = :tipoServicio " +
            "and tg.id_dia = ( " +
            "select id_dia " +
            "from tarifario_general " +
            "where id_tipo_servicio = :tipoServicio " +
            "and id_proveedor = :idProveedor " +
            "and monto >0 " +
            "order by id_dia desc " +
            "limit 1 " +
            ")", nativeQuery = true)
    List<Object[]> getMontoPorDiaOMaximo(@Param("idProveedor") Long idProveedor,
                                  @Param("tipoServicio") Long tipoServicio);
}
