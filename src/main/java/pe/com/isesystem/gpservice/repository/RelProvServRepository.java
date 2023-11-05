package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.RelProvTiposerv;
import pe.com.isesystem.gpservice.model.RelProvTiposervId;
import java.util.List;


@Repository
public interface RelProvServRepository extends JpaRepository<RelProvTiposerv, RelProvTiposervId> {

    List<RelProvTiposerv> findAllById_IdProveedor(Long IdProveedor);

    @Override
    List<RelProvTiposerv> findAllById(Iterable<RelProvTiposervId> relProvTiposervIds);

    @Modifying
    @Query(value = "INSERT INTO REL_PROV_TIPOSERV(ID_PROVEEDOR, ID_TIPO_SERVICIO, ESTADO, ESTADO_REG) VALUES(:idProveedor, :idServicio, 1, 1)", nativeQuery = true)
    void grabarRelacionProvServ(@Param("idProveedor") Long idProveedor, @Param("idServicio") Long idServicio);


    void deleteAllById_IdProveedor(Long IdProveedor);

}
