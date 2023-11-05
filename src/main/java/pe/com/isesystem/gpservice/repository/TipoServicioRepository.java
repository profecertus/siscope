package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TipoServicio;
import java.util.List;

@Repository
public interface TipoServicioRepository extends JpaRepository<TipoServicio, Long> {

    List<TipoServicio> getAllByEstadoAndEstadoReg(Boolean estado, Boolean estadoReg);
}
