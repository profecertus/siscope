package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.EmbarcacionDto;
import pe.com.isesystem.gpservice.model.*;
import pe.com.isesystem.gpservice.repository.EmbarcacionRepository;
import pe.com.isesystem.gpservice.repository.RelEmbarcacionProveedorRepository;
import pe.com.isesystem.gpservice.repository.TarifarioEmbarcacionRepository;

import javax.swing.text.html.Option;
import java.util.Optional;

@Service
public class RelEmbarcacionProveedorService {
    private final RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository;
    private final EmbarcacionService embarcacionService;
    private final TarifarioEmbarcacionRepository tarifarioEmbarcacionRepository;
    private final ModelMapper modelMapper;

    public RelEmbarcacionProveedorService(RelEmbarcacionProveedorRepository relEmbarcacionProveedorRepository, ModelMapper modelMapper,
                                          EmbarcacionService embarcacionService, TarifarioEmbarcacionRepository tarifarioEmbarcacionRepository){
        this.relEmbarcacionProveedorRepository = relEmbarcacionProveedorRepository;
        this.modelMapper = modelMapper;
        this.embarcacionService = embarcacionService;
        this.tarifarioEmbarcacionRepository = tarifarioEmbarcacionRepository;
    }

    @Transactional
    public EmbarcacionDto actualizarEmbarcacionProveedor(Long idEmbarcacion, Long idProveedor, Long idTipoServicio){
        TarifarioEmbarcacion te = new TarifarioEmbarcacion();
        Embarcacion e = new Embarcacion();
        Proveedor pr = new Proveedor();
        TipoServicio ts = new TipoServicio();
        Moneda m = new Moneda();
        TarifarioEmbarcacionId teId = new TarifarioEmbarcacionId();

        this.relEmbarcacionProveedorRepository.eliminarRelEmbarcacionProveedor(idEmbarcacion, idTipoServicio);
        this.relEmbarcacionProveedorRepository.grabarRelEmbarcacionProveedor(idEmbarcacion, idProveedor, idTipoServicio);

        //Pregunto para saber si el proveedor cambio
        Optional<TarifarioEmbarcacion> teq =  this.tarifarioEmbarcacionRepository.
                findById_IdEmbarcacionAndId_IdTipoServicioAndId_IdDia(idEmbarcacion, idTipoServicio, this.embarcacionService.getFecha());

        if (teq.isPresent()){
            if (teq.get().getIdProveedor().getId() == idProveedor){
                return modelMapper.map( this.embarcacionService.getEmbarcacionRel(idEmbarcacion), EmbarcacionDto.class);
            }
        }

        e.setId(idEmbarcacion);
        teId.setIdEmbarcacion(idEmbarcacion);
        te.setIdEmbarcacion(e);

        pr.setId(idProveedor);
        teId.setIdProveedor(idProveedor);
        te.setIdProveedor(pr);

        ts.setId(idTipoServicio);
        teId.setIdTipoServicio(idTipoServicio);
        te.setIdTipoServicio(ts);

        m.setIdMoneda(1L);
        te.setIdMoneda(m);

        teId.setIdDia(this.embarcacionService.getFecha());
        te.setId(teId);

        te.setEstado(true);
        te.setEstadoReg(true);

        this.tarifarioEmbarcacionRepository.save(te);
        return modelMapper.map( this.embarcacionService.getEmbarcacionRel(idEmbarcacion), EmbarcacionDto.class);
    }
}
