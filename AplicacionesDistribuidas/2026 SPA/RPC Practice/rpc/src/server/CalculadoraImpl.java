package server;

public class CalculadoraImpl implements Calculadora {
    @Override
    public int sumar(int a, int b) {
        return a + b;
    }

    @Override
    public double dividir(double a, double b) {
        if (b == 0) {
            throw new ArithmeticException("division entre cero");
        }
        return a / b;
    }

    @Override
    public String saludar(String nombre) {
        return "Hola, " + nombre + ", te saluda el servidor RPC";
    }
}
