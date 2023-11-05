package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Embarcacion;

@Repository
public interface EmbarcacionRepository extends JpaRepository<Embarcacion, Long> {
    @Override
    Page<Embarcacion> findAll(Pageable pageable);

    @Override
    <S extends Embarcacion> S save(S entity);
}
