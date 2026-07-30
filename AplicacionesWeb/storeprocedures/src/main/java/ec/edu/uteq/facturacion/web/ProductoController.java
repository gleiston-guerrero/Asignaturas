package ec.edu.uteq.facturacion.web;

import ec.edu.uteq.facturacion.dto.ProductoDTO;
import ec.edu.uteq.facturacion.service.ProductoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.net.URI;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/productos")
@RequiredArgsConstructor
@Tag(name = "Productos", description = "CRUD de productos (JPA) + operaciones via SP")
public class ProductoController {

    private final ProductoService service;

    @GetMapping
    public Page<ProductoDTO> listar(Pageable pageable) {
        return service.listar(pageable);
    }

    @GetMapping("/{id}")
    public ProductoDTO obtener(@PathVariable Long id) {
        return service.buscarPorId(id);
    }

    @PostMapping
    public ResponseEntity<ProductoDTO> crear(@Valid @RequestBody ProductoDTO dto) {
        ProductoDTO creado = service.crear(dto);
        return ResponseEntity.created(URI.create("/api/v1/productos/" + creado.getId())).body(creado);
    }

    @PutMapping("/{id}")
    public ProductoDTO actualizar(@PathVariable Long id, @Valid @RequestBody ProductoDTO dto) {
        return service.actualizar(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        service.eliminar(id);
        return ResponseEntity.noContent().build();
    }

    // ---------- Operaciones via procedimientos almacenados ----------

    @Operation(summary = "FN05 - Valida stock disponible mediante fn_validar_stock_disponible")
    @GetMapping("/{id}/stock/validar")
    public Map<String, Object> validarStock(@PathVariable Long id, @RequestParam Integer cantidad) {
        boolean disponible = service.validarStock(id, cantidad);
        return Map.of("productoId", id, "cantidad", cantidad, "disponible", disponible);
    }

    @Operation(summary = "SP04 - Actualiza precios de un proveedor por un porcentaje via sp_actualizar_precios_proveedor")
    @PatchMapping("/proveedor/{proveedorId}/precios")
    public Map<String, Object> actualizarPreciosProveedor(
            @PathVariable Long proveedorId,
            @RequestParam BigDecimal porcentaje) {
        int afectados = service.actualizarPreciosProveedor(proveedorId, porcentaje);
        return Map.of("proveedorId", proveedorId, "porcentaje", porcentaje, "productosActualizados", afectados);
    }
}
