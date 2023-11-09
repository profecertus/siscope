package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.CamaraDto;
import pe.com.isesystem.gpservice.model.Camara;
import pe.com.isesystem.gpservice.repository.CamaraRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CamaraService {
    CamaraRepository camaraRepository;
    ModelMapper modelMapper;

    public CamaraService(CamaraRepository camaraRepository, ModelMapper modelMapper){
        this.camaraRepository = camaraRepository;
        this.modelMapper = modelMapper;
    }

    public Page<CamaraDto> getPageCamara(Pageable pageable){
        Page<Camara> pageCamara = camaraRepository.findAllByEstadoReg(pageable, true);
        List<CamaraDto> camaraDtoList = pageCamara.stream().map((element) -> modelMapper.map(element, CamaraDto.class)).collect(Collectors.toList());
        return new PageImpl<>(camaraDtoList, pageCamara.getPageable(), pageCamara.getTotalElements());
    }

    public String saveCamara(CamaraDto camaraDto){
        Camara c = modelMapper.map(camaraDto, Camara.class);
        return camaraRepository.save(c).getPlaca();
    }
}
