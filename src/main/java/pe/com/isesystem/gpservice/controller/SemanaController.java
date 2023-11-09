package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.SemanaDto;
import pe.com.isesystem.gpservice.service.SemanaService;

@RestController
@RequestMapping("/semana/v1")
public class SemanaController {
    @Autowired
    SemanaService semanaService;
    @GetMapping("/getAllSemana/{numpag}/{tampag}")
    public Page<SemanaDto> getAllTrabajador(@PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        return semanaService.getAll(pageable);
    }

    @PostMapping("/saveSemana")
    public ResponseEntity<RespuestaHttp> saveSemana(@RequestBody SemanaDto semanaDto){
        SemanaDto sem = semanaService.save(semanaDto);
        RespuestaHttp respuestaHttp = new RespuestaHttp();
        respuestaHttp.setValorDevuelto(sem);
        return new ResponseEntity<>(respuestaHttp, HttpStatus.OK);
    }
}
