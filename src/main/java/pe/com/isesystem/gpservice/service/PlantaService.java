package pe.com.isesystem.gpservice.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.DestinoDto;
import pe.com.isesystem.gpservice.dto.PlantaDto;
import pe.com.isesystem.gpservice.dto.RelPlantaDestinoDto;
import pe.com.isesystem.gpservice.model.*;
import pe.com.isesystem.gpservice.repository.DestinoRepository;
import pe.com.isesystem.gpservice.repository.PlantaRepository;
import pe.com.isesystem.gpservice.repository.RelPlantaDestinoRepository;
import pe.com.isesystem.gpservice.response.ResPlantaWithDestino;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PlantaService {
    private PlantaRepository plantaRepository;
    private ModelMapper modelMapper;
    private RelPlantaDestinoRepository relPlantaDestinoRepository;
    private DestinoRepository destinoRepository;

    public PlantaService(PlantaRepository plantaRepository, ModelMapper modelMapper,
                         RelPlantaDestinoRepository relPlantaDestinoRepository, DestinoRepository destinoRepository){
        this.plantaRepository = plantaRepository;
        this.modelMapper = modelMapper;
        this.relPlantaDestinoRepository = relPlantaDestinoRepository;
        this.destinoRepository = destinoRepository;
    }

    public PlantaDto mapPlantotoPlantaDto(Planta planta) {
        PlantaDto plantaDto = this.modelMapper.map(planta, PlantaDto.class);
        return plantaDto;
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

        Page<Planta> p = plantaRepository.findAllByEstadoAndEstadoReg(pageable, true, true);

        List<PlantaDto> contentPlantaDto = p.getContent().stream()
                .map(this::mapPlantotoPlantaDto)
                .collect(Collectors.toList());

        ObjectMapper objectMapper = new ObjectMapper();
        for(PlantaDto planta:contentPlantaDto){

            List<RelPlantaDestino> rel = relPlantaDestinoRepository.findAllByIdPlanta(this.modelMapper.map(planta, Planta.class));
            List<DestinoDto> lista = new ArrayList<>();
            if(!rel.isEmpty()){
                for(RelPlantaDestino rela:rel){
                        RelPlantaDestinoDto rpdto = this.modelMapper.map(rela, RelPlantaDestinoDto.class);
                        lista.add(rpdto.getIdDestino());
                }
            }
            retorno.add(new ResPlantaWithDestino(this.modelMapper.map(planta, PlantaDto.class), lista ));
        }
        return new PageImpl<>(retorno, p.getPageable(), p.getTotalElements());
    }
}
