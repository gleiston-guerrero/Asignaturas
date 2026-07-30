package ec.edu.uteq.facturacion.service;

import ec.edu.uteq.facturacion.domain.DetalleFactura;
import ec.edu.uteq.facturacion.dto.DetalleFacturaDTO;
import ec.edu.uteq.facturacion.repository.DetalleFacturaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DetalleFacturaService {

    private final DetalleFacturaRepository repo;

    @Transactional(readOnly = true)
    public List<DetalleFacturaDTO> listarPorFactura(Long facturaId) {
        return repo.findByFacturaId(facturaId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private DetalleFacturaDTO toDto(DetalleFactura d) {
        return DetalleFacturaDTO.builder()
                .id(d.getId())
                .productoId(d.getProducto().getId())
                .productoCodigo(d.getProducto().getCodigo())
                .productoDescripcion(d.getProducto().getDescripcion())
                .cantidad(d.getCantidad())
                .precioUnitario(d.getPrecioUnitario())
                .subtotal(d.getSubtotal())
                .build();
    }
}
