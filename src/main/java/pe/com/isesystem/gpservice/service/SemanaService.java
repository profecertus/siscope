package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.SemanaDto;
import pe.com.isesystem.gpservice.model.Semana;
import pe.com.isesystem.gpservice.repository.SemanaRepository;
import org.springframework.amqp.core.AmqpTemplate;

import java.util.Optional;

@Service
public class SemanaService  {
    SemanaRepository semanaRepository;
    EmbarcacionService embarcacionService;
    ModelMapper modelMapper;
    private final AmqpTemplate amqpTemplate;

    public SemanaService(SemanaRepository semanaRepository, ModelMapper modelMapper,
                         EmbarcacionService embarcacionService, AmqpTemplate amqpTemplate){
        this.semanaRepository = semanaRepository;
        this.modelMapper = modelMapper;
        this.embarcacionService = embarcacionService;
        this.amqpTemplate = amqpTemplate;
    }

    public Page<SemanaDto> getAll(Pageable pageable){
        Page<Semana> s = semanaRepository.findAllId(pageable, this.embarcacionService.getFecha() + 7 );
        return new PageImpl<>(s.stream().map((element) -> modelMapper.map(element, SemanaDto.class)).toList(),
                s.getPageable(), s.getTotalElements());
    }

    public SemanaDto save(SemanaDto semanaDto){
        //Notifico el cambio a RabbitMQ
        amqpTemplate.convertAndSend("cambio-semana",semanaDto);
        return modelMapper.map(semanaRepository.save(modelMapper.map(semanaDto, Semana.class)), SemanaDto.class);
    }

    public Optional<SemanaDto> getSemana(Long idSemana){
        return semanaRepository.findById(idSemana).map((element) -> modelMapper.map(element, SemanaDto.class));
    }
}
