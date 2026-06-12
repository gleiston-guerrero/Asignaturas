package org.uteq.servlet.dao;

import org.uteq.servlet.config.Db;
import org.uteq.servlet.modelo.Pagina;

import java.sql.*;
import java.util.*;

/**
 * Cache en memoria de paginas y permisos (cambian poco).
 * Resuelve el control de acceso por rol (RBAC).
 */
public class SeguridadDao {
    private static volatile Map<String, Pagina> PAGINAS;          // url -> pagina
    private static volatile Map<String, Set<String>> ROLES_URL;   // url -> roles permitidos

    private static synchronized void cargar() {
        if (PAGINAS != null) return;
        Map<String, Pagina> paginas = new LinkedHashMap<>();
        Map<String, Set<String>> rolesUrl = new HashMap<>();
        String sqlP = "SELECT id,nombre,url,publica,orden FROM seguridad.pagina ORDER BY orden";
        String sqlR = "SELECT pg.url, r.nombre AS rol " +
                "FROM seguridad.permiso pm " +
                "JOIN seguridad.pagina pg ON pg.id = pm.id_pagina " +
                "JOIN seguridad.rol r    ON r.id  = pm.id_rol";
        try (Connection c = Db.getConnection();
             Statement st = c.createStatement()) {
            try (ResultSet rs = st.executeQuery(sqlP)) {
                while (rs.next()) {
                    Pagina p = new Pagina();
                    p.setId(rs.getInt("id"));
                    p.setNombre(rs.getString("nombre"));
                    p.setUrl(rs.getString("url"));
                    p.setPublica(rs.getBoolean("publica"));
                    p.setOrden(rs.getInt("orden"));
                    paginas.put(p.getUrl(), p);
                }
            }
            try (ResultSet rs = st.executeQuery(sqlR)) {
                while (rs.next()) {
                    rolesUrl.computeIfAbsent(rs.getString("url"), k -> new HashSet<>())
                            .add(rs.getString("rol"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error cargando seguridad", e);
        }
        ROLES_URL = rolesUrl;
        PAGINAS = paginas;
    }

    public static void recargar() { PAGINAS = null; cargar(); }

    public boolean existe(String url) { cargar(); return PAGINAS.containsKey(url); }

    public boolean esPublica(String url) {
        cargar();
        Pagina p = PAGINAS.get(url);
        return p != null && p.isPublica();
    }

    /** true si alguno de los roles del usuario tiene permiso sobre la pagina. */
    public boolean puedeAcceder(String url, Collection<String> roles) {
        cargar();
        if (esPublica(url)) return true;
        Set<String> permitidos = ROLES_URL.getOrDefault(url, Set.of());
        for (String r : roles) if (permitidos.contains(r)) return true;
        return false;
    }

    /** Menu accesible: paginas publicas (excepto utilitarias) + las permitidas por rol. */
    public List<Pagina> menu(Collection<String> roles) {
        cargar();
        List<Pagina> menu = new ArrayList<>();
        Set<String> ocultas = Set.of("iniciosesion", "acceso-denegado");
        for (Pagina p : PAGINAS.values()) {
            if (ocultas.contains(p.getUrl())) continue;
            if (p.isPublica() || puedeAcceder(p.getUrl(), roles)) menu.add(p);
        }
        return menu;
    }
}
