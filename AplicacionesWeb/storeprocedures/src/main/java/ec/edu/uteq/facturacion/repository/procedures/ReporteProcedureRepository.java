package ec.edu.uteq.facturacion.repository.procedures;

import ec.edu.uteq.facturacion.dto.ReporteVentasProductoDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ReporteProcedureRepository {

    @PersistenceContext
    private EntityManager em;

    /**
     * SP03 - Reporte: ventas agrupadas por producto en un periodo.
     */
    @Transactional(readOnly = true)
    public List<ReporteVentasProductoDTO> reporteVentasPorPeriodo(LocalDate desde, LocalDate hasta) {
        StoredProcedureQuery query = em.createStoredProcedureQuery("sp_reporte_ventas_periodo")
                .registerStoredProcedureParameter("p_desde", java.sql.Date.class, ParameterMode.IN)
                .registerStoredProcedureParameter("p_hasta", java.sql.Date.class, ParameterMode.IN)
                .setParameter("p_desde", java.sql.Date.valueOf(desde))
                .setParameter("p_hasta", java.sql.Date.valueOf(hasta));

        @SuppressWarnings("unchecked")
        List<Object[]> filas = query.getResultList();

        List<ReporteVentasProductoDTO> reporte = new ArrayList<>();
        for (Object[] fila : filas) {
            ReporteVentasProductoDTO dto = new ReporteVentasProductoDTO();
            dto.setProductoId(((Number) fila[0]).longValue());
            dto.setCodigo((String) fila[1]);
            dto.setDescripcion((String) fila[2]);
            dto.setUnidadesVendidas(((Number) fila[3]).intValue());
            dto.setTotalFacturado((BigDecimal) fila[4]);
            reporte.add(dto);
        }
        return reporte;
    }
}
