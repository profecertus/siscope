package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Destino;

import java.util.List;
import java.util.function.Function;

@Repository
public interface DestinoRepository extends JpaRepository<Destino, Long> {

    List<Destino> findAllByEstadoAndEstadoReg(Boolean estado, Boolean estadoReg);

    @Override
    <S extends Destino> S save(S entity);

}
