package pe.com.isesystem.gpservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pe.com.isesystem.gpservice.configuration.RespuestaHttp;
import pe.com.isesystem.gpservice.dto.GastoProveedorDto;
import pe.com.isesystem.gpservice.dto.ProveedorDto;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.response.ResProveedorWithService;
import pe.com.isesystem.gpservice.service.ProveedorService;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/proveedor/v1")
public class ProovedorController {
    @Autowired
    ProveedorService proveedorService;

    @GetMapping("/getAll")
    public ResponseEntity<List<ProveedorDto>> getAll(){
        List<ProveedorDto> proveedorDtoList =  proveedorService.getAllProveedor(true);
        return new ResponseEntity<>(proveedorDtoList, HttpStatus.OK);
    }

    @GetMapping("/getAllWithService")
    public ResponseEntity<List<ResProveedorWithService>> getAllWithService(){
        List<ResProveedorWithService> proveedorDtoList =  proveedorService.getAllProveedorWithServicios(true, true);
        return new ResponseEntity<>(proveedorDtoList, HttpStatus.OK);
    }

    @GetMapping("/getAllPage/{numpag}/{tampag}")
    public ResponseEntity<Page<ResProveedorWithService>> getAllWithServicePage( @PathVariable int numpag, @PathVariable int tampag){
        final Pageable pageable = PageRequest.of(numpag, tampag );
        Page<ResProveedorWithService> proveedorDtoList =  proveedorService.getAllPagesProveedorWithServicios(pageable);
        return new ResponseEntity<>(proveedorDtoList, HttpStatus.OK);
    }

    @GetMapping("/getProveedorPorTipo/{tipoServicio}")
    public ResponseEntity<List<GastoProveedorDto>> getProveedorPorTipo(@PathVariable Long tipoServicio){
        return new ResponseEntity<>(proveedorService.getProveedorPorTipo(tipoServicio),
                HttpStatus.OK);
    }

    @GetMapping("/obtenerProveedor/{proveedor}")
    public ResponseEntity<ProveedorDto> getProveedor(@PathVariable Long proveedor){
        ProveedorDto proveedorDto =  proveedorService.getById(proveedor);
        return new ResponseEntity<>(proveedorDto, proveedorDto==null?HttpStatus.NO_CONTENT:HttpStatus.OK);
    }

    @GetMapping("/obtenerPrecio/{idProveedor}/{tipoServicio}/{idDia}")
    public ResponseEntity<Number> getPrecioxDia(@PathVariable Long idProveedor,@PathVariable Long tipoServicio,@PathVariable Long idDia){
        return new ResponseEntity<>(proveedorService.getMontoPorDia(idProveedor, tipoServicio, idDia), HttpStatus.OK);
    }

    @PostMapping("/saveProveedor")
    public ResponseEntity<Object> saveProveedor(@RequestBody ProveedorDto proveedorDto){
        Long idProveedor = proveedorService.save(proveedorDto);
        RespuestaHttp resp = new RespuestaHttp();
        resp.setValorDevuelto(idProveedor);
        return new ResponseEntity<>(resp, HttpStatus.OK);
    }

    @PostMapping("/saveProveedorWithService")
    public ResponseEntity<Object> saveProveedorWithService(@RequestBody ResProveedorWithService proveedorDto){
        Long idProveedor = proveedorService.save(proveedorDto.getProveedor());
        proveedorService.saveRelProvServ(proveedorDto.getTipoServicioDtos(), idProveedor);
        if (proveedorDto.getCuenta().getIdBanco() != null){
            proveedorService.saveCuenta(idProveedor,
                    proveedorDto.getCuenta().getIdBanco().getIdBanco(),
                    proveedorDto.getCuenta().getId().getNumeroCuenta());
        }
        RespuestaHttp resp = new RespuestaHttp();
        resp.setValorDevuelto(idProveedor);
        return new ResponseEntity<>(resp, HttpStatus.OK);
    }
}
