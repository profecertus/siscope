package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.MonedaDto;
import pe.com.isesystem.gpservice.model.Moneda;
import pe.com.isesystem.gpservice.repository.MonedaRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MonedaService{
    private MonedaRepository monedaRepository;
    private ModelMapper modelMapper;

    public MonedaService(MonedaRepository monedaRepository, ModelMapper modelMapper){
        this.monedaRepository = monedaRepository;
        this.modelMapper = modelMapper;
    }

    public MonedaDto getById(Long id){
        Optional<Moneda> moneda = monedaRepository.findById(id);
        if(moneda.isPresent()){
            Moneda mon = moneda.get();
            return this.modelMapper.map(mon, MonedaDto.class) ;
        }else{
            return null;
        }
    }

    public List<MonedaDto> getAll(){
        return monedaRepository.findAll().stream().map((element) -> modelMapper.map(element, MonedaDto.class)).collect(Collectors.toList());
    }
}
