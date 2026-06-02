package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.dao.UsuarioDao;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.CarritoService;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UsuarioDao usuarioDao = new UsuarioDao();
    private final CarritoService carrito = new CarritoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/iniciosesion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String usuario = req.getParameter("username");
        String clave = req.getParameter("password");
        Usuario u = usuarioDao.autenticar(usuario, clave);
        if (u == null) {
            req.setAttribute("error", "Usuario o contrasena incorrectos.");
            req.getRequestDispatcher("/iniciosesion.jsp").forward(req, resp);
            return;
        }
        HttpSession ses = req.getSession(true);
        ses.setAttribute("usuario", u);

        // Si es cliente y tenia un carrito liberado, se restauran las reservas
        if (u.getIdCliente() != null) {
            List<String> avisos = carrito.restaurarReservas(u.getIdCliente());
            if (!avisos.isEmpty()) ses.setAttribute("flashAvisos", avisos);
        }
        String next = req.getParameter("next");
        if (next != null && !next.isBlank()) resp.sendRedirect(req.getContextPath() + "/" + next);
        else resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
