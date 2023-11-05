package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Banco;

import java.util.List;

@Repository
public interface BancoRepository extends JpaRepository<Banco, Long> {
    @Override
    List<Banco> findAll();
}
