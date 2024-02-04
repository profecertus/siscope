package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import pe.com.isesystem.gpservice.model.Semana;

@Repository
@NonNullApi
public interface SemanaRepository extends JpaRepository<Semana, Long> {

    @Query(value = "SELECT * FROM SEMANA WHERE FECHA_INICIO <= (:fecha + 7) order by id_semana DESC", nativeQuery = true)
    Page<Semana> findAllId(Pageable pageable, @PathVariable("fecha") Long fecha);


    @Override
    <S extends Semana> S save(S entity);
}
