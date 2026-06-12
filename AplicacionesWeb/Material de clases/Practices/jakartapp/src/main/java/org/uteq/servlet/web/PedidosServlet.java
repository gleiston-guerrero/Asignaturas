package org.uteq.servlet.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.uteq.servlet.dao.PedidoDao;
import org.uteq.servlet.modelo.Usuario;

import java.io.IOException;

@WebServlet("/pedidos")
public class PedidosServlet extends HttpServlet {
    private final PedidoDao pedidoDao = new PedidoDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u.getIdCliente() == null) { resp.sendRedirect(req.getContextPath() + "/acceso-denegado.jsp"); return; }
        req.setAttribute("pedidos", pedidoDao.listarPorCliente(u.getIdCliente()));
        req.getRequestDispatcher("/WEB-INF/vistas/pedidos.jsp").forward(req, resp);
    }
}
