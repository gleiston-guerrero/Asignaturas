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
public class FacturaDTO {

    private Long id;
    private String numero;
    private LocalDate fecha;
    private Long clienteId;
    private String clienteNombres;
    private BigDecimal subtotal;
    private BigDecimal iva;
    private BigDecimal total;
    private String estado;
    private List<DetalleFacturaDTO> detalles;
}
