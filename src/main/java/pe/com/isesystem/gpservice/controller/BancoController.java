package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.BancoDto;
import pe.com.isesystem.gpservice.service.BancoService;

import java.util.List;

@RestController
@RequestMapping("/banco/v1")
public class BancoController {
    @Autowired
    BancoService bancoService;

    @GetMapping("/getAllBanco")
    public ResponseEntity<List<BancoDto>> getAll(){
        List<BancoDto> bancoDtoList = bancoService.getAllBanco();
        return new ResponseEntity<>(bancoDtoList, HttpStatus.OK);
    }
}
