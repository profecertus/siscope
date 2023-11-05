package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.DestinoDto;
import pe.com.isesystem.gpservice.service.DestinoService;

import java.util.List;

@RestController
@RequestMapping("/destino/v1")
public class DestinoController {

    @Autowired
    DestinoService destinoService;

    @GetMapping("/getAllDestino")
    public List<DestinoDto> getAllDestino(){
        return destinoService.getAllDestino();
    }
}
