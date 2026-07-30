package ec.edu.uteq.facturacion.dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FacturaCompletaDTO {

    private Long facturaId;
    private String numero;
    private LocalDate fecha;
    private String clienteCedulaRuc;
    private String clienteNombres;
    private BigDecimal subtotal;
    private BigDecimal iva;
    private BigDecimal total;
    private String estado;
    private List<LineaDetalle> detalles;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class LineaDetalle {
        private String productoCodigo;
        private String productoDescripcion;
        private Integer cantidad;
        private BigDecimal precioUnitario;
        private BigDecimal subtotalLinea;
    }
}
