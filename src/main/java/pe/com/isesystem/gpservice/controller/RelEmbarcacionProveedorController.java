package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.service.RelEmbarcacionProveedorService;

@RestController
@RequestMapping("/relembprov/v1")
public class RelEmbarcacionProveedorController {

    @Autowired
    RelEmbarcacionProveedorService relEmbarcacionProveedorService;

    @PostMapping("/actualizar/{idEmbarcacion}/{idProveedor}/{idTipoServicio}")
    public ResponseEntity<EmbarcacionDto> actualizar(@PathVariable Long idEmbarcacion, @PathVariable Long idProveedor, @PathVariable Long idTipoServicio){
        if(idProveedor == -1)
            return new ResponseEntity<>(new EmbarcacionDto(), HttpStatus.FAILED_DEPENDENCY);
        EmbarcacionDto e = relEmbarcacionProveedorService.actualizarEmbarcacionProveedor(idEmbarcacion, idProveedor, idTipoServicio);
        return new ResponseEntity<>(e, HttpStatus.OK);
    }
}
