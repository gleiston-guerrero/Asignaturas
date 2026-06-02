package org.uteq.servlet.filtro;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import org.uteq.servlet.dao.SeguridadDao;
import org.uteq.servlet.modelo.Usuario;

import java.io.IOException;
import java.util.List;

/** Control de acceso por rol (RBAC). Tambien arma el menu de navegacion. */
@WebFilter("/*")
public class SeguridadFiltro implements Filter {
    private final SeguridadDao seguridad = new SeguridadDao();

    @Override
    public void doFilter(ServletRequest sreq, ServletResponse sres, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) sreq;
        HttpServletResponse res = (HttpServletResponse) sres;
        String ctx = req.getContextPath();
        String path = req.getServletPath();

        // Recursos estaticos: sin control ni menu
        if (path.startsWith("/css") || path.startsWith("/js") || path.startsWith("/img")
                || path.equals("/favicon.ico")) {
            chain.doFilter(sreq, sres);
            return;
        }

        // Usuario actual (si hay) y menu segun sus roles (anonimo -> solo publicas)
        HttpSession ses = req.getSession(false);
        Usuario u = ses != null ? (Usuario) ses.getAttribute("usuario") : null;
        List<String> roles = u != null ? u.getRoles() : List.of();
        req.setAttribute("menu", seguridad.menu(roles));

        // Endpoints utilitarios
        if (path.equals("/login") || path.equals("/logout")) {
            chain.doFilter(sreq, sres);
            return;
        }

        String clave = claveDePagina(path);

        // Pagina publica o no registrada -> se permite
        if (!seguridad.existe(clave) || seguridad.esPublica(clave)) {
            chain.doFilter(sreq, sres);
            return;
        }

        // Pagina restringida: requiere sesion y permiso
        if (u == null) {
            res.sendRedirect(ctx + "/login?next=" + clave);
            return;
        }
        if (seguridad.puedeAcceder(clave, roles)) {
            chain.doFilter(sreq, sres);
        } else {
            res.sendRedirect(ctx + "/acceso-denegado.jsp");
        }
    }

    /** Convierte el path en la clave logica de pagina (index, catalogo, mision...). */
    private String claveDePagina(String path) {
        if (path == null || path.equals("/")) return "index";
        String p = path.startsWith("/") ? path.substring(1) : path;
        if (p.endsWith(".jsp")) p = p.substring(0, p.length() - 4);
        int barra = p.indexOf('/');
        if (barra > 0) p = p.substring(0, barra);
        return p;
    }
}
