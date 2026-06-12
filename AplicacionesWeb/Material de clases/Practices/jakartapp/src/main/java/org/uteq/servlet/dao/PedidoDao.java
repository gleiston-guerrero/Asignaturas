package org.uteq.servlet.dao;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.modelo.Pedido;
import org.uteq.servlet.modelo.PedidoDetalle;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDao {

    // ---------- Carrito ----------
    public Integer idCarrito(Connection c, int idCliente) throws SQLException {
        String sql = "SELECT id FROM inventario.pedido WHERE id_cliente=? AND estado='CARRITO'";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idCliente);
            try (ResultSet rs = ps.executeQuery()) { return rs.next() ? rs.getInt(1) : null; }
        }
    }

    public int crearCarrito(Connection c, int idCliente) throws SQLException {
        String sql = "INSERT INTO inventario.pedido (id_cliente,estado) VALUES (?,'CARRITO')";
        try (PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, idCliente); ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) { rs.next(); return rs.getInt(1); }
        }
    }

    public int idCarritoOCrear(Connection c, int idCliente) throws SQLException {
        Integer id = idCarrito(c, idCliente);
        return id != null ? id : crearCarrito(c, idCliente);
    }

    // ---------- Detalle ----------
    public PedidoDetalle buscarLinea(Connection c, int idPedido, int idProducto) throws SQLException {
        String sql = "SELECT id,cantidad,precio_unitario,despachado FROM inventario.pedido_detalle " +
                "WHERE id_pedido=? AND id_producto=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idPedido); ps.setInt(2, idProducto);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                PedidoDetalle d = new PedidoDetalle();
                d.setId(rs.getInt("id")); d.setIdPedido(idPedido); d.setIdProducto(idProducto);
                d.setCantidad(rs.getInt("cantidad"));
                d.setPrecioUnitario(rs.getBigDecimal("precio_unitario"));
                d.setDespachado(rs.getBoolean("despachado"));
                return d;
            }
        }
    }

    public void insertarLinea(Connection c, int idPedido, int idProducto, int cant, BigDecimal precio) throws SQLException {
        String sql = "INSERT INTO inventario.pedido_detalle " +
                "(id_pedido,id_producto,cantidad,precio_unitario) VALUES (?,?,?,?)";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idPedido); ps.setInt(2, idProducto); ps.setInt(3, cant); ps.setBigDecimal(4, precio);
            ps.executeUpdate();
        }
    }

    public void fijarCantidad(Connection c, int idDetalle, int cant) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "UPDATE inventario.pedido_detalle SET cantidad=? WHERE id=?")) {
            ps.setInt(1, cant); ps.setInt(2, idDetalle); ps.executeUpdate();
        }
    }

    public void eliminarLinea(Connection c, int idDetalle) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "DELETE FROM inventario.pedido_detalle WHERE id=?")) {
            ps.setInt(1, idDetalle); ps.executeUpdate();
        }
    }

    public List<PedidoDetalle> detalles(Connection c, int idPedido) throws SQLException {
        String sql = "SELECT d.id,d.id_producto,p.nombre,d.cantidad,d.precio_unitario,d.despachado " +
                "FROM inventario.pedido_detalle d JOIN inventario.producto p ON p.id=d.id_producto " +
                "WHERE d.id_pedido=? ORDER BY d.id";
        List<PedidoDetalle> lista = new ArrayList<>();
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idPedido);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PedidoDetalle d = new PedidoDetalle();
                    d.setId(rs.getInt("id")); d.setIdPedido(idPedido);
                    d.setIdProducto(rs.getInt("id_producto"));
                    d.setProductoNombre(rs.getString("nombre"));
                    d.setCantidad(rs.getInt("cantidad"));
                    d.setPrecioUnitario(rs.getBigDecimal("precio_unitario"));
                    d.setDespachado(rs.getBoolean("despachado"));
                    lista.add(d);
                }
            }
        }
        return lista;
    }

    // ---------- Cabecera / estado ----------
    public Pedido cabecera(Connection c, int idPedido) throws SQLException {
        String sql = "SELECT p.id,p.id_cliente,p.id_despachador,p.estado,p.liberado,p.total," +
                "p.creado,p.fecha_pago, cl.nombres||' '||cl.apellidos AS cliente, u.nombre AS despachador " +
                "FROM inventario.pedido p " +
                "JOIN facturacion.cliente cl ON cl.id=p.id_cliente " +
                "LEFT JOIN seguridad.usuario u ON u.id=p.id_despachador WHERE p.id=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idPedido);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? mapCabecera(rs) : null;
            }
        }
    }

    private Pedido mapCabecera(ResultSet rs) throws SQLException {
        Pedido p = new Pedido();
        p.setId(rs.getInt("id"));
        p.setIdCliente(rs.getInt("id_cliente"));
        int dsp = rs.getInt("id_despachador");
        p.setIdDespachador(rs.wasNull() ? null : dsp);
        p.setEstado(rs.getString("estado"));
        p.setLiberado(rs.getBoolean("liberado"));
        p.setTotal(rs.getBigDecimal("total"));
        Timestamp tc = rs.getTimestamp("creado");
        if (tc != null) p.setCreado(tc.toLocalDateTime());
        Timestamp tp = rs.getTimestamp("fecha_pago");
        if (tp != null) p.setFechaPago(tp.toLocalDateTime());
        p.setClienteNombre(rs.getString("cliente"));
        p.setDespachadorNombre(rs.getString("despachador"));
        return p;
    }

    public void marcarLiberado(Connection c, int idPedido, boolean valor) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "UPDATE inventario.pedido SET liberado=? WHERE id=?")) {
            ps.setBoolean(1, valor); ps.setInt(2, idPedido); ps.executeUpdate();
        }
    }

    public void pagarYAsignar(Connection c, int idPedido, Integer idDespachador, BigDecimal total) throws SQLException {
        String sql = "UPDATE inventario.pedido SET estado='EN_DESPACHO', liberado=FALSE, " +
                "id_despachador=?, total=?, fecha_pago=NOW() WHERE id=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            if (idDespachador != null) ps.setInt(1, idDespachador); else ps.setNull(1, Types.INTEGER);
            ps.setBigDecimal(2, total); ps.setInt(3, idPedido); ps.executeUpdate();
        }
    }

    public PedidoDetalle lineaPorId(Connection c, int idDetalle) throws SQLException {
        String sql = "SELECT d.id,d.id_pedido,d.id_producto,p.nombre,d.cantidad," +
                "d.precio_unitario,d.despachado " +
                "FROM inventario.pedido_detalle d JOIN inventario.producto p ON p.id=d.id_producto " +
                "WHERE d.id=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idDetalle);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                PedidoDetalle d = new PedidoDetalle();
                d.setId(rs.getInt("id")); d.setIdPedido(rs.getInt("id_pedido"));
                d.setIdProducto(rs.getInt("id_producto"));
                d.setProductoNombre(rs.getString("nombre"));
                d.setCantidad(rs.getInt("cantidad"));
                d.setPrecioUnitario(rs.getBigDecimal("precio_unitario"));
                d.setDespachado(rs.getBoolean("despachado"));
                return d;
            }
        }
    }

    public void marcarLineaDespachada(Connection c, int idDetalle) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "UPDATE inventario.pedido_detalle SET despachado=TRUE WHERE id=?")) {
            ps.setInt(1, idDetalle); ps.executeUpdate();
        }
    }

    public boolean todasDespachadas(Connection c, int idPedido) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "SELECT COUNT(*) FROM inventario.pedido_detalle WHERE id_pedido=? AND despachado=FALSE")) {
            ps.setInt(1, idPedido);
            try (ResultSet rs = ps.executeQuery()) { rs.next(); return rs.getInt(1) == 0; }
        }
    }

    public void cerrarPedido(Connection c, int idPedido) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(
                "UPDATE inventario.pedido SET estado='DESPACHADO' WHERE id=?")) {
            ps.setInt(1, idPedido); ps.executeUpdate();
        }
    }

    // ---------- Consultas con detalle ----------
    public List<Pedido> listarPorCliente(int idCliente) {
        return listar("p.id_cliente=? ORDER BY p.creado DESC", idCliente);
    }

    public List<Pedido> listarPorDespachador(int idDespachador) {
        return listar("p.id_despachador=? AND p.estado='EN_DESPACHO' ORDER BY p.creado", idDespachador);
    }

    private List<Pedido> listar(String filtro, int idParam) {
        String sql = "SELECT p.id,p.id_cliente,p.id_despachador,p.estado,p.liberado,p.total," +
                "p.creado,p.fecha_pago, cl.nombres||' '||cl.apellidos AS cliente, u.nombre AS despachador " +
                "FROM inventario.pedido p " +
                "JOIN facturacion.cliente cl ON cl.id=p.id_cliente " +
                "LEFT JOIN seguridad.usuario u ON u.id=p.id_despachador WHERE " + filtro;
        List<Pedido> lista = new ArrayList<>();
        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idParam);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) lista.add(mapCabecera(rs));
            }
            for (Pedido p : lista) p.setDetalles(detalles(c, p.getId()));
        } catch (SQLException e) { throw new RuntimeException(e); }
        return lista;
    }
}
