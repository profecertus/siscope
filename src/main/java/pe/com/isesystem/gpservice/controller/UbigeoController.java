package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.UbigeoDto;
import pe.com.isesystem.gpservice.service.UbigeoService;

import java.util.List;

@RestController
@RequestMapping("/ubigeo/v1")
public class UbigeoController {
    @Autowired
    UbigeoService ubigeoService;
    @GetMapping("/getAllUbigeo")
    public ResponseEntity<List<UbigeoDto>> getAllUbigeo(){
        return  new ResponseEntity<>( this.ubigeoService.getAllUbigeo(), HttpStatus.OK);
    }
}
