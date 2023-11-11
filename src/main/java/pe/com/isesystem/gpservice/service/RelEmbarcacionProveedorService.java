package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.repository.EmbarcacionRepository;
import pe.com.isesystem.gpservice.repository.RelEmbarcacionProveedorRepository;

@Service
public class RelEmbarcacionProveedorService {
    RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository;
    EmbarcacionService embarcacionService;
    ModelMapper modelMapper;

    public RelEmbarcacionProveedorService(RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository, ModelMapper modelMapper,
                                          EmbarcacionService embarcacionService){
        this.relEmbarcacionProveedorRepository = relEmbarcacionProveedorRepository;
        this.modelMapper = modelMapper;
        this.embarcacionService = embarcacionService;
    }

    @Transactional
    public EmbarcacionDto actualizarEmbarcacionProveedor(Long idEmbarcacion, Long idProveedor, Long idTipoServicio){
        this.relEmbarcacionProveedorRepository.eliminarRelEmbarcacionProveedor(idEmbarcacion, idTipoServicio);
        this.relEmbarcacionProveedorRepository.grabarRelEmbarcacionProveedor(idEmbarcacion, idProveedor, idTipoServicio);
        return modelMapper.map( this.embarcacionService.getEmbarcacionRel(idEmbarcacion), EmbarcacionDto.class);
    }
}
