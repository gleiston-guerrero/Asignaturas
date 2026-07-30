package ec.edu.uteq.facturacion.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistrarFacturaRequest {

    @NotNull
    private Long clienteId;

    @NotEmpty
    @Valid
    private List<LineaSolicitud> detalles;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class LineaSolicitud {

        @NotNull
        private Long productoId;

        @NotNull
        @Min(1)
        private Integer cantidad;
    }
}
