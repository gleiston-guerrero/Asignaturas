package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.CarritoService;
import org.uteq.servlet.servicio.FacturacionService;

import java.io.IOException;

@WebServlet("/facturar")
public class FacturarServlet extends HttpServlet {
    private final CarritoService carrito = new CarritoService();
    private final FacturacionService facturacion = new FacturacionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u.getIdCliente() == null) { resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp"); return; }
        req.setAttribute("pedido", carrito.verCarrito(u.getIdCliente()));
        req.setAttribute("iva", org.uteq.servlet.config.Config.getDouble("factura.iva", 0.15));
        req.getRequestDispatcher("/WEB-INF/vistas/facturar.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u.getIdCliente() == null) { resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp"); return; }
        FacturacionService.Resultado r = facturacion.pagar(u.getIdCliente());
        CatalogoServlet.flash(req, r.mensaje, r.ok);
        resp.sendRedirect(req.getContextPath() + "/pedidos");
    }
}
