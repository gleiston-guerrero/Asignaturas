package ec.edu.uteq.facturacion.repository;

import ec.edu.uteq.facturacion.domain.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    Optional<Cliente> findByCedulaRuc(String cedulaRuc);

    boolean existsByCedulaRuc(String cedulaRuc);
}
