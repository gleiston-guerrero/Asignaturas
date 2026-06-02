package org.uteq.servlet.servicio;

import org.uteq.servlet.config.Config;
import org.uteq.servlet.config.Db;
import org.uteq.servlet.dao.FacturaDao;
import org.uteq.servlet.dao.PedidoDao;
import org.uteq.servlet.dao.UsuarioDao;
import org.uteq.servlet.modelo.Pedido;
import org.uteq.servlet.modelo.PedidoDetalle;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Procesa el pago del carrito:
 *  1) genera la factura,
 *  2) asigna el pedido al despachador con menor carga (equilibrio por NUMERO DE PRODUCTOS),
 *  3) lo deja EN_DESPACHO. Las unidades siguen RESERVADAS hasta que se despachen.
 */
public class FacturacionService {
    private final PedidoDao pedidoDao = new PedidoDao();
    private final UsuarioDao usuarioDao = new UsuarioDao();
    private final FacturaDao facturaDao = new FacturaDao();

    public static class Resultado {
        public boolean ok; public String mensaje; public Integer idFactura;
        public Resultado(boolean ok, String m) { this.ok = ok; this.mensaje = m; }
    }

    public Resultado pagar(int idCliente) {
        double iva = Config.getDouble("factura.iva", 0.15);
        Connection c = null;
        try {
            c = Db.getConnection();
            c.setAutoCommit(false);
            Integer idPedido = pedidoDao.idCarrito(c, idCliente);
            if (idPedido == null) { c.rollback(); return new Resultado(false, "No tiene un carrito activo."); }

            Pedido pedido = pedidoDao.cabecera(c, idPedido);
            pedido.setDetalles(pedidoDao.detalles(c, idPedido));
            if (pedido.isVacio()) { c.rollback(); return new Resultado(false, "El carrito esta vacio."); }
            if (pedido.isLiberado()) {
                c.rollback();
                return new Resultado(false, "Reactive el pedido (continuar) antes de pagar.");
            }

            BigDecimal subtotal = BigDecimal.ZERO;
            for (PedidoDetalle d : pedido.getDetalles()) subtotal = subtotal.add(d.getSubtotal());
            BigDecimal total = subtotal.add(subtotal.multiply(BigDecimal.valueOf(iva)))
                                       .setScale(2, RoundingMode.HALF_UP);

            int idFactura = facturaDao.crear(c, pedido, iva);
            Integer despachador = usuarioDao.despachadorMenosCargado(c);   // equilibrio por productos
            pedidoDao.pagarYAsignar(c, idPedido, despachador, total);

            c.commit();
            Resultado r = new Resultado(true,
                    "Pago realizado. Factura FAC-" + String.format("%06d", idPedido) +
                    (despachador != null ? " asignada para despacho." : " (sin despachador disponible)."));
            r.idFactura = idFactura;
            return r;
        } catch (SQLException e) {
            try { if (c != null) c.rollback(); } catch (SQLException ignored) {}
            throw new RuntimeException(e);
        } finally { try { if (c != null) c.close(); } catch (SQLException ignored) {} }
    }
}
