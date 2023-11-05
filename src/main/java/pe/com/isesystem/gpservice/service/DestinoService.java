package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.ClienteDto;
import pe.com.isesystem.gpservice.dto.DestinoDto;
import pe.com.isesystem.gpservice.model.Cliente;
import pe.com.isesystem.gpservice.model.Destino;
import pe.com.isesystem.gpservice.repository.DestinoRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DestinoService {
    DestinoRepository destinoRepository;
    ModelMapper modelMapper;

    public DestinoService(DestinoRepository destinoRepository, ModelMapper modelMapper){
        this.destinoRepository = destinoRepository;
        this.modelMapper = modelMapper;
    }

    public DestinoDto mapDestinotoDestinoDto(Destino destino) {
        DestinoDto destinoDto = this.modelMapper.map(destino, DestinoDto.class);
        return destinoDto;
    }

    public List<DestinoDto> getAllDestino(){
        List<Destino> listDestino = destinoRepository.findAllByEstadoAndEstadoReg(true,true);
        return listDestino.stream().map(this::mapDestinotoDestinoDto).collect(Collectors.toList());
    }


}
