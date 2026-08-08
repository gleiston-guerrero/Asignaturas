package ec.edu.uteq.facturacion.dto;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProveedorDTO {

    private Long id;

    @NotBlank
    @Size(max = 13)
    private String ruc;

    @NotBlank
    @Size(max = 180)
    private String razonSocial;

    @Email
    @Size(max = 180)
    private String email;

    @Size(max = 20)
    private String telefono;

    @Size(max = 250)
    private String direccion;

    private Boolean activo;
}
