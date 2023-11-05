package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pe.com.isesystem.gpservice.dto.TipoServicioDto;
import pe.com.isesystem.gpservice.service.TipoServicioService;

import java.util.List;

@Controller
@RequestMapping("/tipoServicio/v1")
public class TipoServicioController {

    @Autowired
    TipoServicioService tipoServicioService;

    @GetMapping("/getAll")
    public ResponseEntity<List<TipoServicioDto>> getAll(){
        List<TipoServicioDto> tipoServicioDtoList =  tipoServicioService.getAllTipoServicio(true, true);
        return new ResponseEntity<>(tipoServicioDtoList, HttpStatus.OK);
    }
}
