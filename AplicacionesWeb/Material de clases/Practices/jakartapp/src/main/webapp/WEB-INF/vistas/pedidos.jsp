<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<h1 class="h3 mb-3">Mis pedidos</h1>
<c:if test="${empty pedidos}"><p>Aun no tiene pedidos.</p></c:if>
<c:forEach var="p" items="${pedidos}">
  <div class="card mb-3">
    <div class="card-header d-flex justify-content-between">
      <span>Pedido #${p.id}
        <span class="badge bg-info text-dark">${p.estado}</span></span>
      <span>Total: <fmt:formatNumber value="${p.total}" type="currency" currencySymbol="$"/></span>
    </div>
    <div class="card-body">
      <p class="small text-muted mb-2">
        Despachador: <c:out value="${p.despachadorNombre}" default="(sin asignar)"/></p>
      <table class="table table-sm mb-0">
        <thead><tr><th>Producto</th><th class="text-center">Cant.</th><th class="text-center">Estado</th></tr></thead>
        <tbody>
        <c:forEach var="d" items="${p.detalles}">
          <tr><td>${d.productoNombre}</td><td class="text-center">${d.cantidad}</td>
            <td class="text-center">
              <c:choose>
                <c:when test="${d.despachado}"><span class="badge bg-success">Despachado</span></c:when>
                <c:otherwise><span class="badge bg-secondary">Pendiente</span></c:otherwise>
              </c:choose></td></tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</c:forEach>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
