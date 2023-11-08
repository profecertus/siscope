package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.repository.RelPlantaProveedorRepository;

@Service
public class RelPlantaProveedorService {
    RelPlantaProveedorRepository relPlantaProveedorRepository;
    ModelMapper modelMapper;

    public RelPlantaProveedorService(RelPlantaProveedorRepository relPlantaProveedorRepository, ModelMapper modelMapper){
        this.relPlantaProveedorRepository = relPlantaProveedorRepository;
        this.modelMapper = modelMapper;
    }

    @Transactional
    public void actualizarPlantaProveedor(Long idPlanta,  Long idProveedor, Long idTipoServicio){
        this.relPlantaProveedorRepository.eliminarRelPlantaProveedor(idPlanta, idTipoServicio);
        this.relPlantaProveedorRepository.grabarRelPlantaProveedor(idPlanta, idProveedor, idTipoServicio);
    }
}
