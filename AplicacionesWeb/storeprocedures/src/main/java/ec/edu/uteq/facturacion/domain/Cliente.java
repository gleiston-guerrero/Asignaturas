package ec.edu.uteq.facturacion.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.time.OffsetDateTime;

@Entity
@Table(name = "clientes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(max = 13)
    @Column(nullable = false, unique = true, length = 13)
    private String cedulaRuc;

    @NotBlank
    @Size(max = 150)
    @Column(nullable = false, length = 150)
    private String nombres;

    @Email
    @Size(max = 180)
    @Column(length = 180)
    private String email;

    @Size(max = 20)
    @Column(length = 20)
    private String telefono;

    @Size(max = 250)
    @Column(length = 250)
    private String direccion;

    @Column(nullable = false)
    @Builder.Default
    private Boolean activo = Boolean.TRUE;

    @Column(name = "creado_en", nullable = false, updatable = false)
    private OffsetDateTime creadoEn;

    @Column(name = "actualizado_en")
    private OffsetDateTime actualizadoEn;

    @PrePersist
    void prePersist() {
        this.creadoEn = OffsetDateTime.now();
    }

    @PreUpdate
    void preUpdate() {
        this.actualizadoEn = OffsetDateTime.now();
    }
}
