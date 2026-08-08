package ec.edu.uteq.facturacion.web;

import ec.edu.uteq.facturacion.dto.ReporteVentasProductoDTO;
import ec.edu.uteq.facturacion.service.reports.ReporteService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/v1/reportes")
@RequiredArgsConstructor
@Tag(name = "Reportes", description = "Reportes agregados via procedimientos almacenados")
public class ReporteController {

    private final ReporteService service;

    @Operation(summary = "SP03 - Ventas por producto en un rango de fechas via sp_reporte_ventas_periodo")
    @GetMapping("/ventas/por-periodo")
    public List<ReporteVentasProductoDTO> ventasPorPeriodo(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate desde,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate hasta) {
        return service.ventasPorPeriodo(desde, hasta);
    }
}
