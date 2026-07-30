package ec.edu.uteq.facturacion.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistrarFacturaResultado {

    private Long facturaId;
    private String numero;
    private BigDecimal total;
}
