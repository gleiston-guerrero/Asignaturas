package ec.edu.uteq.facturacion.web;

import ec.edu.uteq.facturacion.dto.FacturaCompletaDTO;
import ec.edu.uteq.facturacion.dto.FacturaDTO;
import ec.edu.uteq.facturacion.dto.RegistrarFacturaRequest;
import ec.edu.uteq.facturacion.dto.RegistrarFacturaResultado;
import ec.edu.uteq.facturacion.service.FacturaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.net.URI;
import java.time.LocalDate;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/facturas")
@RequiredArgsConstructor
@Tag(name = "Facturas", description = "Facturas (JPA para lectura) + operaciones via SP")
public class FacturaController {

    private final FacturaService service;

    @GetMapping
    public Page<FacturaDTO> listar(Pageable pageable) {
        return service.listar(pageable);
    }

    @GetMapping("/{id}")
    public FacturaDTO obtener(@PathVariable Long id) {
        return service.buscarPorId(id);
    }

    @Operation(summary = "SP01 - Devuelve cabecera + cliente + detalles en una sola llamada via sp_factura_completa")
    @GetMapping("/{id}/completa")
    public FacturaCompletaDTO obtenerCompleta(@PathVariable Long id) {
        return service.obtenerFacturaCompleta(id);
    }

    @Operation(summary = "SP07 - Registra factura completa (cabecera + detalles + actualiza stock) via sp_registrar_factura_completa")
    @PostMapping
    public ResponseEntity<RegistrarFacturaResultado> registrar(@Valid @RequestBody RegistrarFacturaRequest request) {
        RegistrarFacturaResultado resultado = service.registrarFacturaCompleta(request);
        return ResponseEntity
                .created(URI.create("/api/v1/facturas/" + resultado.getFacturaId()))
                .body(resultado);
    }

    @Operation(summary = "FN02 - Total facturado a un cliente en un rango via fn_total_ventas_cliente")
    @GetMapping("/cliente/{clienteId}/total")
    public Map<String, Object> totalVentasCliente(
            @PathVariable Long clienteId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate desde,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate hasta) {
        BigDecimal total = service.totalVentasCliente(clienteId, desde, hasta);
        return Map.of("clienteId", clienteId, "desde", desde, "hasta", hasta, "total", total);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> anular(@PathVariable Long id) {
        service.anular(id);
        return ResponseEntity.noContent().build();
    }
}
