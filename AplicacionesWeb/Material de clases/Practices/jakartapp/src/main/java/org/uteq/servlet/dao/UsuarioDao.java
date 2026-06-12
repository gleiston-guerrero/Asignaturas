package org.uteq.servlet.dao;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.util.Passwords;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    /** Autentica y devuelve el usuario con sus roles e id de cliente, o null. */
    public Usuario autenticar(String username, String password) {
        String sql = "SELECT id,username,nombre,email,password_hash " +
                "FROM seguridad.usuario WHERE username=? AND activo=TRUE";
        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                if (!Passwords.verificar(password, rs.getString("password_hash"))) return null;
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setRoles(rolesDe(c, u.getId()));
                u.setIdCliente(idClienteDe(c, u.getId()));
                return u;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error autenticando", e);
        }
    }

    private List<String> rolesDe(Connection c, int idUsuario) throws SQLException {
        String sql = "SELECT r.nombre FROM seguridad.rol r " +
                "JOIN seguridad.usuario_rol ur ON ur.id_rol = r.id WHERE ur.id_usuario=?";
        List<String> roles = new ArrayList<>();
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) roles.add(rs.getString(1));
            }
        }
        return roles;
    }

    private Integer idClienteDe(Connection c, int idUsuario) throws SQLException {
        String sql = "SELECT id FROM facturacion.cliente WHERE id_usuario=?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt(1) : null;
            }
        }
    }

    /**
     * Despachador con MENOR carga, medida por numero de PRODUCTOS (suma de cantidades)
     * de las lineas aun no despachadas de sus pedidos EN_DESPACHO. Equilibra por productos.
     */
    public Integer despachadorMenosCargado(Connection c) throws SQLException {
        String sql =
            "SELECT u.id, COALESCE(SUM(pd.cantidad),0) AS carga " +
            "FROM seguridad.usuario u " +
            "JOIN seguridad.usuario_rol ur ON ur.id_usuario=u.id " +
            "JOIN seguridad.rol r ON r.id=ur.id_rol AND r.nombre='DESPACHADOR' " +
            "LEFT JOIN inventario.pedido p ON p.id_despachador=u.id AND p.estado='EN_DESPACHO' " +
            "LEFT JOIN inventario.pedido_detalle pd ON pd.id_pedido=p.id AND pd.despachado=FALSE " +
            "WHERE u.activo=TRUE " +
            "GROUP BY u.id ORDER BY carga ASC, u.id ASC LIMIT 1";
        try (PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt("id") : null;
        }
    }
}
