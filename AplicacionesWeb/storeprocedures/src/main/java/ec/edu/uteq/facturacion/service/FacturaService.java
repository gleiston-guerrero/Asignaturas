package ec.edu.uteq.facturacion.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import ec.edu.uteq.facturacion.domain.Factura;
import ec.edu.uteq.facturacion.dto.*;
import ec.edu.uteq.facturacion.exception.BusinessException;
import ec.edu.uteq.facturacion.exception.ResourceNotFoundException;
import ec.edu.uteq.facturacion.repository.FacturaRepository;
import ec.edu.uteq.facturacion.repository.procedures.FacturaProcedureRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FacturaService {

    private final FacturaRepository facturaRepo;
    private final FacturaProcedureRepository facturaProcRepo;
    private final ObjectMapper objectMapper;

    @Transactional(readOnly = true)
    public Page<FacturaDTO> listar(Pageable pageable) {
        return facturaRepo.findAll(pageable).map(this::toDto);
    }

    @Transactional(readOnly = true)
    public FacturaDTO buscarPorId(Long id) {
        Factura f = facturaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Factura", id));
        return toDto(f);
    }

    /**
     * SP01 - Devuelve la factura completa (cabecera + detalles + cliente) en
     * un solo viaje al motor mediante el procedimiento sp_factura_completa.
     */
    @Transactional(readOnly = true)
    public FacturaCompletaDTO obtenerFacturaCompleta(Long id) {
        FacturaCompletaDTO dto = facturaProcRepo.obtenerFacturaCompleta(id);
        if (dto == null) {
            throw new ResourceNotFoundException("Factura", id);
        }
        return dto;
    }

    /**
     * SP07 - Registra factura completa dentro de la transaccion de la BD:
     * inserta cabecera, detalles, actualiza stock y genera numero correlativo.
     */
    @Transactional
    public RegistrarFacturaResultado registrarFacturaCompleta(RegistrarFacturaRequest request) {
        String json;
        try {
            json = objectMapper.writeValueAsString(request.getDetalles());
        } catch (JsonProcessingException e) {
            throw new BusinessException("No se pudo serializar el detalle de la factura: " + e.getMessage());
        }
        return facturaProcRepo.registrarFacturaCompleta(request.getClienteId(), json);
    }

    /**
     * FN02 - Total facturado a un cliente en un rango de fechas.
     */
    @Transactional(readOnly = true)
    public BigDecimal totalVentasCliente(Long clienteId, LocalDate desde, LocalDate hasta) {
        BigDecimal total = facturaRepo.totalVentasCliente(clienteId, desde, hasta);
        return total == null ? BigDecimal.ZERO : total;
    }

    @Transactional
    public void anular(Long id) {
        Factura f = facturaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Factura", id));
        if (f.getEstado() == Factura.EstadoFactura.ANULADA) {
            throw new BusinessException("La factura ya se encuentra anulada");
        }
        f.setEstado(Factura.EstadoFactura.ANULADA);
        facturaRepo.save(f);
    }

    private FacturaDTO toDto(Factura f) {
        List<DetalleFacturaDTO> lineas = f.getDetalles().stream()
                .map(d -> DetalleFacturaDTO.builder()
                        .id(d.getId())
                        .productoId(d.getProducto().getId())
                        .productoCodigo(d.getProducto().getCodigo())
                        .productoDescripcion(d.getProducto().getDescripcion())
                        .cantidad(d.getCantidad())
                        .precioUnitario(d.getPrecioUnitario())
                        .subtotal(d.getSubtotal())
                        .build())
                .collect(Collectors.toList());
        return FacturaDTO.builder()
                .id(f.getId())
                .numero(f.getNumero())
                .fecha(f.getFecha())
                .clienteId(f.getCliente().getId())
                .clienteNombres(f.getCliente().getNombres())
                .subtotal(f.getSubtotal())
                .iva(f.getIva())
                .total(f.getTotal())
                .estado(f.getEstado().name())
                .detalles(lineas)
                .build();
    }
}
