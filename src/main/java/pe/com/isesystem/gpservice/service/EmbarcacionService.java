package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.dto.RelEmbarcacionProveedorDto;
import pe.com.isesystem.gpservice.model.Embarcacion;
import pe.com.isesystem.gpservice.model.RelEmbarcacionProveedor;
import pe.com.isesystem.gpservice.repository.EmbarcacionRepository;
import pe.com.isesystem.gpservice.repository.RelEmbarcacionProveedorRepository;

import java.util.List;

@Service
public class EmbarcacionService {
    private final EmbarcacionRepository embarcacionRepository;
    private final ModelMapper modelMapper;
    private final RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository;

    public EmbarcacionService(EmbarcacionRepository embarcacionRepository, ModelMapper modelMapper,
                              RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository){
        this.embarcacionRepository = embarcacionRepository;
        this.modelMapper = modelMapper;
        this.relEmbarcacionProveedorRepository = relEmbarcacionProveedorRepository;
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
        return new PageImpl<>(relEmbarcacionDtoList, pageEmbarcacion.getPageable(), pageEmbarcacion.getTotalElements());
    }

    public EmbarcacionDto saveEmbarcacion(EmbarcacionDto embarcacionDto){
        return modelMapper.map(embarcacionRepository.save(modelMapper.map(embarcacionDto, Embarcacion.class)), EmbarcacionDto.class);
    }
}
