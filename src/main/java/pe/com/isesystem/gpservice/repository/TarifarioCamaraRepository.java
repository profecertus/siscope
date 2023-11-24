package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TarifarioCamara;
import pe.com.isesystem.gpservice.model.TarifarioCamaraId;

@Repository
public interface TarifarioCamaraRepository extends JpaRepository<TarifarioCamara, TarifarioCamaraId> {



}
