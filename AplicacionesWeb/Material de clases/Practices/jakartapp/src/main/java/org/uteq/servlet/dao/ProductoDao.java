package org.uteq.servlet.dao;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.modelo.Producto;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {

    private Producto mapear(ResultSet rs) throws SQLException {
        Producto p = new Producto();
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setExistencias(rs.getInt("existencias"));
        p.setExistenciasMinimas(rs.getInt("existencias_minimas"));
        p.setReservado(rs.getInt("reservado"));
        p.setDisponible(rs.getInt("disponible"));
        BigDecimal precio = rs.getBigDecimal("precio_actual");
        p.setPrecioActual(precio != null ? precio : BigDecimal.ZERO);
        return p;
    }

    public List<Producto> listarDisponibles() {
        String sql = "SELECT * FROM inventario.v_producto_disponible WHERE activo=TRUE ORDER BY nombre";
        List<Producto> lista = new ArrayList<>();
        try (Connection c = Db.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) lista.add(mapear(rs));
        } catch (SQLException e) { throw new RuntimeException(e); }
        return lista;
    }

    public Producto buscarPorId(int id) {
        String sql = "SELECT * FROM inventario.v_producto_disponible WHERE id=?";
        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? mapear(rs) : null;
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    public BigDecimal precioActual(Connection c, int idProducto) throws SQLException {
        String sql = "SELECT valor FROM inventario.precio WHERE id_producto=? AND activo=TRUE " +
                "ORDER BY vigente_desde DESC LIMIT 1";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idProducto);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getBigDecimal(1) : BigDecimal.ZERO;
            }
        }
    }

    /** Reserva 'cant' unidades solo si hay disponible suficiente. Devuelve true si reservo. */
    public boolean reservar(Connection c, int idProducto, int cant) throws SQLException {
        String sql = "UPDATE inventario.producto SET reservado = reservado + ? " +
                "WHERE id=? AND (existencias - reservado) >= ?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, cant); ps.setInt(2, idProducto); ps.setInt(3, cant);
            return ps.executeUpdate() == 1;
        }
    }

    /** Devuelve 'cant' unidades reservadas al disponible (sin tocar existencias fisicas). */
    public void liberar(Connection c, int idProducto, int cant) throws SQLException {
        String sql = "UPDATE inventario.producto SET reservado = GREATEST(reservado - ?,0) WHERE id=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, cant); ps.setInt(2, idProducto); ps.executeUpdate();
        }
    }

    /** Al despachar: baja existencias fisicas y libera la reserva de esas unidades. */
    public void despacharFisico(Connection c, int idProducto, int cant) throws SQLException {
        String sql = "UPDATE inventario.producto " +
                "SET existencias = existencias - ?, reservado = GREATEST(reservado - ?,0) WHERE id=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, cant); ps.setInt(2, cant); ps.setInt(3, idProducto); ps.executeUpdate();
        }
    }

    /** Datos para el aviso al proveedor cuando existencias < minimo; null si no esta bajo minimo. */
    public AvisoStock avisoSiBajoMinimo(Connection c, int idProducto) throws SQLException {
        String sql = "SELECT p.nombre, p.existencias, p.existencias_minimas, " +
                "pr.nombre AS proveedor, pr.email AS proveedor_email " +
                "FROM inventario.producto p JOIN inventario.proveedor pr ON pr.id=p.id_proveedor " +
                "WHERE p.id=? AND p.existencias < p.existencias_minimas";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idProducto);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                AvisoStock a = new AvisoStock();
                a.producto = rs.getString("nombre");
                a.existencias = rs.getInt("existencias");
                a.minimo = rs.getInt("existencias_minimas");
                a.proveedor = rs.getString("proveedor");
                a.proveedorEmail = rs.getString("proveedor_email");
                return a;
            }
        }
    }

    public static class AvisoStock {
        public String producto, proveedor, proveedorEmail;
        public int existencias, minimo;
    }
}
