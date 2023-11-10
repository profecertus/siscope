package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.repository.RelEmbarcacionProveedorRepository;

@Service
public class RelEmbarcacionProveedorService {
    RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository;
    ModelMapper modelMapper;

    public RelEmbarcacionProveedorService(RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository, ModelMapper modelMapper){
        this.relEmbarcacionProveedorRepository = relEmbarcacionProveedorRepository;
        this.modelMapper = modelMapper;
    }

    @Transactional
    public void actualizarEmbarcacionProveedor(Long idEmbarcacion,  Long idProveedor, Long idTipoServicio){
        this.relEmbarcacionProveedorRepository.eliminarRelEmbarcacionProveedor(idEmbarcacion, idTipoServicio);
        this.relEmbarcacionProveedorRepository.grabarRelEmbarcacionProveedor(idEmbarcacion, idProveedor, idTipoServicio);
    }
}
