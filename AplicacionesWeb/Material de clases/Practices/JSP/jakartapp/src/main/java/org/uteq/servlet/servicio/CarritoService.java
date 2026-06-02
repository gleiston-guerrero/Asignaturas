package org.uteq.servlet.servicio;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.dao.PedidoDao;
import org.uteq.servlet.dao.ProductoDao;
import org.uteq.servlet.modelo.Pedido;
import org.uteq.servlet.modelo.PedidoDetalle;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Logica del carrito y de las RESERVAS de inventario.
 *  - Agregar/editar reserva unidades (reservado += cant) si hay disponible.
 *  - Al cerrar sesion sin pagar se LIBERAN las reservas pero el carrito se conserva.
 *  - Al continuar se RESTAURAN las reservas, ajustando a la disponibilidad actual.
 */
public class CarritoService {
    private final PedidoDao pedidoDao = new PedidoDao();
    private final ProductoDao productoDao = new ProductoDao();

    public static class Resultado {
        public boolean ok;
        public String mensaje;
        public Resultado(boolean ok, String m) { this.ok = ok; this.mensaje = m; }
    }

    /** Agrega 'cant' unidades de un producto al carrito del cliente. */
    public Resultado agregar(int idCliente, int idProducto, int cant) {
        if (cant <= 0) return new Resultado(false, "Cantidad invalida.");
        Connection c = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            int idPedido = pedidoDao.idCarritoOCrear(c, idCliente);
            if (!productoDao.reservar(c, idProducto, cant)) {
                c.rollback();
                return new Resultado(false, "No hay disponibilidad suficiente del producto.");
            }
            PedidoDetalle linea = pedidoDao.buscarLinea(c, idPedido, idProducto);
            if (linea == null) {
                BigDecimal precio = productoDao.precioActual(c, idProducto);
                pedidoDao.insertarLinea(c, idPedido, idProducto, cant, precio);
            } else {
                pedidoDao.fijarCantidad(c, linea.getId(), linea.getCantidad() + cant);
            }
            c.commit();
            return new Resultado(true, "Producto agregado al carrito.");
        } catch (SQLException e) {
            rollback(c);
            throw new RuntimeException(e);
        } finally { cerrar(c); }
    }

    /** Fija la cantidad de una linea (ajusta la reserva por la diferencia). 0 = eliminar. */
    public Resultado fijarCantidad(int idCliente, int idDetalle, int nueva) {
        Connection c = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            Integer idPedido = pedidoDao.idCarrito(c, idCliente);
            if (idPedido == null) { c.rollback(); return new Resultado(false, "No hay carrito."); }
            PedidoDetalle d = pedidoDao.lineaPorId(c, idDetalle);
            if (d == null || d.getIdPedido() != idPedido) {
                c.rollback(); return new Resultado(false, "Linea no encontrada.");
            }
            if (nueva <= 0) {
                productoDao.liberar(c, d.getIdProducto(), d.getCantidad());
                pedidoDao.eliminarLinea(c, idDetalle);
                c.commit();
                return new Resultado(true, "Producto retirado del carrito.");
            }
            int delta = nueva - d.getCantidad();
            if (delta > 0) {
                if (!productoDao.reservar(c, d.getIdProducto(), delta)) {
                    c.rollback();
                    return new Resultado(false, "No hay disponibilidad para aumentar la cantidad.");
                }
            } else if (delta < 0) {
                productoDao.liberar(c, d.getIdProducto(), -delta);
            }
            pedidoDao.fijarCantidad(c, idDetalle, nueva);
            c.commit();
            return new Resultado(true, "Carrito actualizado.");
        } catch (SQLException e) { rollback(c); throw new RuntimeException(e); }
        finally { cerrar(c); }
    }

    /** Devuelve el carrito (cabecera + detalles) o null si no existe. */
    public Pedido verCarrito(int idCliente) {
        try (Connection c = Db.getConnection()) {
            Integer idPedido = pedidoDao.idCarrito(c, idCliente);
            if (idPedido == null) return null;
            Pedido p = pedidoDao.cabecera(c, idPedido);
            p.setDetalles(pedidoDao.detalles(c, idPedido));
            return p;
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    /** Al cerrar sesion: libera las reservas del carrito pero conserva las lineas. */
    public void liberarReservas(int idCliente) {
        Connection c = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            Integer idPedido = pedidoDao.idCarrito(c, idCliente);
            if (idPedido == null) { c.rollback(); return; }
            Pedido p = pedidoDao.cabecera(c, idPedido);
            if (p.isLiberado()) { c.rollback(); return; }   // ya estaba liberado
            for (PedidoDetalle d : pedidoDao.detalles(c, idPedido)) {
                productoDao.liberar(c, d.getIdProducto(), d.getCantidad());
            }
            pedidoDao.marcarLiberado(c, idPedido, true);
            c.commit();
        } catch (SQLException e) { rollback(c); throw new RuntimeException(e); }
        finally { cerrar(c); }
    }

    /**
     * Al continuar el pedido: re-reserva las lineas segun la disponibilidad actual.
     * Si un producto ya no alcanza, ajusta la cantidad (o retira la linea si llega a 0)
     * y devuelve los avisos para mostrar al cliente. El resto de la lista se conserva.
     */
    public List<String> restaurarReservas(int idCliente) {
        List<String> avisos = new ArrayList<>();
        Connection c = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            Integer idPedido = pedidoDao.idCarrito(c, idCliente);
            if (idPedido == null) { c.rollback(); return avisos; }
            Pedido p = pedidoDao.cabecera(c, idPedido);
            if (!p.isLiberado()) { c.rollback(); return avisos; }   // ya tiene reservas activas
            for (PedidoDetalle d : pedidoDao.detalles(c, idPedido)) {
                var prod = productoDao.buscarPorId(d.getIdProducto());
                int disponible = prod != null ? prod.getDisponible() : 0;
                int aReservar = Math.min(d.getCantidad(), disponible);
                if (aReservar > 0) productoDao.reservar(c, d.getIdProducto(), aReservar);
                if (aReservar < d.getCantidad()) {
                    if (aReservar == 0) {
                        pedidoDao.eliminarLinea(c, d.getId());
                        avisos.add("\"" + d.getProductoNombre() + "\" se retiro: sin existencias.");
                    } else {
                        pedidoDao.fijarCantidad(c, d.getId(), aReservar);
                        avisos.add("\"" + d.getProductoNombre() + "\" se ajusto de "
                                + d.getCantidad() + " a " + aReservar + " por disponibilidad.");
                    }
                }
            }
            pedidoDao.marcarLiberado(c, idPedido, false);
            c.commit();
        } catch (SQLException e) { rollback(c); throw new RuntimeException(e); }
        finally { cerrar(c); }
        return avisos;
    }

    private void rollback(Connection c) { try { if (c != null) c.rollback(); } catch (SQLException ignored) {} }
    private void cerrar(Connection c) { try { if (c != null) c.close(); } catch (SQLException ignored) {} }
}
