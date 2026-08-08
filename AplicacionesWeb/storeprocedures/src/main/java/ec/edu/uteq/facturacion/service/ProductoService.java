package ec.edu.uteq.facturacion.service;

import ec.edu.uteq.facturacion.domain.Producto;
import ec.edu.uteq.facturacion.domain.Proveedor;
import ec.edu.uteq.facturacion.dto.ProductoDTO;
import ec.edu.uteq.facturacion.exception.BusinessException;
import ec.edu.uteq.facturacion.exception.ResourceNotFoundException;
import ec.edu.uteq.facturacion.repository.ProductoRepository;
import ec.edu.uteq.facturacion.repository.ProveedorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
public class ProductoService {

    private final ProductoRepository repo;
    private final ProveedorRepository proveedorRepo;

    @Transactional(readOnly = true)
    public Page<ProductoDTO> listar(Pageable pageable) {
        return repo.findAll(pageable).map(this::toDto);
    }

    @Transactional(readOnly = true)
    public ProductoDTO buscarPorId(Long id) {
        Producto p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto", id));
        return toDto(p);
    }

    @Transactional
    public ProductoDTO crear(ProductoDTO dto) {
        if (repo.existsByCodigo(dto.getCodigo())) {
            throw new BusinessException("Ya existe un producto con el codigo " + dto.getCodigo());
        }
        Proveedor prov = proveedorRepo.findById(dto.getProveedorId())
                .orElseThrow(() -> new ResourceNotFoundException("Proveedor", dto.getProveedorId()));
        Producto p = Producto.builder()
                .codigo(dto.getCodigo())
                .descripcion(dto.getDescripcion())
                .precioUnitario(dto.getPrecioUnitario())
                .stock(dto.getStock())
                .proveedor(prov)
                .activo(dto.getActivo() == null ? Boolean.TRUE : dto.getActivo())
                .build();
        return toDto(repo.save(p));
    }

    @Transactional
    public ProductoDTO actualizar(Long id, ProductoDTO dto) {
        Producto p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto", id));
        Proveedor prov = proveedorRepo.findById(dto.getProveedorId())
                .orElseThrow(() -> new ResourceNotFoundException("Proveedor", dto.getProveedorId()));
        p.setCodigo(dto.getCodigo());
        p.setDescripcion(dto.getDescripcion());
        p.setPrecioUnitario(dto.getPrecioUnitario());
        p.setStock(dto.getStock());
        p.setProveedor(prov);
        if (dto.getActivo() != null) {
            p.setActivo(dto.getActivo());
        }
        return toDto(repo.save(p));
    }

    @Transactional
    public void eliminar(Long id) {
        Producto p = repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto", id));
        p.setActivo(false);
        repo.save(p);
    }

    /**
     * FN05 - Delega en la funcion fn_validar_stock_disponible.
     */
    @Transactional(readOnly = true)
    public boolean validarStock(Long productoId, Integer cantidad) {
        Boolean disponible = repo.validarStockDisponible(productoId, cantidad);
        return Boolean.TRUE.equals(disponible);
    }

    /**
     * SP04 - Delega en el procedimiento sp_actualizar_precios_proveedor.
     * Devuelve el numero de productos actualizados.
     */
    @Transactional
    public int actualizarPreciosProveedor(Long proveedorId, BigDecimal porcentaje) {
        if (!proveedorRepo.existsById(proveedorId)) {
            throw new ResourceNotFoundException("Proveedor", proveedorId);
        }
        Integer afectados = repo.actualizarPreciosProveedor(proveedorId, porcentaje);
        return afectados == null ? 0 : afectados;
    }

    private ProductoDTO toDto(Producto p) {
        return ProductoDTO.builder()
                .id(p.getId())
                .codigo(p.getCodigo())
                .descripcion(p.getDescripcion())
                .precioUnitario(p.getPrecioUnitario())
                .stock(p.getStock())
                .proveedorId(p.getProveedor().getId())
                .proveedorRazonSocial(p.getProveedor().getRazonSocial())
                .activo(p.getActivo())
                .build();
    }
}
