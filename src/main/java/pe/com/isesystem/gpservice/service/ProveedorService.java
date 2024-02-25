package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.*;
import pe.com.isesystem.gpservice.model.Proveedor;
import pe.com.isesystem.gpservice.model.RelProvTiposerv;
import pe.com.isesystem.gpservice.model.RelProveedorCuenta;
import pe.com.isesystem.gpservice.model.TipoServicio;
import pe.com.isesystem.gpservice.repository.ProveedorRepository;
import pe.com.isesystem.gpservice.repository.RelProvServRepository;
import pe.com.isesystem.gpservice.repository.RelProveedorCuentaRepository;
import pe.com.isesystem.gpservice.repository.TarifarioGeneralRepository;
import pe.com.isesystem.gpservice.response.ResProveedorWithService;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProveedorService {
    private final ProveedorRepository proveedorRepository;
    private final RelProvServRepository relProvServRepository;
    private final ModelMapper modelMapper;
    private final TarifarioGeneralRepository tarifarioGeneralRepository;
    private final RelProveedorCuentaRepository relProveedorCuentaRepository;
    private final TipoServicioService tipoServicioService;
    private final EmbarcacionService embarcacionService;

    public ProveedorService(ProveedorRepository proveedorRepository, ModelMapper modelMapper, RelProvServRepository relProvServRepository,
                            TarifarioGeneralRepository tarifarioGeneralRepository, TipoServicioService tipoServicioService,
                            EmbarcacionService embarcacionService, RelProveedorCuentaRepository relProveedorCuentaRepository){
        this.proveedorRepository = proveedorRepository;
        this.modelMapper = modelMapper;
        this.relProvServRepository = relProvServRepository;
        this.tarifarioGeneralRepository = tarifarioGeneralRepository;
        this.tipoServicioService = tipoServicioService;
        this.embarcacionService = embarcacionService;
        this.relProveedorCuentaRepository = relProveedorCuentaRepository;
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
        //Por cada Proveedor encuentra su servicio relacionado
        for(ProveedorDto proveedor:contentProveedorDto){
            List<RelProvTiposerv> relProvTiposervs = relProvServRepository.findAllById_IdProveedor(proveedor.getId());
            List<TipoServicioDto> lista = new ArrayList<>();
            RelProveedorCuentaDto relPC = new
                    RelProveedorCuentaDto();
            relPC.setIdProveedor(new ProveedorDto());
            //relPC.setIdBanco(new BancoDto());
            relPC.setIdMoneda(new MonedaDto());
            relPC.setId(new RelProveedorCuentaIdDto());


            if(!relProvTiposervs.isEmpty()){
                for(RelProvTiposerv rel:relProvTiposervs){
                    lista.add(this.modelMapper.map(rel.getIdTipoServicio(), TipoServicioDto.class));
                }
            }

            //Ahora por cada Proveedor busco su cuenta
            Optional<RelProveedorCuenta> relProveedorCuenta = relProveedorCuentaRepository.findFirstById_IdProveedor(proveedor.getId());
            if (relProveedorCuenta.isPresent()){
                relPC = modelMapper.map(relProveedorCuenta.get(), RelProveedorCuentaDto.class);
            }
            retorno.add(new ResProveedorWithService(this.modelMapper.map(proveedor, ProveedorDto.class), lista, relPC ));
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
                RelProveedorCuentaDto relPC = new RelProveedorCuentaDto();

                if(!relProvTiposervs.isEmpty()){
                    for(RelProvTiposerv rel:relProvTiposervs){
                        lista.add(this.modelMapper.map(rel.getIdTipoServicio(), TipoServicioDto.class));
                    }
                }

                //Ahora por cada Proveedor busco su cuenta
                Optional<RelProveedorCuenta> relProveedorCuenta = relProveedorCuentaRepository.findFirstById_IdProveedor(proveedor.getId());
                if (relProveedorCuenta.isPresent()){
                    relPC = modelMapper.map(relProveedorCuenta.get(), RelProveedorCuentaDto.class);
                }
                retorno.add(new ResProveedorWithService(this.modelMapper.map(proveedor, ProveedorDto.class), lista, relPC ));
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
    public Long
    save(ProveedorDto proveedorDto){
        Proveedor proveedor = proveedorRepository.save( this.modelMapper.map( proveedorDto, Proveedor.class) );
        return proveedor.getId();
    }

    @Transactional
    public void saveRelProvServ(List<TipoServicioDto> relProvTiposervDto, Long IdProveedor){
        TipoServicioDto tsDto;
        List<Long> lista = new ArrayList<>();
        if (!relProvTiposervDto.isEmpty()){
            relProvServRepository.eliminarRelacionProvServ(IdProveedor);
            for(TipoServicioDto rel : relProvTiposervDto){
                if(relProvServRepository.findAllById_IdProveedorAndOrId_IdTipoServicio( IdProveedor, rel.getId()) != 1){
                    relProvServRepository.grabarRelacionProvServ(IdProveedor, rel.getId());
                    //Aca debo capturar que tipo es para poder enviarlo a uno u otro tarifario.
                    tsDto = this.tipoServicioService.getTipoServicio(rel.getId());
                    if (tsDto.getTipoTarifa() == 1) {
                        lista.add(rel.getId());
                        if (!tarifarioGeneralRepository.
                                findById_IdProveedorAndId_IdTipoServicioAndId_IdDia(IdProveedor, rel.getId(), proveedorRepository.getFecha()).isPresent()){
                            tarifarioGeneralRepository.insertTarifario(IdProveedor, rel.getId());
                        }
                    }
                }
            }
            tarifarioGeneralRepository.eliminaNoEstan(lista, IdProveedor, this.embarcacionService.getFecha() );
        }
    }

    @Transactional
    public void saveCuenta(Long idProveedor, Long idBanco, String numeroCuenta) {
        if(relProveedorCuentaRepository.totalRegistros(idProveedor, idBanco, numeroCuenta) <= 0)
            relProveedorCuentaRepository.guardar(idProveedor, idBanco, numeroCuenta);
    }

    public List<GastoProveedorDto> getProveedorPorTipo(Long tipoServicio){
        List<Object[]> resp = proveedorRepository.getProveedorPorTipo(tipoServicio);
        List<GastoProveedorDto> respuesta = new ArrayList<>();
        for (Object[] objects : resp) {
            GastoProveedorDto gastoProveedorDto = new GastoProveedorDto();
            gastoProveedorDto.setIdProveedor(Long.parseLong( objects[0].toString() ) );
            gastoProveedorDto.setRazonSocial((String) objects[1]);
            gastoProveedorDto.setIdTipoServicio(Long.parseLong( objects[2].toString() ) );
            respuesta.add(gastoProveedorDto);
        }
        return respuesta;
    }

    public GastoMontoDto getMontoPorDia(Long idProveedor, Long tipoServicio, Long idDia){
        List<Object[]> resp = proveedorRepository.getMontoPorDia(idProveedor, tipoServicio, idDia);
        GastoMontoDto respuesta = new GastoMontoDto();
        return getGastoMontoDto(resp, respuesta);
    }

    public GastoMontoDto getMontoPorDiaOMaximo(Long idProveedor, Long tipoServicio, Long idDia){
        List<Object[]> resp = proveedorRepository.getMontoPorDia(idProveedor, tipoServicio, idDia);
        GastoMontoDto respuesta = new GastoMontoDto();
        if (resp.isEmpty() || (Integer) resp.get(0)[1] == 0 ){
            resp = proveedorRepository.getMontoPorDiaOMaximo(idProveedor, tipoServicio);
        }

        return getGastoMontoDto(resp, respuesta);
    }

    private GastoMontoDto getGastoMontoDto(List<Object[]> resp, GastoMontoDto respuesta) {
        for (Object[] objects : resp) {
            respuesta.setAbreviatura(objects[0].toString());
            respuesta.setPrecio( (Number) objects[1]);
            respuesta.setPrecioCadena( objects[0].toString().trim() + ' '  + objects[1].toString().trim());
            respuesta.setIdMoneda( Long.parseLong( objects[2].toString() ) );
        }


        return respuesta;
    }
}
