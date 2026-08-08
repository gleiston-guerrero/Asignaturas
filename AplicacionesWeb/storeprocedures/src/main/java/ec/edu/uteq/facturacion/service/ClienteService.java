package ec.edu.uteq.facturacion.service;

import ec.edu.uteq.facturacion.domain.Cliente;
import ec.edu.uteq.facturacion.dto.ClienteDTO;
import ec.edu.uteq.facturacion.exception.BusinessException;
import ec.edu.uteq.facturacion.exception.ResourceNotFoundException;
import ec.edu.uteq.facturacion.repository.ClienteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ClienteService {

    private final ClienteRepository repo;

    @Transactional(readOnly = true)
    public Page<ClienteDTO> listar(Pageable pageable) {
        return repo.findAll(pageable).map(this::toDto);
    }

    @Transactional(readOnly = true)
    public ClienteDTO buscarPorId(Long id) {
        Cliente c = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cliente", id));
        return toDto(c);
    }

    @Transactional
    public ClienteDTO crear(ClienteDTO dto) {
        if (repo.existsByCedulaRuc(dto.getCedulaRuc())) {
            throw new BusinessException("Ya existe un cliente con la cedula/RUC " + dto.getCedulaRuc());
        }
        Cliente c = toEntity(dto);
        c.setId(null);
        return toDto(repo.save(c));
    }

    @Transactional
    public ClienteDTO actualizar(Long id, ClienteDTO dto) {
        Cliente c = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cliente", id));
        c.setCedulaRuc(dto.getCedulaRuc());
        c.setNombres(dto.getNombres());
        c.setEmail(dto.getEmail());
        c.setTelefono(dto.getTelefono());
        c.setDireccion(dto.getDireccion());
        if (dto.getActivo() != null) {
            c.setActivo(dto.getActivo());
        }
        return toDto(repo.save(c));
    }

    @Transactional
    public void eliminar(Long id) {
        Cliente c = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cliente", id));
        c.setActivo(false);
        repo.save(c);
    }

    private ClienteDTO toDto(Cliente c) {
        return ClienteDTO.builder()
                .id(c.getId())
                .cedulaRuc(c.getCedulaRuc())
                .nombres(c.getNombres())
                .email(c.getEmail())
                .telefono(c.getTelefono())
                .direccion(c.getDireccion())
                .activo(c.getActivo())
                .build();
    }

    private Cliente toEntity(ClienteDTO dto) {
        return Cliente.builder()
                .id(dto.getId())
                .cedulaRuc(dto.getCedulaRuc())
                .nombres(dto.getNombres())
                .email(dto.getEmail())
                .telefono(dto.getTelefono())
                .direccion(dto.getDireccion())
                .activo(dto.getActivo() == null ? Boolean.TRUE : dto.getActivo())
                .build();
    }
}
