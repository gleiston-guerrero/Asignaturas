<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<h1 class="h3 mb-3">Facturar</h1>
<c:choose>
  <c:when test="${empty pedido or empty pedido.detalles}">
    <p>No hay productos para facturar. <a href="${ctx}/catalogo">Ir al catalogo</a></p>
  </c:when>
  <c:otherwise>
    <c:set var="subtotal" value="0" />
    <table class="table">
      <thead><tr><th>Producto</th><th class="text-center">Cant.</th>
        <th class="text-end">P. Unit.</th><th class="text-end">Subtotal</th></tr></thead>
      <tbody>
      <c:forEach var="d" items="${pedido.detalles}">
        <c:set var="subtotal" value="${subtotal + d.subtotal}" />
        <tr><td>${d.productoNombre}</td><td class="text-center">${d.cantidad}</td>
          <td class="text-end"><fmt:formatNumber value="${d.precioUnitario}" type="currency" currencySymbol="$"/></td>
          <td class="text-end"><fmt:formatNumber value="${d.subtotal}" type="currency" currencySymbol="$"/></td></tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="row justify-content-end"><div class="col-md-4">
      <table class="table table-sm">
        <tr><td>Subtotal</td><td class="text-end"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="$"/></td></tr>
        <tr><td>IVA (<fmt:formatNumber value="${iva*100}" maxFractionDigits="0"/>%)</td>
            <td class="text-end"><fmt:formatNumber value="${subtotal*iva}" type="currency" currencySymbol="$"/></td></tr>
        <tr class="fw-bold"><td>Total</td>
            <td class="text-end"><fmt:formatNumber value="${subtotal + subtotal*iva}" type="currency" currencySymbol="$"/></td></tr>
      </table>
      <form method="post" action="${ctx}/facturar">
        <button class="btn btn-success w-100">Pagar pedido</button>
      </form>
    </div></div>
  </c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
