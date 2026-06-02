package org.uteq.servlet.web;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.CarritoService;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private final CarritoService carrito = new CarritoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession ses = req.getSession(false);
        if (ses != null) {
            Usuario u = (Usuario) ses.getAttribute("usuario");
            // Cliente que no completo el pedido: se devuelven las cantidades al inventario,
            // pero el carrito (la lista) se conserva para cuando vuelva.
            if (u != null && u.getIdCliente() != null) carrito.liberarReservas(u.getIdCliente());
            ses.invalidate();
        }
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
