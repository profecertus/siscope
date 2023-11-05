package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import pe.com.isesystem.gpservice.model.Proveedor;
import java.util.List;
import java.util.Optional;

public interface ProveedorRepository extends JpaRepository<Proveedor, Long> {

    Optional<Proveedor> findById(Long id);

    List<Proveedor> getAllByEstadoAndEstadoRegOrderById(Boolean estado, Boolean estadoReg);

    Page<Proveedor> findAllByEstadoAndEstadoRegOrderById (Pageable pageable, Boolean estado, Boolean estadoReg);

    @Override
    <S extends Proveedor> S save(S entity);
}
