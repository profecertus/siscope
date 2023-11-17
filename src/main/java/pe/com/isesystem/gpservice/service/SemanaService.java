package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.SemanaDto;
import pe.com.isesystem.gpservice.model.Semana;
import pe.com.isesystem.gpservice.repository.SemanaRepository;

@Service
public class SemanaService  {
    SemanaRepository semanaRepository;
    EmbarcacionService embarcacionService;
    ModelMapper modelMapper;

    public SemanaService(SemanaRepository semanaRepository, ModelMapper modelMapper, EmbarcacionService embarcacionService){
        this.semanaRepository = semanaRepository;
        this.modelMapper = modelMapper;
        this.embarcacionService = embarcacionService;
    }

    public Page<SemanaDto> getAll(Pageable pageable){
        System.out.println(this.embarcacionService.getFecha());
        Page<Semana> s = semanaRepository.findAllId(pageable, this.embarcacionService.getFecha() );
        return new PageImpl<>(s.stream().map((element) -> modelMapper.map(element, SemanaDto.class)).toList(),
                s.getPageable(), s.getTotalElements());

    }

    public SemanaDto save(SemanaDto semanaDto){
        return modelMapper.map(semanaRepository.save(modelMapper.map(semanaDto, Semana.class)), SemanaDto.class);
    }
}
