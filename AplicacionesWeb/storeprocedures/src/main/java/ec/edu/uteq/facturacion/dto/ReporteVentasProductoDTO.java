package ec.edu.uteq.facturacion.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReporteVentasProductoDTO {

    private Long productoId;
    private String codigo;
    private String descripcion;
    private Integer unidadesVendidas;
    private BigDecimal totalFacturado;
}
