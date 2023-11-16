package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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

    @Query(value = "SELECT CAST(TO_CHAR( CURRENT_TIMESTAMP AT TIME ZONE 'America/Lima', 'YYYYMMDD') AS NUMERIC )", nativeQuery = true)
    Long getFecha();

    @Override
    <S extends Proveedor> S save(S entity);
}
