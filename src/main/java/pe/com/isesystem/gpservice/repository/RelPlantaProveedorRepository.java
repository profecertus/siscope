package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelPlantaProveedor;
import pe.com.isesystem.gpservice.model.RelPlantaProveedorId;

import java.util.List;

@Repository
public interface RelPlantaProveedorRepository extends JpaRepository<RelPlantaProveedor, RelPlantaProveedorId> {

    List<RelPlantaProveedor> findAllByIdPlanta_Id(Long idPlanta);
}
