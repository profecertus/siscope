package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Planta;

import java.util.Optional;

@Repository
public interface PlantaRepository extends JpaRepository<Planta, Long> {
    Page<Planta> findAllByEstadoAndEstadoRegOrderById(Pageable pageable, Boolean estado, Boolean estadoReg);


    Planta findAllById(Long idPlanta);

    @Override
    <S extends Planta> S save(S entity);


}
