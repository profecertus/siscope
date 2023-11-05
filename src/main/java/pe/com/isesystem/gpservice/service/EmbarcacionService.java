package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.model.Embarcacion;
import pe.com.isesystem.gpservice.repository.EmbarcacionRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmbarcacionService {
    private EmbarcacionRepository embarcacionRepository;
    private ModelMapper modelMapper;

    public EmbarcacionService(EmbarcacionRepository embarcacionRepository, ModelMapper modelMapper){
        this.embarcacionRepository = embarcacionRepository;
        this.modelMapper = modelMapper;
    }

    public Page<EmbarcacionDto> getAllEmbarcacion(Pageable pageable){
        Page<Embarcacion> pageEmbarcacion = embarcacionRepository.findAll(pageable);
        List<EmbarcacionDto> listEmbarcacionDto = pageEmbarcacion.stream().toList().stream().map((element) -> modelMapper.map(element, EmbarcacionDto.class)).collect(Collectors.toList());
        return new PageImpl<>(listEmbarcacionDto, pageEmbarcacion.getPageable(), pageEmbarcacion.getTotalElements());
    }

    public EmbarcacionDto saveEmbarcacion(EmbarcacionDto embarcacionDto){
        return modelMapper.map(embarcacionRepository.save(modelMapper.map(embarcacionDto, Embarcacion.class)), EmbarcacionDto.class);
    }
}
