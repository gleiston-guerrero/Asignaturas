package server;

// PASO 4. Stub del servidor (skeleton): recibe la peticion ya deserializada,
// identifica el procedimiento, extrae los parametros y llama a la implementacion.
public class ServerStub {
    private final Calculadora impl;

    public ServerStub(Calculadora impl) {
        this.impl = impl;
    }

    public Respuesta despachar(Peticion p) {
        try {
            Object[] a = p.args();
            Object resultado = switch (p.metodo()) {
                case "sumar" -> impl.sumar((Integer) a[0], (Integer) a[1]);
                case "dividir" -> impl.dividir((Double) a[0], (Double) a[1]);
                case "saludar" -> impl.saludar((String) a[0]);
                default -> throw new IllegalArgumentException("procedimiento desconocido: " + p.metodo());
            };
            return Respuesta.ok(resultado);
        } catch (Exception e) {
            return Respuesta.fallo(e.getClass().getSimpleName() + ": " + e.getMessage());
        }
    }
}
