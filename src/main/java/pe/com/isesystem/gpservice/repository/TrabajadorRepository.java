package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Trabajador;
import pe.com.isesystem.gpservice.model.TrabajadorId;

@Repository
public interface TrabajadorRepository extends JpaRepository<Trabajador, TrabajadorId> {


    Page<Trabajador> findAllByEstadoAndEstadoRegOrderById(Pageable pageable,Boolean estado, Boolean estadoReg);

    @Override
    <S extends Trabajador> S save(S entity);
}
