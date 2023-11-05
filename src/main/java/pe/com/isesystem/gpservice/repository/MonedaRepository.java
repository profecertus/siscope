package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Moneda;

import java.util.List;
import java.util.Optional;


@Repository
public interface MonedaRepository extends JpaRepository<Moneda, Long> {

    Optional<Moneda> findById(Long id);

    @Override
    List<Moneda> findAll();
}
