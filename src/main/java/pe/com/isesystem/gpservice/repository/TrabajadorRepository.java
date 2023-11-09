package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Trabajador;
import pe.com.isesystem.gpservice.model.TrabajadorId;

@Repository
@NonNullApi
public interface TrabajadorRepository extends JpaRepository<Trabajador, TrabajadorId> {


    Page<Trabajador> findAllByEstadoAndEstadoRegOrderById(Pageable pageable, Boolean estadoReg);

    @Override
    <S extends Trabajador> S save(S entity);
}
