package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.dao.PedidoDao;
import org.uteq.servlet.modelo.Usuario;
import org.uteq.servlet.servicio.DespachoService;

import java.io.IOException;

@WebServlet("/despacho")
public class DespachoServlet extends HttpServlet {
    private final PedidoDao pedidoDao = new PedidoDao();
    private final DespachoService despacho = new DespachoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        req.setAttribute("pedidos", pedidoDao.listarPorDespachador(u.getId()));
        req.getRequestDispatcher("/WEB-INF/vistas/despacho.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        try {
            int idDetalle = Integer.parseInt(req.getParameter("idDetalle"));
            DespachoService.Resultado r = despacho.despacharLinea(idDetalle, u.getId());
            CatalogoServlet.flash(req, r.mensaje, r.ok);
        } catch (NumberFormatException e) {
            CatalogoServlet.flash(req, "Datos invalidos.", false);
        }
        resp.sendRedirect(req.getContextPath() + "/despacho");
    }
}
