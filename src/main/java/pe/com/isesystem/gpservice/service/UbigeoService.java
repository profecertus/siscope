package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.UbigeoDto;
import pe.com.isesystem.gpservice.model.Ubigeo;
import pe.com.isesystem.gpservice.repository.UbigeoRepository;

import java.util.List;


@Service
public class UbigeoService {
    UbigeoRepository ubigeoRepository;
    ModelMapper modelMapper;

    public UbigeoService(UbigeoRepository ubigeoRepository, ModelMapper modelMapper){
        this.ubigeoRepository = ubigeoRepository;
        this.modelMapper = modelMapper;
    }

    public List<UbigeoDto> getAllUbigeo(){
        List<Ubigeo> ubigeoList = ubigeoRepository.findAllByEstadoReg(true);
        return ubigeoList.stream().map((element) -> modelMapper.map(element, UbigeoDto.class)).toList();
    }
}
