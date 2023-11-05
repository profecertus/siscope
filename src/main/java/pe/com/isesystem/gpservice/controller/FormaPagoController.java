package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.com.isesystem.gpservice.dto.FormaPagoDto;
import pe.com.isesystem.gpservice.service.FormaPagoService;

import java.util.List;

@RestController
@RequestMapping("/formaPago/v1")
public class FormaPagoController {
    @Autowired
    FormaPagoService formaPagoService;

    @GetMapping("/getAllFormaPago")
    public ResponseEntity<List<FormaPagoDto>> getAllFormaPago(){
        List<FormaPagoDto> formaPagoDtoList = formaPagoService.getAllFormaPago();
        return new ResponseEntity<List<FormaPagoDto>>(formaPagoDtoList, HttpStatus.OK);
    }
}
