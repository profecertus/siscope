package pe.com.isesystem.gpservice.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import pe.com.isesystem.gpservice.dto.ClienteDto;
import pe.com.isesystem.gpservice.model.Cliente;
import pe.com.isesystem.gpservice.repository.ClienteRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClienteService {
    ClienteRepository clienteRepository;
    ModelMapper  modelMapper;

    public ClienteService(ClienteRepository clienteRepository, ModelMapper modelMapper){
        this.clienteRepository = clienteRepository;
        this.modelMapper = modelMapper;
    }

    public ClienteDto mapClientetoClienteDto(Cliente cliente) {
        ClienteDto clienteDto = this.modelMapper.map(cliente, ClienteDto.class);
        return clienteDto;
    }

    public List<ClienteDto> getAllCliente(){
        List<ClienteDto> listClienteDto =  clienteRepository.findAll().
                stream().map(this::mapClientetoClienteDto)
                .collect(Collectors.toList());

        return listClienteDto;
    }

    public List<ClienteDto> saveCliente(ClienteDto clienteDto){
        Cliente cliente = modelMapper.map(clienteDto, Cliente.class);
        Cliente client = clienteRepository.save(cliente);
        List<ClienteDto> clienteDtos = getAllCliente();
        return clienteDtos;
    }

}
