package ec.edu.uteq.facturacion.repository;

import ec.edu.uteq.facturacion.domain.DetalleFactura;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DetalleFacturaRepository extends JpaRepository<DetalleFactura, Long> {

    List<DetalleFactura> findByFacturaId(Long facturaId);
}
