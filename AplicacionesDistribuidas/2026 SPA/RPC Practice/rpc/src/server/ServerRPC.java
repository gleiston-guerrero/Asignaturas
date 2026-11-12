package server;

import java.io.EOFException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerRPC {
    public static void main(String[] args) throws Exception {
        int puerto = args.length > 0 ? Integer.parseInt(args[0]) : 5000;
        ServerStub stub = new ServerStub( new CalculadoraImpl());

        try (ServerSocket servidor = new ServerSocket(puerto)) {
            System.out.println("[Servidor] Escuchando en el puerto " + puerto);
            while (true) {
                Socket cliente = servidor.accept();
                new Thread(() -> atender(cliente, stub)).start();
            }
        }
    }

    private static void atender(Socket socket, ServerStub stub) {
        String quien = socket.getRemoteSocketAddress().toString();
        System.out.println("[Servidor] Cliente conectado: " + quien);
        try (socket;
             ObjectOutputStream salida = new ObjectOutputStream(socket.getOutputStream());
             ObjectInputStream entrada = new ObjectInputStream(socket.getInputStream())
        ) {
            while (true) {
                Peticion p = (Peticion) entrada.readObject(); // unmarshalling
                System.out.println("[Servidor] Peticion " + p.metodo() + " de " + quien);
                Respuesta r = stub.despachar(p);
                salida.writeObject(r); // marshalling
                // salida.flush();
            }
        } catch (EOFException fin) {
            System.out.println("[Servidor] Cliente desconectado: " + quien);
        } catch (Exception e) {
            System.out.println("[Servidor] Error con " + quien + ": " + e);
        }
    }
}

