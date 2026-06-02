package org.uteq.servlet.dao;

import org.uteq.servlet.modelo.Pedido;
import org.uteq.servlet.modelo.PedidoDetalle;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;

public class FacturaDao {

    /** Crea la factura (cabecera + detalle) a partir de un pedido pagado. */
    public int crear(Connection c, Pedido pedido, double tasaIva) throws SQLException {
        BigDecimal subtotal = BigDecimal.ZERO;
        for (PedidoDetalle d : pedido.getDetalles()) subtotal = subtotal.add(d.getSubtotal());
        BigDecimal iva = subtotal.multiply(BigDecimal.valueOf(tasaIva)).setScale(2, RoundingMode.HALF_UP);
        BigDecimal total = subtotal.add(iva).setScale(2, RoundingMode.HALF_UP);
        String numero = "FAC-" + String.format("%06d", pedido.getId());

        String sqlF = "INSERT INTO facturacion.factura " +
                "(id_pedido,id_cliente,numero,subtotal,iva,total) VALUES (?,?,?,?,?,?)";
        int idFactura;
        try (PreparedStatement ps = c.prepareStatement(sqlF, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, pedido.getId());
            ps.setInt(2, pedido.getIdCliente());
            ps.setString(3, numero);
            ps.setBigDecimal(4, subtotal.setScale(2, RoundingMode.HALF_UP));
            ps.setBigDecimal(5, iva);
            ps.setBigDecimal(6, total);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) { rs.next(); idFactura = rs.getInt(1); }
        }
        String sqlD = "INSERT INTO facturacion.factura_detalle " +
                "(id_factura,id_producto,descripcion,cantidad,precio_unitario,subtotal) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement ps = c.prepareStatement(sqlD)) {
            for (PedidoDetalle d : pedido.getDetalles()) {
                ps.setInt(1, idFactura);
                ps.setInt(2, d.getIdProducto());
                ps.setString(3, d.getProductoNombre());
                ps.setInt(4, d.getCantidad());
                ps.setBigDecimal(5, d.getPrecioUnitario());
                ps.setBigDecimal(6, d.getSubtotal());
                ps.addBatch();
            }
            ps.executeBatch();
        }
        return idFactura;
    }
}
