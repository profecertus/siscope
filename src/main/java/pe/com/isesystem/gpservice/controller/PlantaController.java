package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.PlantaDto;
import pe.com.isesystem.gpservice.response.ResPlantaWithDestino;
import pe.com.isesystem.gpservice.service.PlantaService;

@RestController
@RequestMapping("/planta/v1")
public class PlantaController {
    @Autowired
    private PlantaService plantaService;

    @GetMapping("/getAllPage/{numpag}/{tampag}")
    public ResponseEntity<Page<ResPlantaWithDestino>> getAllPage(@PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        Page<ResPlantaWithDestino> plantaDtoList =  plantaService.getAllPlanta(pageable);
        return new ResponseEntity<>(plantaDtoList, HttpStatus.OK);
    }

    @PostMapping("/savePlanta")
    public ResponseEntity<Object> savePlanta(@RequestBody ResPlantaWithDestino resPlantaWithDestino){
        RespuestaHttp resp = new RespuestaHttp();
        resp.setValorDevuelto(plantaService.savePlanta(resPlantaWithDestino));
        return new ResponseEntity<>(resp, HttpStatus.OK);
    }
}
