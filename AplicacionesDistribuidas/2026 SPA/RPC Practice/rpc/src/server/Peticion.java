package server;

import java.io.Serializable;

public record Peticion(String metodo, Object[] args) implements Serializable {
}
