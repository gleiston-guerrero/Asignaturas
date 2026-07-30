package ec.edu.uteq.facturacion.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "facturas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedStoredProcedureQuery(
        name = "Factura.registrarCompleta",
        procedureName = "sp_registrar_factura_completa",
        parameters = {
                @StoredProcedureParameter(mode = ParameterMode.IN, name = "p_cliente_id", type = Long.class),
                @StoredProcedureParameter(mode = ParameterMode.IN, name = "p_detalles_json", type = String.class),
                @StoredProcedureParameter(mode = ParameterMode.OUT, name = "p_factura_id", type = Long.class),
                @StoredProcedureParameter(mode = ParameterMode.OUT, name = "p_numero", type = String.class),
                @StoredProcedureParameter(mode = ParameterMode.OUT, name = "p_total", type = BigDecimal.class)
        }
)
public class Factura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(max = 20)
    @Column(nullable = false, unique = true, length = 20)
    private String numero;

    @NotNull
    @Column(nullable = false)
    private LocalDate fecha;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente cliente;

    @NotNull
    @DecimalMin(value = "0.00")
    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal subtotal;

    @NotNull
    @DecimalMin(value = "0.00")
    @Column(nullable = false, precision = 12, scale = 2)
    @Builder.Default
    private BigDecimal iva = BigDecimal.ZERO;

    @NotNull
    @DecimalMin(value = "0.00")
    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal total;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    @Builder.Default
    private EstadoFactura estado = EstadoFactura.EMITIDA;

    @OneToMany(mappedBy = "factura", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Builder.Default
    private List<DetalleFactura> detalles = new ArrayList<>();

    @Column(name = "creado_en", nullable = false, updatable = false)
    private OffsetDateTime creadoEn;

    @PrePersist
    void prePersist() {
        this.creadoEn = OffsetDateTime.now();
        if (this.fecha == null) {
            this.fecha = LocalDate.now();
        }
    }

    public enum EstadoFactura {
        EMITIDA, PAGADA, ANULADA
    }
}
