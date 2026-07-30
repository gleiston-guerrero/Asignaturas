package ec.edu.uteq.facturacion.service;

import ec.edu.uteq.facturacion.domain.Proveedor;
import ec.edu.uteq.facturacion.dto.ProveedorDTO;
import ec.edu.uteq.facturacion.exception.BusinessException;
import ec.edu.uteq.facturacion.exception.ResourceNotFoundException;
import ec.edu.uteq.facturacion.repository.ProveedorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ProveedorService {

    private final ProveedorRepository repo;

    @Transactional(readOnly = true)
    public Page<ProveedorDTO> listar(Pageable pageable) {
        return repo.findAll(pageable).map(this::toDto);
    }

    @Transactional(readOnly = true)
    public ProveedorDTO buscarPorId(Long id) {
        Proveedor p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Proveedor", id));
        return toDto(p);
    }

    @Transactional
    public ProveedorDTO crear(ProveedorDTO dto) {
        if (repo.existsByRuc(dto.getRuc())) {
            throw new BusinessException("Ya existe un proveedor con el RUC " + dto.getRuc());
        }
        Proveedor p = toEntity(dto);
        p.setId(null);
        return toDto(repo.save(p));
    }

    @Transactional
    public ProveedorDTO actualizar(Long id, ProveedorDTO dto) {
        Proveedor p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Proveedor", id));
        p.setRuc(dto.getRuc());
        p.setRazonSocial(dto.getRazonSocial());
        p.setEmail(dto.getEmail());
        p.setTelefono(dto.getTelefono());
        p.setDireccion(dto.getDireccion());
        if (dto.getActivo() != null) {
            p.setActivo(dto.getActivo());
        }
        return toDto(repo.save(p));
    }

    @Transactional
    public void eliminar(Long id) {
        Proveedor p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Proveedor", id));
        p.setActivo(false);
        repo.save(p);
    }

    private ProveedorDTO toDto(Proveedor p) {
        return ProveedorDTO.builder()
                .id(p.getId())
                .ruc(p.getRuc())
                .razonSocial(p.getRazonSocial())
                .email(p.getEmail())
                .telefono(p.getTelefono())
                .direccion(p.getDireccion())
                .activo(p.getActivo())
                .build();
    }

    private Proveedor toEntity(ProveedorDTO dto) {
        return Proveedor.builder()
                .id(dto.getId())
                .ruc(dto.getRuc())
                .razonSocial(dto.getRazonSocial())
                .email(dto.getEmail())
                .telefono(dto.getTelefono())
                .direccion(dto.getDireccion())
                .activo(dto.getActivo() == null ? Boolean.TRUE : dto.getActivo())
                .build();
    }
}
