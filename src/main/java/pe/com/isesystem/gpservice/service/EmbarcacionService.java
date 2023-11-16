package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.dto.ProveedorDto;
import pe.com.isesystem.gpservice.dto.RelEmbarcacionProveedorDto;
import pe.com.isesystem.gpservice.model.Embarcacion;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedor;
import pe.com.isesystem.gpservice.repository.EmbarcacionRepository;
import pe.com.isesystem.gpservice.repository.ProveedorRepository;
import pe.com.isesystem.gpservice.repository.RelEmbarcacionProveedorRepository;

import java.util.List;
import java.util.Optional;

@Service
public class EmbarcacionService {
    private final EmbarcacionRepository embarcacionRepository;
    private final ModelMapper modelMapper;
    private final RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository;
    private final ProveedorRepository proveedorRepository;

    public EmbarcacionService(EmbarcacionRepository embarcacionRepository, ModelMapper modelMapper,
                              RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository,
                              ProveedorRepository proveedorRepository){
        this.embarcacionRepository = embarcacionRepository;
        this.modelMapper = modelMapper;
        this.relEmbarcacionProveedorRepository = relEmbarcacionProveedorRepository;
        this.proveedorRepository = proveedorRepository;
    }

    public Long getFecha(){
        return proveedorRepository.getFecha();
    }

    public Page<EmbarcacionDto> getAllEmbarcacion(Pageable pageable){
        Page<Embarcacion> pageEmbarcacion = embarcacionRepository.findAllByEstadoRegOrderById(pageable, true);
        List<EmbarcacionDto> listEmbarcacionDto = pageEmbarcacion.stream().toList().stream().map((element) -> modelMapper.map(element, EmbarcacionDto.class)).toList();
        //Obtengo los Proveedores de cada embarcacion
        List<EmbarcacionDto> relEmbarcacionDtoList =
                listEmbarcacionDto.stream().peek(
                        elemento -> {
                            List<RelEmbarcacionProveedor> l = this.relEmbarcacionProveedorRepository.
                                    findAllById_IdEmbarcacion(elemento.getIdEmbarcacion());

                            elemento.setRelEmbarcacionProveedorDto(l.stream().
                                    map((element) -> modelMapper.map(element, RelEmbarcacionProveedorDto.class)).
                                    toList());
                        }).toList();
        for ( EmbarcacionDto dato:relEmbarcacionDtoList) {
            for (RelEmbarcacionProveedorDto rel : dato.getRelEmbarcacionProveedorDto()) {
                Optional<Proveedor> prov = this.proveedorRepository.findById(rel.getIdProovedor().getId());
                rel.setIdProovedor(modelMapper.map(prov, ProveedorDto.class));
            }
        }
        return new PageImpl<>(relEmbarcacionDtoList, pageEmbarcacion.getPageable(), pageEmbarcacion.getTotalElements());
    }

    public EmbarcacionDto getEmbarcacionRel(Long idEmbarcacion){
        Optional<Embarcacion> embarcacion =  embarcacionRepository.findById(idEmbarcacion);
        EmbarcacionDto embarcacionDto = null;
        if(embarcacion.isPresent()){
            embarcacionDto = modelMapper.map(embarcacion.get(), EmbarcacionDto.class);
        }
        List<RelEmbarcacionProveedor> l = this.relEmbarcacionProveedorRepository.
                findAllById_IdEmbarcacion(embarcacionDto.getIdEmbarcacion());

        embarcacionDto.setRelEmbarcacionProveedorDto(l.stream().
                map((element) -> modelMapper.map(element, RelEmbarcacionProveedorDto.class)).
                toList());

        for (RelEmbarcacionProveedorDto rel : embarcacionDto.getRelEmbarcacionProveedorDto()) {
            Optional<Proveedor> prov = this.proveedorRepository.findById(rel.getIdProovedor().getId());
            rel.setIdProovedor(modelMapper.map(prov, ProveedorDto.class));
        }

        return embarcacionDto;
    }

    public EmbarcacionDto getEmbarcacion(Long idEmbarcacion){
        Optional<Embarcacion> embarcacion =  embarcacionRepository.findById(idEmbarcacion);
        EmbarcacionDto embarcacionDto = null;
        if(embarcacion.isPresent()){
            embarcacionDto = modelMapper.map(embarcacion.get(), EmbarcacionDto.class);
        }
        return embarcacionDto;
    }

    public EmbarcacionDto saveEmbarcacion(EmbarcacionDto embarcacionDto){
        return modelMapper.map(embarcacionRepository.save(modelMapper.map(embarcacionDto, Embarcacion.class)), EmbarcacionDto.class);
    }
}
