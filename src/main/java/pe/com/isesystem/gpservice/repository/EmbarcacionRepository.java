package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Embarcacion;

@Repository
public interface EmbarcacionRepository extends JpaRepository<Embarcacion, Long> {
    Page<Embarcacion> findAllByEstadoAndEstadoRegOrderById(Pageable pageable, Boolean estado, Boolean estadoReg);

    @Override
    <S extends Embarcacion> S save(S entity);
}
