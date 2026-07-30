package ec.edu.uteq.facturacion.exception;

public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String recurso, Object id) {
        super("Recurso no encontrado: " + recurso + " con id " + id);
    }

    public ResourceNotFoundException(String mensaje) {
        super(mensaje);
    }
}
