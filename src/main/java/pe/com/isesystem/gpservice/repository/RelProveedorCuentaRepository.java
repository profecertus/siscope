package pe.com.isesystem.gpservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pe.com.isesystem.gpservice.model.*;

import java.util.Optional;

@Repository
public interface RelProveedorCuentaRepository extends JpaRepository<RelProveedorCuenta, RelProveedorCuentaId> {

    Optional<RelProveedorCuenta> findFirstById_IdProveedor(Long IdProveedor);

    @Modifying
    @Query(value = "INSERT INTO rel_proveedor_cuenta(id_proveedor, id_banco, numero_cuenta, id_moneda, estado, estado_reg)" +
            " VALUES (:idProveedor, :idBanco, :numeroCuenta, 1, true, true)", nativeQuery = true)
    void guardar(@Param("idProveedor") Long idProveedor, @Param("idBanco")Long idBanco, @Param("numeroCuenta")String numeroCuenta);

    @Query(value = "SELECT COUNT(1) FROM rel_proveedor_cuenta WHERE id_proveedor = :idProveedor and id_banco = :idBanco and numero_cuenta = :numeroCuenta", nativeQuery = true)
    Long totalRegistros(@Param("idProveedor") Long idProveedor, @Param("idBanco")Long idBanco, @Param("numeroCuenta")String numeroCuenta);

}
