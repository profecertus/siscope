package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.BancoDto;
import pe.com.isesystem.gpservice.dto.MonedaDto;
import pe.com.isesystem.gpservice.repository.BancoRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BancoService {
    @Autowired
    BancoRepository bancoRepository;
    @Autowired
    ModelMapper modelMapper;

    public List<BancoDto> getAllBanco(){
        return bancoRepository.findAll().stream().map((element) -> modelMapper.map(element, BancoDto.class)).collect(Collectors.toList());
    }

}
