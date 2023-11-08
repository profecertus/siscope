package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.service.RelPlantaProveedorService;

@RestController
@RequestMapping("/relplantaproveedor/v1")
public class RelPlantaProveedorController {
    @Autowired
    RelPlantaProveedorService relPlantaProveedorService;

    @PostMapping("/actualizar/{idPlanta}/{idProveedor}/{idTipoServicio}")
    public ResponseEntity<RespuestaHttp> actualizar(@PathVariable Long idPlanta, @PathVariable Long idProveedor,@PathVariable Long idTipoServicio){
        relPlantaProveedorService.actualizarPlantaProveedor(idPlanta, idProveedor, idTipoServicio);
        RespuestaHttp rpta = new RespuestaHttp();
        rpta.setValorDevuelto("Grabado");
        return new ResponseEntity<>(rpta, HttpStatus.OK);
    }

}
