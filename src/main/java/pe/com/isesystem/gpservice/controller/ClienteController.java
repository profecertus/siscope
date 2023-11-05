package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.ClienteDto;
import pe.com.isesystem.gpservice.service.ClienteService;

import java.util.List;

@RestController
@RequestMapping("/cliente/v1")
public class ClienteController {

    @Autowired
    ClienteService clienteService;

    @GetMapping("/getAllCliente")
    public ResponseEntity<List<ClienteDto>> getAllCliente(){
        return new ResponseEntity<>(clienteService.getAllCliente(), HttpStatus.OK);
    }

    @PostMapping("/saveCliente")
    public ResponseEntity<Object> saveCliente(@RequestBody ClienteDto clienteDto){
        List<ClienteDto> clienteDtoList = clienteService.saveCliente(clienteDto);
        RespuestaHttp resp = new RespuestaHttp();
        return new ResponseEntity<>(clienteDtoList, HttpStatus.OK);
    }
}
