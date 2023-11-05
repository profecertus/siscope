package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Planta;
import pe.com.isesystem.gpservice.model.RelPlantaDestino;
import pe.com.isesystem.gpservice.model.RelPlantaDestinoId;

import java.util.List;

@Repository
public interface RelPlantaDestinoRepository extends JpaRepository<RelPlantaDestino, RelPlantaDestinoId> {

    List<RelPlantaDestino> findAllByIdPlanta(Planta idPlanta);

    @Modifying
    @Query(value = "INSERT INTO REL_PLANTA_DESTINO(ID_PLANTA, ID_DESTINO) VALUES(:idPlanta, :idDestino)", nativeQuery = true)
    void grabarRelPlantaDestino(@Param("idPlanta") Long idPlanta, @Param("idDestino") Long idDestino);



    void deleteAllById_IdPlanta(Long idPlanta);

}
