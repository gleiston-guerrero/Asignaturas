package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.CarritoService;

import java.io.IOException;
import java.util.List;

@WebServlet("/carrito")
public class CarritoServlet extends HttpServlet {
    private final CarritoService carrito = new CarritoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u.getIdCliente() == null) { resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp"); return; }
        req.setAttribute("pedido", carrito.verCarrito(u.getIdCliente()));
        req.getRequestDispatcher("/WEB-INF/vistas/carrito.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u.getIdCliente() == null) { resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp"); return; }
        int idCliente = u.getIdCliente();
        String accion = req.getParameter("accion");
        try {
            switch (accion == null ? "" : accion) {
                case "actualizar" -> {
                    int idDetalle = Integer.parseInt(req.getParameter("idDetalle"));
                    int cantidad = Integer.parseInt(req.getParameter("cantidad"));
                    CarritoService.Resultado r = carrito.fijarCantidad(idCliente, idDetalle, cantidad);
                    CatalogoServlet.flash(req, r.mensaje, r.ok);
                }
                case "eliminar" -> {
                    int idDetalle = Integer.parseInt(req.getParameter("idDetalle"));
                    CarritoService.Resultado r = carrito.fijarCantidad(idCliente, idDetalle, 0);
                    CatalogoServlet.flash(req, r.mensaje, r.ok);
                }
                case "continuar" -> {
                    List<String> avisos = carrito.restaurarReservas(idCliente);
                    if (avisos.isEmpty()) CatalogoServlet.flash(req, "Pedido reactivado.", true);
                    else req.getSession().setAttribute("flashAvisos", avisos);
                }
                default -> CatalogoServlet.flash(req, "Accion no reconocida.", false);
            }
        } catch (NumberFormatException e) {
            CatalogoServlet.flash(req, "Datos invalidos.", false);
        }
        resp.sendRedirect(req.getContextPath() + "/carrito");
    }
}
