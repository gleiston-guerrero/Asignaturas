package ec.edu.uteq.facturacion.repository.procedures;

import ec.edu.uteq.facturacion.dto.FacturaCompletaDTO;
import ec.edu.uteq.facturacion.dto.RegistrarFacturaResultado;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class FacturaProcedureRepository {

    @PersistenceContext
    private EntityManager em;

    /**
     * SP01 - Consulta multi-tabla: devuelve factura + cliente + detalles.
     * Usa refcursor de PostgreSQL mapeado con StoredProcedureQuery.
     */
    @Transactional(readOnly = true)
    public FacturaCompletaDTO obtenerFacturaCompleta(Long facturaId) {
        StoredProcedureQuery query = em.createStoredProcedureQuery("sp_factura_completa")
                .registerStoredProcedureParameter("p_factura_id", Long.class, ParameterMode.IN)
                .setParameter("p_factura_id", facturaId);

        @SuppressWarnings("unchecked")
        List<Object[]> filas = query.getResultList();

        if (filas.isEmpty()) {
            return null;
        }

        Object[] cabecera = filas.get(0);
        FacturaCompletaDTO dto = new FacturaCompletaDTO();
        dto.setFacturaId(((Number) cabecera[0]).longValue());
        dto.setNumero((String) cabecera[1]);
        dto.setFecha(((Date) cabecera[2]).toLocalDate());
        dto.setClienteCedulaRuc((String) cabecera[3]);
        dto.setClienteNombres((String) cabecera[4]);
        dto.setSubtotal((BigDecimal) cabecera[5]);
        dto.setIva((BigDecimal) cabecera[6]);
        dto.setTotal((BigDecimal) cabecera[7]);
        dto.setEstado((String) cabecera[8]);

        List<FacturaCompletaDTO.LineaDetalle> lineas = new ArrayList<>();
        for (Object[] fila : filas) {
            if (fila[9] == null) {
                continue;
            }
            FacturaCompletaDTO.LineaDetalle linea = new FacturaCompletaDTO.LineaDetalle();
            linea.setProductoCodigo((String) fila[9]);
            linea.setProductoDescripcion((String) fila[10]);
            linea.setCantidad(((Number) fila[11]).intValue());
            linea.setPrecioUnitario((BigDecimal) fila[12]);
            linea.setSubtotalLinea((BigDecimal) fila[13]);
            lineas.add(linea);
        }
        dto.setDetalles(lineas);
        return dto;
    }

    /**
     * SP07 - Transaccion compleja: registra factura completa con detalles y
     * actualiza stock. Devuelve el ID, numero generado y total calculado.
     */
    @Transactional
    public RegistrarFacturaResultado registrarFacturaCompleta(Long clienteId, String detallesJson) {
        StoredProcedureQuery query = em.createStoredProcedureQuery("sp_registrar_factura_completa")
                .registerStoredProcedureParameter("p_cliente_id", Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter("p_detalles_json", String.class, ParameterMode.IN)
                .registerStoredProcedureParameter("p_factura_id", Long.class, ParameterMode.OUT)
                .registerStoredProcedureParameter("p_numero", String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter("p_total", BigDecimal.class, ParameterMode.OUT)
                .setParameter("p_cliente_id", clienteId)
                .setParameter("p_detalles_json", detallesJson);

        query.execute();

        RegistrarFacturaResultado resultado = new RegistrarFacturaResultado();
        resultado.setFacturaId(((Number) query.getOutputParameterValue("p_factura_id")).longValue());
        resultado.setNumero((String) query.getOutputParameterValue("p_numero"));
        resultado.setTotal((BigDecimal) query.getOutputParameterValue("p_total"));
        return resultado;
    }
}
