package ec.edu.uteq.facturacion.repository;

import ec.edu.uteq.facturacion.domain.Factura;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface FacturaRepository extends JpaRepository<Factura, Long> {

    Optional<Factura> findByNumero(String numero);

    /**
     * FN06 - Generacion de codigo secuencial: obtiene el siguiente
     * numero correlativo para factura.
     */
    @Procedure(procedureName = "fn_generar_codigo_factura")
    String generarCodigoFactura();

    /**
     * FN02 - Calculo agregado: total facturado a un cliente en un rango.
     */
    @Procedure(procedureName = "fn_total_ventas_cliente")
    BigDecimal totalVentasCliente(
            @Param("p_cliente_id") Long clienteId,
            @Param("p_desde") LocalDate desde,
            @Param("p_hasta") LocalDate hasta
    );
}
