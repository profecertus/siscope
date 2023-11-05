package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.BancoDto;
import pe.com.isesystem.gpservice.dto.FormaPagoDto;
import pe.com.isesystem.gpservice.repository.FormaPagoRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FormaPagoService {
    @Autowired
    FormaPagoRepository formaPagoRepository;
    @Autowired
    ModelMapper modelMapper;

    public List<FormaPagoDto> getAllFormaPago(){
        return formaPagoRepository.findAll().stream().map((element) -> modelMapper.map(element, FormaPagoDto.class)).collect(Collectors.toList());
    }
}
