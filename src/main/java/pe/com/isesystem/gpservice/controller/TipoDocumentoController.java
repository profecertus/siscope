package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pe.com.isesystem.gpservice.dto.TipoDocumentoDto;
import pe.com.isesystem.gpservice.service.TipoDocumentoService;

import java.util.List;

@Controller
@RequestMapping("/documento/v1")
public class TipoDocumentoController {
    @Autowired
    TipoDocumentoService tipoDocumentoService;

    @GetMapping("/getAll")
    public ResponseEntity<List<TipoDocumentoDto>> getAll(){
        List<TipoDocumentoDto> tipoDocumentoDtoList =  tipoDocumentoService.getAllTipoDocumento(true, true);
        return new ResponseEntity<>(tipoDocumentoDtoList, HttpStatus.OK);
    }

}
