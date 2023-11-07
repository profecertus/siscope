package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedor;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedorId;

import java.util.List;

@Repository
public interface RelEmbarcacionProveedorRepository extends JpaRepository<RelEmbarcacionProveedor, RelEmbarcacionProveedorId> {

    List<RelEmbarcacionProveedor> findAllById_IdEmbarcacion(Long idEmbarcacion);

}
