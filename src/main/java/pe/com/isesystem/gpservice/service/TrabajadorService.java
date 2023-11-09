package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.TrabajadorDto;
import pe.com.isesystem.gpservice.model.Trabajador;
import pe.com.isesystem.gpservice.repository.TrabajadorRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TrabajadorService {
    TrabajadorRepository trabajadorRepository;
    ModelMapper modelMapper;

    public TrabajadorService(TrabajadorRepository trabajadorRepository, ModelMapper modelMapper){
        this.trabajadorRepository = trabajadorRepository;
        this.modelMapper = modelMapper;
    }

    public Page<TrabajadorDto> getAllTrabajador(Pageable pageable){
        Page<Trabajador> p = trabajadorRepository.findAllByEstadoRegOrderById(pageable,  true);
        List<TrabajadorDto> trabajadorDtoList = p.stream().
                map((element) -> modelMapper.map(element, TrabajadorDto.class)).
                collect(Collectors.toList());
        return new PageImpl<>(trabajadorDtoList, p.getPageable(), p.getTotalElements());
    }

    public TrabajadorDto saveTrabajador(TrabajadorDto trabajadorDto){
        Trabajador t = trabajadorRepository.save(modelMapper.map(trabajadorDto, Trabajador.class));
        return modelMapper.map(t, TrabajadorDto.class);
    }
}
