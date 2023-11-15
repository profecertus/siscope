package pe.com.isesystem.gpservice.repository;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Ubigeo;

import java.util.List;

@Repository
public interface UbigeoRepository extends JpaRepository<Ubigeo, String> {

    <S extends Ubigeo> List<S> findAllByEstadoReg(Boolean estadoReg);
}
