<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<h1 class="h3 mb-3">Pedidos por despachar</h1>
<c:if test="${empty pedidos}"><p>No tiene pedidos asignados pendientes.</p></c:if>
<c:forEach var="p" items="${pedidos}">
  <div class="card mb-3">
    <div class="card-header d-flex justify-content-between">
      <span>Pedido #${p.id} &middot; Cliente: ${p.clienteNombre}</span>
      <span>Productos: ${p.totalProductos} &middot; Pendientes: ${p.lineasPendientes}</span>
    </div>
    <div class="card-body">
      <table class="table table-sm align-middle mb-0">
        <thead><tr><th>Producto</th><th class="text-center">Cant.</th>
          <th class="text-center">Estado</th><th style="width:160px"></th></tr></thead>
        <tbody>
        <c:forEach var="d" items="${p.detalles}">
          <tr>
            <td>${d.productoNombre}</td>
            <td class="text-center">${d.cantidad}</td>
            <td class="text-center">
              <c:choose>
                <c:when test="${d.despachado}"><span class="badge bg-success">Despachado</span></c:when>
                <c:otherwise><span class="badge bg-warning text-dark">Pendiente</span></c:otherwise>
              </c:choose>
            </td>
            <td>
              <c:if test="${not d.despachado}">
                <form method="post" action="${ctx}/despacho">
                  <input type="hidden" name="idDetalle" value="${d.id}">
                  <button class="btn btn-sm btn-success">Despachar</button>
                </form>
              </c:if>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</c:forEach>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
