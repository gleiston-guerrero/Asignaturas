<%@ page contentType="text/html; charset=UTF-8" %>
<%-- Taglib del nucleo de JSTL. Ojo: la URI Jakarta es 'jakarta.tags.core',
     NO la antigua 'http://java.sun.com/jsp/jstl/core'. --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Suma de un intervalo (JSTL)</title>
    <style>
        body   { font-family: Arial, sans-serif; max-width: 480px; margin: 40px auto; }
        label  { display: block; margin: 10px 0; }
        input  { padding: 6px; width: 120px; }
        button { padding: 8px 16px; margin-top: 10px; cursor: pointer; }
        .ok    { color: #146c2e; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Suma de los enteros en un intervalo (JSTL)</h1>

    <form method="post" action="sumajstl.jsp">
        <label>Desde:
            <input type="number" step="1" name="desde"
                   value="${param.desde}" required>
        </label>
        <label>Hasta:
            <input type="number" step="1" name="hasta"
                   value="${param.hasta}" required>
        </label>
        <button type="submit">Sumar</button>
    </form>

    <%-- Solo procesa cuando ya llegaron ambos valores --%>
    <c:if test="${not empty param.desde and not empty param.hasta}">

        <%-- '+ 0' fuerza la conversion de texto a numero entero --%>
        <c:set var="a" value="${param.desde + 0}" />
        <c:set var="b" value="${param.hasta + 0}" />

        <%-- Ordena los extremos para que funcione aunque a > b --%>
        <c:set var="min" value="${a <= b ? a : b}" />
        <c:set var="max" value="${a <= b ? b : a}" />

        <%-- Bucle real: recorre el intervalo y acumula --%>
        <c:set var="suma" value="0" />
        <c:forEach var="i" begin="${min}" end="${max}">
            <c:set var="suma" value="${suma + i}" />
        </c:forEach>

        <p class="ok">
            La suma de los enteros entre ${a} y ${b} (ambos incluidos) es: ${suma}
        </p>
    </c:if>

</body>
</html>
