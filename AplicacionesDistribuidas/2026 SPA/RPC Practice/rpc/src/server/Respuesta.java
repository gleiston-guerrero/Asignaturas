package server;

public record Respuesta(Object valor, String error) implements Serializable {
    public static Respuesta ok(Object valor) { return new Respuesta(valor, null); }
    public static Respuesta fallo(String error) { return new Respuesta(null, error); }
    public boolean esError() { return error != null; }
}