<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<div class="p-5 mb-4 bg-success-subtle rounded-3">
  <h1 class="display-5 fw-bold">Bienvenido a TiendaUTEQ</h1>
  <p class="col-md-8 fs-5">Plataforma de compras en linea con catalogo, carrito,
     facturacion y despacho de pedidos.</p>
  <c:if test="${empty usuario}">
    <a class="btn btn-success btn-lg" href="${ctx}/login">Iniciar sesion</a>
  </c:if>
  <c:if test="${not empty usuario and usuario.idCliente != null}">
    <a class="btn btn-success btn-lg" href="${ctx}/catalogo">Ver catalogo</a>
  </c:if>
</div>
<div class="row g-4">
  <div class="col-md-4"><div class="card h-100"><div class="card-body">
    <h5 class="card-title">Catalogo</h5>
    <p class="card-text">Explora productos con precio y disponibilidad en tiempo real.</p>
  </div></div></div>
  <div class="col-md-4"><div class="card h-100"><div class="card-body">
    <h5 class="card-title">Carrito y reservas</h5>
    <p class="card-text">Los productos se reservan al agregarlos y se liberan si no compras.</p>
  </div></div></div>
  <div class="col-md-4"><div class="card h-100"><div class="card-body">
    <h5 class="card-title">Despacho</h5>
    <p class="card-text">Los pedidos pagados se reparten de forma equilibrada entre despachadores.</p>
  </div></div></div>
</div>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
