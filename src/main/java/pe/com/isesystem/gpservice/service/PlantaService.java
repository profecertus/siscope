package pe.com.isesystem.gpservice.service;

import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.*;
import pe.com.isesystem.gpservice.model.*;
import pe.com.isesystem.gpservice.repository.PlantaRepository;
import pe.com.isesystem.gpservice.repository.RelPlantaClienteRepository;
import pe.com.isesystem.gpservice.repository.RelPlantaDestinoRepository;
import pe.com.isesystem.gpservice.repository.RelPlantaProveedorRepository;
import pe.com.isesystem.gpservice.response.ResPlantaWithDestino;


import java.util.ArrayList;
import java.util.List;

@Service
public class PlantaService {
    private final PlantaRepository plantaRepository;
    private final ModelMapper modelMapper;
    private final RelPlantaDestinoRepository relPlantaDestinoRepository;
    private final RelPlantaProveedorRepository relPlantaProveedorRepository;
    private final RelPlantaClienteRepository relPlantaClienteRepository;

    public PlantaService(PlantaRepository plantaRepository, ModelMapper modelMapper,
                         RelPlantaDestinoRepository relPlantaDestinoRepository,
                         RelPlantaProveedorRepository relPlantaProveedorRepository,
                         RelPlantaClienteRepository relPlantaClienteRepository){
        this.plantaRepository = plantaRepository;
        this.modelMapper = modelMapper;
        this.relPlantaDestinoRepository = relPlantaDestinoRepository;
        this.relPlantaProveedorRepository = relPlantaProveedorRepository;
        this.relPlantaClienteRepository = relPlantaClienteRepository;
    }

    public PlantaDto mapPlantotoPlantaDto(Planta planta) {
        return this.modelMapper.map(planta, PlantaDto.class);
    }

    @Transactional
    public String savePlanta(ResPlantaWithDestino resPlantaWithDestino){
        Planta planta = this.modelMapper.map(resPlantaWithDestino.getPlantaDto(), Planta.class);
        Planta psave = this.plantaRepository.save(planta);
        Long idPlanta = psave.getId();
        //Antes de esto todos los destino original de la planta
        this.relPlantaDestinoRepository.deleteAllById_IdPlanta(idPlanta);
        //Ahora valido que se grabe la Relación con el destino
        for(DestinoDto destinoDto : resPlantaWithDestino.getRelPlantaDestinoDto()){
            Destino destino = this.modelMapper.map(destinoDto, Destino.class);
            this.relPlantaDestinoRepository.grabarRelPlantaDestino(idPlanta,destino.getId());
        }
        return idPlanta.toString();
    }
    public Page<ResPlantaWithDestino> getAllPlanta(Pageable pageable) {
        List<ResPlantaWithDestino> retorno = new ArrayList<>();

        Page<Planta> p = plantaRepository.findAllByEstadoRegOrderById(pageable, true);

        List<PlantaDto> contentPlantaDto = p.getContent().stream()
                .map(this::mapPlantotoPlantaDto)
                .toList();

        for(PlantaDto planta:contentPlantaDto){
            //Para cada planta busco su destino
            List<RelPlantaDestino> rel = relPlantaDestinoRepository.findAllByIdPlanta(this.modelMapper.map(planta, Planta.class));
            List<DestinoDto> lista = new ArrayList<>();
            if(!rel.isEmpty()){
                for(RelPlantaDestino rela:rel){
                    RelPlantaDestinoDto rpdto = this.modelMapper.map(rela, RelPlantaDestinoDto.class);
                    lista.add(rpdto.getIdDestino());
                }
            }
            //Ahora busco los proveedores asociados a cada planta
            List<RelPlantaProveedorDto> relPlantaProveedorDtoList =
                    this.relPlantaProveedorRepository.
                            findAllByIdPlanta_Id(planta.getIdPlanta()).
                            stream().map((element) -> modelMapper.map(element, RelPlantaProveedorDto.class)
                            ).toList();
            //Ahora busco a los clientes asociados a la planta
            List<ClienteDto> relClienteDtoList =
                    this.relPlantaClienteRepository.
                            findAllById_IdPlanta(planta.getIdPlanta()).
                            stream().map((element) -> modelMapper.map(element, ClienteDto.class)).
                            toList();

            //Los encapsulo en la respuesta
            retorno.add(new ResPlantaWithDestino(
                    this.modelMapper.map(planta, PlantaDto.class),
                    lista, relPlantaProveedorDtoList, relClienteDtoList));
        }
        //Retorno el objeto creado
        return new PageImpl<>(retorno, p.getPageable(), p.getTotalElements());
    }

    public ResPlantaWithDestino getPlanta(Long idPlanta) {

        Planta p = plantaRepository.findAllById(idPlanta);

        PlantaDto plantaDto = modelMapper.map(p, PlantaDto.class);

        List<RelPlantaDestino> rel = relPlantaDestinoRepository.findAllByIdPlanta(p);
        List<DestinoDto> lista = new ArrayList<>();
        if(!rel.isEmpty()){
            for(RelPlantaDestino rela:rel){
                RelPlantaDestinoDto rpdto = this.modelMapper.map(rela, RelPlantaDestinoDto.class);
                lista.add(rpdto.getIdDestino());
            }
        }
        //Ahora busco los proveedores asociados a cada planta
        List<RelPlantaProveedorDto> relPlantaProveedorDtoList =
            this.relPlantaProveedorRepository.
            findAllByIdPlanta_Id(plantaDto.getIdPlanta()).
            stream().map((element) -> modelMapper.map(element, RelPlantaProveedorDto.class)
            ).toList();
        ResPlantaWithDestino retorno = new ResPlantaWithDestino();
        retorno.setPlantaDto(plantaDto);
        retorno.setRelPlantaDestinoDto(lista);
        retorno.setRelPlantaProveedorDtoList(relPlantaProveedorDtoList);
        //Retorno el objeto creado
        return retorno;
    }
}
