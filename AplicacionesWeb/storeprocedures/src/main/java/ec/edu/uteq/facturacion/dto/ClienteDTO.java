package ec.edu.uteq.facturacion.dto;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClienteDTO {

    private Long id;

    @NotBlank
    @Size(max = 13)
    private String cedulaRuc;

    @NotBlank
    @Size(max = 150)
    private String nombres;

    @Email
    @Size(max = 180)
    private String email;

    @Size(max = 20)
    private String telefono;

    @Size(max = 250)
    private String direccion;

    private Boolean activo;
}
