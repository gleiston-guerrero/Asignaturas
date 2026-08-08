package ec.edu.uteq.facturacion.dto;

import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductoDTO {

    private Long id;

    @NotBlank
    @Size(max = 30)
    private String codigo;

    @NotBlank
    @Size(max = 200)
    private String descripcion;

    @NotNull
    @DecimalMin(value = "0.00")
    private BigDecimal precioUnitario;

    @NotNull
    @Min(0)
    private Integer stock;

    @NotNull
    private Long proveedorId;

    private String proveedorRazonSocial;

    private Boolean activo;
}
