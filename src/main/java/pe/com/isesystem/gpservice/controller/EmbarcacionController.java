package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping("/getEmbarcacion/{idEmbarcacion}")
    public ResponseEntity<EmbarcacionDto> getAllEmbarcacion(@PathVariable Long idEmbarcacion){
        EmbarcacionDto respuesta = embarcacionService.getEmbarcacion(idEmbarcacion);
        return new ResponseEntity<>(respuesta, HttpStatus.OK);
    }

    @PostMapping("/saveEmbarcacion")
    public ResponseEntity<EmbarcacionDto> saveEmbarcacion(@RequestBody EmbarcacionDto embarcacionDto){
        EmbarcacionDto emb = embarcacionService.saveEmbarcacion(embarcacionDto);
        return new ResponseEntity<>(emb, HttpStatus.OK);
    }
}
