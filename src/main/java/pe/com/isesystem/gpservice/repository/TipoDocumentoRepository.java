package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TipoDocumento;
import java.util.List;

@Repository
public interface TipoDocumentoRepository extends JpaRepository<TipoDocumento, Long> {

    List<TipoDocumento> getAllByEstadoAndEstadoReg(Boolean estado, Boolean estadoReg);
}
