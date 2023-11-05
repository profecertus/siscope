package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.service.EmbarcacionService;

@RestController
@RequestMapping("/embarcacion/v1")
public class EmbarcacionController {
    @Autowired
    EmbarcacionService embarcacionService;

    @GetMapping("/getAllEmbarcacion/{numpag}/{tampag}")
    public ResponseEntity<Page<EmbarcacionDto>> getAllEmbarcacion(@PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        Page<EmbarcacionDto> respuesta = embarcacionService.getAllEmbarcacion(pageable);
        return new ResponseEntity<>(respuesta, HttpStatus.OK);
    }
}
