package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Embarcacion;

import java.util.Optional;
import java.util.function.Function;

@Repository
public interface EmbarcacionRepository extends JpaRepository<Embarcacion, Long> {
    Page<Embarcacion> findAllByEstadoRegOrderById(Pageable pageable,  Boolean estadoReg);

    @Override
    <S extends Embarcacion> S save(S entity);

    @Override
    Optional<Embarcacion> findById(Long aLong);
}
