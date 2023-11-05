package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.ProveedorDto;
import pe.com.isesystem.gpservice.dto.TipoDocumentoDto;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.model.TipoDocumento;
import pe.com.isesystem.gpservice.repository.TipoDocumentoRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class TipoDocumentoService {
    private TipoDocumentoRepository tipoDocumentoRepository;
    private ModelMapper modelMapper;

    public TipoDocumentoService(TipoDocumentoRepository tipoDocumentoRepository, ModelMapper modelMapper){
        this.tipoDocumentoRepository = tipoDocumentoRepository;
        this.modelMapper = modelMapper;
    }

    public List<TipoDocumentoDto> getAllTipoDocumento(Boolean estado, Boolean estadoReg){
        List<TipoDocumento> tipoDocumentos = tipoDocumentoRepository.getAllByEstadoAndEstadoReg(estado, estadoReg);
        List<TipoDocumentoDto> tipoDocumentoDtos = new ArrayList<>();
        if(!tipoDocumentos.isEmpty())
            for(TipoDocumento tipoDocumento:tipoDocumentos)
                tipoDocumentoDtos.add( this.modelMapper.map(tipoDocumento, TipoDocumentoDto.class) );
        return tipoDocumentoDtos;
    }
}
