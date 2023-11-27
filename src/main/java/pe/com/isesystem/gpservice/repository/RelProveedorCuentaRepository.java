package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.*;

import java.util.List;
import java.util.Optional;

@Repository
public interface RelProveedorCuentaRepository extends JpaRepository<RelProveedorCuenta, RelProveedorCuentaId> {

    Optional<RelProveedorCuenta> findFirstById_IdProveedor(Long IdProveedor);
}
