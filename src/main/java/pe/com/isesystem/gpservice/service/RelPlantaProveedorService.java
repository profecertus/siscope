package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.model.TarifarioPlanta;
import pe.com.isesystem.gpservice.repository.RelPlantaProveedorRepository;
import pe.com.isesystem.gpservice.repository.TarifarioPlantaRepository;

@Service
public class RelPlantaProveedorService {
    RelPlantaProveedorRepository relPlantaProveedorRepository;
    TarifarioPlantaRepository tarifarioPlantaRepository;
    ModelMapper modelMapper;

    public RelPlantaProveedorService(RelPlantaProveedorRepository relPlantaProveedorRepository, ModelMapper modelMapper,
                                     TarifarioPlantaRepository tarifarioPlantaRepository){
        this.relPlantaProveedorRepository = relPlantaProveedorRepository;
        this.modelMapper = modelMapper;
        this.tarifarioPlantaRepository = tarifarioPlantaRepository;
    }

    @Transactional
    public void actualizarPlantaProveedor(Long idPlanta,  Long idProveedor, Long idTipoServicio){
        Long idMiProveedor = this.tarifarioPlantaRepository.existe(idPlanta, idTipoServicio);
        if (idProveedor != idMiProveedor){
            this.tarifarioPlantaRepository.eliminarTarifarioPlanta(idPlanta, idMiProveedor, idTipoServicio);
        }
        if (  idMiProveedor == 0 || idMiProveedor != idProveedor ){
            this.tarifarioPlantaRepository.insertTarifarioPlanta(idPlanta, idProveedor, idTipoServicio);
        }
        //Ahora grabo la Relacion Proveedor
        this.relPlantaProveedorRepository.eliminarRelPlantaProveedor(idPlanta, idTipoServicio);
        this.relPlantaProveedorRepository.grabarRelPlantaProveedor(idPlanta, idProveedor, idTipoServicio);
    }
}
