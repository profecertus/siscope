package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.TipoServicioDto;
import pe.com.isesystem.gpservice.model.TipoServicio;
import pe.com.isesystem.gpservice.repository.TipoServicioRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class TipoServicioService {
    private TipoServicioRepository tipoServicioRepository;
    private ModelMapper modelMapper;

    TipoServicioService(TipoServicioRepository tipoServicioRepository, ModelMapper modelMapper){
        this.tipoServicioRepository = tipoServicioRepository;
        this.modelMapper = modelMapper;
    }

    public List<TipoServicioDto> getAllTipoServicio(Boolean estado, Boolean estadoReg){
        List<TipoServicio> tipoServicios = tipoServicioRepository.getAllByEstadoAndEstadoReg(estado, estadoReg);
        List<TipoServicioDto> tipoServicioDtos = new ArrayList<>();
        if(!tipoServicios.isEmpty())
            for(TipoServicio tipoServicio:tipoServicios)
                tipoServicioDtos.add( this.modelMapper.map(tipoServicio, TipoServicioDto.class) );
        return tipoServicioDtos;
    }

}
