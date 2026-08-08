package ec.edu.uteq.facturacion.service.reports;

import ec.edu.uteq.facturacion.dto.ReporteVentasProductoDTO;
import ec.edu.uteq.facturacion.repository.procedures.ReporteProcedureRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReporteService {

    private final ReporteProcedureRepository reporteRepo;

    /**
     * SP03 - Reporte de ventas por producto en un rango de fechas.
     */
    @Transactional(readOnly = true)
    public List<ReporteVentasProductoDTO> ventasPorPeriodo(LocalDate desde, LocalDate hasta) {
        return reporteRepo.reporteVentasPorPeriodo(desde, hasta);
    }
}
