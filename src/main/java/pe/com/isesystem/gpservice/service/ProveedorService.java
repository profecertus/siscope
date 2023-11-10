package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.ProveedorDto;
import pe.com.isesystem.gpservice.dto.RelProvTiposervDto;
import pe.com.isesystem.gpservice.dto.TipoServicioDto;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.model.RelProvTiposerv;
import pe.com.isesystem.gpservice.repository.ProveedorRepository;
import pe.com.isesystem.gpservice.repository.RelProvServRepository;
import pe.com.isesystem.gpservice.response.ResProveedorWithService;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProveedorService {
    private final ProveedorRepository proveedorRepository;
    private final RelProvServRepository relProvServRepository;
    private final ModelMapper modelMapper;

    public ProveedorService(ProveedorRepository proveedorRepository, ModelMapper modelMapper, RelProvServRepository relProvServRepository){
        this.proveedorRepository = proveedorRepository;
        this.modelMapper = modelMapper;
        this.relProvServRepository = relProvServRepository;
    }

    public List<ProveedorDto> getAllProveedor(Boolean estadoReg){
        List<Proveedor> proveedors = proveedorRepository.getAllByEstadoRegOrderById(estadoReg);
        List<ProveedorDto> proveedorsDtos = new ArrayList<>();
        if(!proveedors.isEmpty())
            for(Proveedor proveedor:proveedors){
                //Por cada Proveedor capturo el tipo de Servicio
                List<RelProvTiposervDto> relProvTiposervs = relProvServRepository.
                        findAllById_IdProveedor(proveedor.getId()).stream().
                        map((element) -> modelMapper.map(element, RelProvTiposervDto.class)).
                        collect(Collectors.toList());
                ProveedorDto proveedorDto = this.modelMapper.map(proveedor, ProveedorDto.class);
                proveedorDto.setRelProvTiposervDto( relProvTiposervs );
                proveedorsDtos.add( proveedorDto );
            }

        return proveedorsDtos;
    }

    public ProveedorDto mapProveedorToProveedorDto(Proveedor proveedor) {
        return this.modelMapper.map(proveedor, ProveedorDto.class);
    }

    public Page<ResProveedorWithService> getAllPagesProveedorWithServicios(Pageable pageable){
        List<ResProveedorWithService> retorno = new ArrayList<>();
        Page<Proveedor> p = proveedorRepository.findAllByEstadoRegOrderById(pageable, true);

        List<ProveedorDto> contentProveedorDto = p.getContent().stream()
                .map(this::mapProveedorToProveedorDto)
                .toList();

        for(ProveedorDto proveedor:contentProveedorDto){
            List<RelProvTiposerv> relProvTiposervs = relProvServRepository.findAllById_IdProveedor(proveedor.getId());
            List<TipoServicioDto> lista = new ArrayList<>();

            if(!relProvTiposervs.isEmpty()){
                for(RelProvTiposerv rel:relProvTiposervs){
                    lista.add(this.modelMapper.map(rel.getIdTipoServicio(), TipoServicioDto.class));
                }
            }
            retorno.add(new ResProveedorWithService(this.modelMapper.map(proveedor, ProveedorDto.class), lista ));
        }

        return new PageImpl<>(retorno, p.getPageable(), p.getTotalElements());
    }

    public List<ResProveedorWithService> getAllProveedorWithServicios(Boolean estado, Boolean estadoReg){
        List<Proveedor> proveedors = proveedorRepository.getAllByEstadoRegOrderById(estadoReg);
        List<ResProveedorWithService> retorno = new ArrayList<>();
        if(!proveedors.isEmpty()){
            for(Proveedor proveedor:proveedors){
                List<RelProvTiposerv> relProvTiposervs = relProvServRepository.findAllById_IdProveedor(proveedor.getId());
                List<TipoServicioDto> lista = new ArrayList<>();
                if(!relProvTiposervs.isEmpty()){
                    for(RelProvTiposerv rel:relProvTiposervs){
                        lista.add(this.modelMapper.map(rel.getIdTipoServicio(), TipoServicioDto.class));
                    }
                }
                retorno.add(new ResProveedorWithService(this.modelMapper.map(proveedor, ProveedorDto.class), lista ));
            }
        }
        return retorno;
    }


    public ProveedorDto getById(Long id){
        Optional<Proveedor> proveedor = proveedorRepository.findById(id);
        if(proveedor.isPresent()){
            //Proveedor prov = proveedor.get();
            return this.modelMapper.map(proveedor, ProveedorDto.class);
        }else{
            return null;
        }
    }

    @Transactional
    public Long save(ProveedorDto proveedorDto){
        Proveedor proveedor = proveedorRepository.save( this.modelMapper.map( proveedorDto, Proveedor.class) );
        return proveedor.getId();
    }

    @Transactional
    public void saveRelProvServ(List<TipoServicioDto> relProvTiposervDto, Long IdProveedor){
        if (!relProvTiposervDto.isEmpty()){
            relProvServRepository.eliminarRelacionProvServ(IdProveedor);
            for(TipoServicioDto rel : relProvTiposervDto){
                if(relProvServRepository.findAllById_IdProveedorAndOrId_IdTipoServicio( IdProveedor, rel.getId()) != 1){
                    relProvServRepository.grabarRelacionProvServ(IdProveedor, rel.getId());
                }
            }
        }
    }

}
