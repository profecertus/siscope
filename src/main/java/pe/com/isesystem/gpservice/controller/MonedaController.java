package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.MonedaDto;
import pe.com.isesystem.gpservice.model.Moneda;
import pe.com.isesystem.gpservice.service.MonedaService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/moneda/v1")
public class MonedaController {
    @Autowired
    private MonedaService monedaService;

    @GetMapping("/obtenerMoneda/{id}")
    public ResponseEntity<MonedaDto> obtenerMonedaPorId(@PathVariable Long id){
        MonedaDto monedaDto = monedaService.getById(id);
        ResponseEntity response =  monedaDto!=null?new ResponseEntity<>(monedaDto, HttpStatus.OK):new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        return  response;
    }

    @GetMapping("/getAllMoneda")
    public ResponseEntity<List<MonedaDto>> getAllMoneda(){
        List<MonedaDto> monedaDtoList = monedaService.getAll();
        return new ResponseEntity<>(monedaDtoList, HttpStatus.OK);
    }
}
