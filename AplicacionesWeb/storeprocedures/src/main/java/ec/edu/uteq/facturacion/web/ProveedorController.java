package ec.edu.uteq.facturacion.web;

import ec.edu.uteq.facturacion.dto.ProveedorDTO;
import ec.edu.uteq.facturacion.service.ProveedorService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/proveedores")
@RequiredArgsConstructor
@Tag(name = "Proveedores", description = "CRUD de proveedores (JPA)")
public class ProveedorController {

    private final ProveedorService service;

    @GetMapping
    public Page<ProveedorDTO> listar(Pageable pageable) {
        return service.listar(pageable);
    }

    @GetMapping("/{id}")
    public ProveedorDTO obtener(@PathVariable Long id) {
        return service.buscarPorId(id);
    }

    @PostMapping
    public ResponseEntity<ProveedorDTO> crear(@Valid @RequestBody ProveedorDTO dto) {
        ProveedorDTO creado = service.crear(dto);
        return ResponseEntity.created(URI.create("/api/v1/proveedores/" + creado.getId())).body(creado);
    }

    @PutMapping("/{id}")
    public ProveedorDTO actualizar(@PathVariable Long id, @Valid @RequestBody ProveedorDTO dto) {
        return service.actualizar(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        service.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
