<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jspf/cabecera.jspf" %>
<div class="row justify-content-center">
  <div class="col-md-5">
    <h1 class="h3 mb-3">Iniciar sesion</h1>
    <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
    <form method="post" action="${ctx}/login">
      <input type="hidden" name="next" value="${param.next}">
      <div class="mb-3">
        <label class="form-label">Usuario</label>
        <input class="form-control" name="username" required autofocus>
      </div>
      <div class="mb-3">
        <label class="form-label">Contrasena</label>
        <input type="password" class="form-control" name="password" required>
      </div>
      <button class="btn btn-success w-100">Entrar</button>
    </form>
    <hr>
    <p class="small text-muted mb-0">Demo: admin/admin123 &middot; ana/ana123 &middot;
       luis/luis123 &middot; carlos/desp123 &middot; marta/desp123</p>
  </div>
</div>
<%@ include file="/WEB-INF/jspf/pie.jspf" %>
