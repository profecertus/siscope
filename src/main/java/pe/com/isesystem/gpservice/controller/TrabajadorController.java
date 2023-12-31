package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.CamaraDto;
import pe.com.isesystem.gpservice.dto.TrabajadorDto;
import pe.com.isesystem.gpservice.service.TrabajadorService;

@RestController
@RequestMapping("/trabajador/v1")
public class TrabajadorController {

    @Autowired
    TrabajadorService trabajadorService;

    @GetMapping("/getAllTrabajador/{numpag}/{tampag}")
    public ResponseEntity<Page<TrabajadorDto>> getAllTrabajador(@PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        Page<TrabajadorDto> respuesta = trabajadorService.getAllTrabajador(pageable);
        return new ResponseEntity<>(respuesta, HttpStatus.OK);
    }

    @PostMapping("/saveTrabajador")
    public ResponseEntity<RespuestaHttp> saveTrabajador(@RequestBody TrabajadorDto trabajadorDto){
        TrabajadorDto trab = trabajadorService.saveTrabajador(trabajadorDto);
        RespuestaHttp respuestaHttp = new RespuestaHttp();
        respuestaHttp.setValorDevuelto(trab);
        return new ResponseEntity<>(respuestaHttp, HttpStatus.OK);
    }
}
