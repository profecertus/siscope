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
import pe.com.isesystem.gpservice.service.CamaraService;

@RestController
@RequestMapping("/camara/v1")
public class CamaraController {
    @Autowired
    CamaraService camaraService;

    @GetMapping("/getPageCamara/{numpag}/{tampag}")
    public ResponseEntity<Page<CamaraDto>> getPageCamara(@PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        Page<CamaraDto> respuesta = camaraService.getPageCamara(pageable);
        return new ResponseEntity<>(respuesta, HttpStatus.OK);
    }

    @PostMapping("/saveCamara")
    public ResponseEntity<Object> saveCamara(@RequestBody CamaraDto camaraDto) {
        String r = camaraService.saveCamara(camaraDto);
        RespuestaHttp resp = new RespuestaHttp();
        if (r.isEmpty() || r.isBlank())
            resp.setValorDevuelto("Error al grabar la Camara");
        else
            resp.setValorDevuelto(r);
        return  new ResponseEntity<>(resp, HttpStatus.OK);
    }
}
