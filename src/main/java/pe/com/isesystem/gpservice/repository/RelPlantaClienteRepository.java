package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import pe.com.isesystem.gpservice.model.RelPlantaCliente;
import pe.com.isesystem.gpservice.model.RelPlantaClienteId;

import java.util.List;

@Repository
public interface RelPlantaClienteRepository extends JpaRepository<RelPlantaCliente, RelPlantaClienteId> {

    void deleteAllById_IdPlanta(Long idPlanta);

    List<RelPlantaCliente> findAllById_IdPlanta(Long idPlanta);

    @Modifying
    @Query(value = "INSERT INTO rel_planta_cliente(id_planta, ruc) VALUES (:idPlanta, :ruc)", nativeQuery = true)
    void grabar(@PathVariable("idPlanta") Long idPlanta, @PathVariable("ruc") String ruc);
}
