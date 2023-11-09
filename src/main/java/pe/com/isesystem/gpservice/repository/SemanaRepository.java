package pe.com.isesystem.gpservice.repository;

import io.micrometer.common.lang.NonNullApi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Semana;

@Repository
@NonNullApi
public interface SemanaRepository extends JpaRepository<Semana, Long> {

    @Override
    Page<Semana> findAll(Pageable pageable);

    @Override
    <S extends Semana> S save(S entity);
}