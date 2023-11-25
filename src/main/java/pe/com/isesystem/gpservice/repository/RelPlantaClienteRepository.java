package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelPlantaCliente;
import pe.com.isesystem.gpservice.model.RelPlantaClienteId;

import java.util.List;

@Repository
public interface RelPlantaClienteRepository extends JpaRepository<RelPlantaCliente, RelPlantaClienteId> {

    List<RelPlantaCliente> findAllById_IdPlanta(Long idPlanta);
}
