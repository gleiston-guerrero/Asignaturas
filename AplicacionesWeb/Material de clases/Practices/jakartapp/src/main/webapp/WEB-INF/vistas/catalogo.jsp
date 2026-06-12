<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h3 mb-0">Catalogo</h1>
  <a class="btn btn-outline-success" href="${ctx}/carrito">Ver carrito</a>
</div>
<table class="table table-hover align-middle">
  <thead><tr>
    <th>Producto</th><th>Descripcion</th><th class="text-end">Precio</th>
    <th class="text-center">Disponible</th><th style="width:220px">Agregar</th>
  </tr></thead>
  <tbody>
  <c:forEach var="p" items="${productos}">
    <tr>
      <td class="fw-semibold">${p.nombre}</td>
      <td class="text-muted small">${p.descripcion}</td>
      <td class="text-end"><fmt:formatNumber value="${p.precioActual}" type="currency" currencySymbol="$"/></td>
      <td class="text-center">
        <c:choose>
          <c:when test="${p.disponible gt 0}"><span class="badge bg-success">${p.disponible}</span></c:when>
          <c:otherwise><span class="badge bg-secondary">Agotado</span></c:otherwise>
        </c:choose>
      </td>
      <td>
        <c:if test="${p.disponible gt 0}">
        <form method="post" action="${ctx}/catalogo" class="d-flex gap-2">
          <input type="hidden" name="idProducto" value="${p.id}">
          <input type="number" name="cantidad" value="1" min="1" max="${p.disponible}" class="form-control form-control-sm" style="width:80px">
          <button class="btn btn-sm btn-success">Agregar</button>
        </form>
        </c:if>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
