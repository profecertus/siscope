package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.Cliente;

import java.util.List;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, String> {

    @Override
    List<Cliente> findAll();

    @Override
    <S extends Cliente> S save(S entity);
}
