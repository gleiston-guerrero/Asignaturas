package ec.edu.uteq.facturacion.repository;

import ec.edu.uteq.facturacion.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {

    Optional<Producto> findByCodigo(String codigo);

    boolean existsByCodigo(String codigo);

    /**
     * FN05 - Validacion cruzada: verifica si hay stock disponible.
     * Invoca la funcion SQL fn_validar_stock_disponible.
     */
    @Procedure(procedureName = "fn_validar_stock_disponible")
    Boolean validarStockDisponible(
            @Param("p_producto_id") Long productoId,
            @Param("p_cantidad") Integer cantidad
    );

    /**
     * SP04 - Actualizacion masiva: sube precios de todos los productos
     * de un proveedor por un porcentaje.
     */
    @Procedure(procedureName = "sp_actualizar_precios_proveedor")
    Integer actualizarPreciosProveedor(
            @Param("p_proveedor_id") Long proveedorId,
            @Param("p_porcentaje") java.math.BigDecimal porcentaje
    );
}
