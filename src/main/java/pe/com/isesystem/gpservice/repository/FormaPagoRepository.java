package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.FormaPago;

import java.util.List;

@Repository
public interface FormaPagoRepository extends JpaRepository<FormaPago, Long> {
    @Override
    List<FormaPago> findAll();
}
