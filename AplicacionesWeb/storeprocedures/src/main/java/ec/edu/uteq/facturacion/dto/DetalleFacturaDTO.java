package ec.edu.uteq.facturacion.dto;

import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DetalleFacturaDTO {

    private Long id;

    @NotNull
    private Long productoId;

    private String productoCodigo;

    private String productoDescripcion;

    @NotNull
    @Min(1)
    private Integer cantidad;

    private BigDecimal precioUnitario;

    private BigDecimal subtotal;
}
