package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Camara;

@Repository
@NonNullApi
public interface CamaraRepository extends JpaRepository<Camara, String> {

    Page<Camara>  findAllByEstadoReg(Pageable pageable, Boolean estadoReg);

    @Override
    <S extends Camara> S save(S entity);

}
