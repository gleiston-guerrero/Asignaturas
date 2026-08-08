package ec.edu.uteq.facturacion.web;

import ec.edu.uteq.facturacion.dto.DetalleFacturaDTO;
import ec.edu.uteq.facturacion.service.DetalleFacturaService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/facturas/{facturaId}/detalles")
@RequiredArgsConstructor
@Tag(name = "Detalles de factura", description = "Lectura de detalles asociados a una factura")
public class DetalleFacturaController {

    private final DetalleFacturaService service;

    @GetMapping
    public List<DetalleFacturaDTO> listarPorFactura(@PathVariable Long facturaId) {
        return service.listarPorFactura(facturaId);
    }
}
