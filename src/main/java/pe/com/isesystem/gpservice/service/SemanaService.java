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
    ModelMapper modelMapper;

    public SemanaService(SemanaRepository semanaRepository, ModelMapper modelMapper){
        this.semanaRepository = semanaRepository;
        this.modelMapper = modelMapper;
    }

    public Page<SemanaDto> getAll(Pageable pageable){
        Page<Semana> s = semanaRepository.findAll(pageable);
        return new PageImpl<>(s.stream().map((element) -> modelMapper.map(element, SemanaDto.class)).toList(),
                s.getPageable(), s.getTotalElements());

    }

    public SemanaDto save(SemanaDto semanaDto){
        return modelMapper.map(semanaRepository.save(modelMapper.map(semanaDto, Semana.class)), SemanaDto.class);
    }
}
