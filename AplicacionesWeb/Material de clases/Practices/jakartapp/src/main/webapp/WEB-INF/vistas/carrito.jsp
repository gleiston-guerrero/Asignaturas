<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<h1 class="h3 mb-3">Mi carrito</h1>
<c:choose>
  <c:when test="${empty pedido or empty pedido.detalles}">
    <p>Tu carrito esta vacio. <a href="${ctx}/catalogo">Ir al catalogo</a></p>
  </c:when>
  <c:otherwise>
    <c:if test="${pedido.liberado}">
      <div class="alert alert-warning d-flex justify-content-between align-items-center">
        <span>Las reservas de este pedido se liberaron al cerrar sesion. Reactivelo para continuar.</span>
        <form method="post" action="${ctx}/carrito">
          <input type="hidden" name="accion" value="continuar">
          <button class="btn btn-warning btn-sm">Continuar pedido</button>
        </form>
      </div>
    </c:if>
    <table class="table align-middle">
      <thead><tr><th>Producto</th><th class="text-end">Precio</th>
        <th style="width:200px">Cantidad</th><th class="text-end">Subtotal</th><th></th></tr></thead>
      <tbody>
      <c:set var="total" value="0" />
      <c:forEach var="d" items="${pedido.detalles}">
        <c:set var="total" value="${total + d.subtotal}" />
        <tr>
          <td>${d.productoNombre}</td>
          <td class="text-end"><fmt:formatNumber value="${d.precioUnitario}" type="currency" currencySymbol="$"/></td>
          <td>
            <form method="post" action="${ctx}/carrito" class="d-flex gap-2">
              <input type="hidden" name="accion" value="actualizar">
              <input type="hidden" name="idDetalle" value="${d.id}">
              <input type="number" name="cantidad" value="${d.cantidad}" min="1" class="form-control form-control-sm" style="width:80px">
              <button class="btn btn-sm btn-outline-secondary">Actualizar</button>
            </form>
          </td>
          <td class="text-end"><fmt:formatNumber value="${d.subtotal}" type="currency" currencySymbol="$"/></td>
          <td>
            <form method="post" action="${ctx}/carrito">
              <input type="hidden" name="accion" value="eliminar">
              <input type="hidden" name="idDetalle" value="${d.id}">
              <button class="btn btn-sm btn-outline-danger">Quitar</button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
      <tfoot><tr>
        <th colspan="3" class="text-end">Total productos: ${pedido.totalProductos}</th>
        <th class="text-end"><fmt:formatNumber value="${total}" type="currency" currencySymbol="$"/></th>
        <th></th>
      </tr></tfoot>
    </table>
    <c:if test="${not pedido.liberado}">
      <a class="btn btn-success" href="${ctx}/facturar">Proceder a facturar</a>
    </c:if>
  </c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
