package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.dao.ProductoDao;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.CarritoService;

import java.io.IOException;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {
    private final ProductoDao productoDao = new ProductoDao();
    private final CarritoService carrito = new CarritoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("productos", productoDao.listarDisponibles());
        req.getRequestDispatcher("/WEB-INF/vistas/catalogo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u == null || u.getIdCliente() == null) {
            resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp");
            return;
        }
        try {
            int idProducto = Integer.parseInt(req.getParameter("idProducto"));
            int cantidad = Integer.parseInt(req.getParameter("cantidad"));
            CarritoService.Resultado r = carrito.agregar(u.getIdCliente(), idProducto, cantidad);
            flash(req, r.mensaje, r.ok);
        } catch (NumberFormatException e) {
            flash(req, "Datos invalidos.", false);
        }
        resp.sendRedirect(req.getContextPath() + "/catalogo");
    }

    static void flash(HttpServletRequest req, String msg, boolean ok) {
        HttpSession s = req.getSession();
        s.setAttribute("flash", msg);
        s.setAttribute("flashTipo", ok ? "success" : "danger");
    }
}
