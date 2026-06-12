package org.uteq.servlet.servicio;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.dao.PedidoDao;
import org.uteq.servlet.dao.ProductoDao;
import org.uteq.servlet.dao.ProductoDao.AvisoStock;
import org.uteq.servlet.modelo.Pedido;
import org.uteq.servlet.modelo.PedidoDetalle;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Marca una linea como despachada: descuenta el inventario fisico, libera la reserva,
 * cierra el pedido si ya no quedan lineas pendientes y avisa al proveedor si el stock
 * cae bajo el minimo. El correo se envia FUERA de la transaccion.
 */
public class DespachoService {
    private final PedidoDao pedidoDao = new PedidoDao();
    private final ProductoDao productoDao = new ProductoDao();
    private final MailService mailService = new MailService();

    public static class Resultado {
        public boolean ok; public String mensaje;
        public Resultado(boolean ok, String m) { this.ok = ok; this.mensaje = m; }
    }

    public Resultado despacharLinea(int idDetalle, int idDespachador) {
        Connection c = null;
        AvisoStock aviso = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            PedidoDetalle d = pedidoDao.lineaPorId(c, idDetalle);
            if (d == null) { c.rollback(); return new Resultado(false, "Linea inexistente."); }
            Pedido p = pedidoDao.cabecera(c, d.getIdPedido());
            if (p.getIdDespachador() == null || p.getIdDespachador() != idDespachador) {
                c.rollback(); return new Resultado(false, "El pedido no esta asignado a usted.");
            }
            if (!"EN_DESPACHO".equals(p.getEstado())) {
                c.rollback(); return new Resultado(false, "El pedido no esta en despacho.");
            }
            if (d.isDespachado()) { c.rollback(); return new Resultado(false, "La linea ya estaba despachada."); }

            productoDao.despacharFisico(c, d.getIdProducto(), d.getCantidad()); // existencias-- y reservado--
            pedidoDao.marcarLineaDespachada(c, idDetalle);
            aviso = productoDao.avisoSiBajoMinimo(c, d.getIdProducto());          // revisa punto de reorden

            boolean cerrado = false;
            if (pedidoDao.todasDespachadas(c, d.getIdPedido())) {
                pedidoDao.cerrarPedido(c, d.getIdPedido());
                cerrado = true;
            }
            c.commit();

            if (aviso != null) mailService.avisarBajoStock(aviso);  // correo fuera de la transaccion
            String msg = "Producto despachado." + (cerrado ? " Pedido completado." : "");
            if (aviso != null) msg += " Se notifico al proveedor (stock bajo).";
            return new Resultado(true, msg);
        } catch (SQLException e) {
            try { if (c != null) c.rollback(); } catch (SQLException ignored) {}
            throw new RuntimeException(e);
        } finally { try { if (c != null) c.close(); } catch (SQLException ignored) {} }
    }
}
