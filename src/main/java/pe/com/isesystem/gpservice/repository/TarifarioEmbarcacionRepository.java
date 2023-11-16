package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.TarifarioEmbarcacion;
import pe.com.isesystem.gpservice.model.TarifarioEmbarcacionId;

import java.util.Optional;

@Repository
public interface TarifarioEmbarcacionRepository extends JpaRepository<TarifarioEmbarcacion, TarifarioEmbarcacionId> {

    @Override
    <S extends TarifarioEmbarcacion> S save(S entity);

    Optional<TarifarioEmbarcacion> findById_IdEmbarcacionAndId_IdTipoServicioAndId_IdDia(Long idEmbarcacion,
                                                                                         Long idTipoServicio,
                                                                                         Long idDia);
}
