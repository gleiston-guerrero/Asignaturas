<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // ---- Logica en scriptlet ----
    String sDesde = request.getParameter("desde");
    String sHasta = request.getParameter("hasta");
    String resultado = null;
    String error = null;

    // Solo procesa cuando el formulario ya fue enviado
    if (sDesde != null && sHasta != null) {
        try {
            long a = Long.parseLong(sDesde.trim());
            long b = Long.parseLong(sHasta.trim());

            long min = Math.min(a, b);   // funciona aunque a > b
            long max = Math.max(a, b);
            /*
                if (a>b){
                    max = a;
                    min = b;
                }
                else

             */

            long suma = 0;              // long para evitar desbordamiento en rangos grandes
            for (long i = min; i <= max; i++) {
                suma += i;
            }

            resultado = "La suma de los enteros entre " + a + " y " + b
                      + " (ambos incluidos) es: " + suma;
        } catch (NumberFormatException e) {
            error = "Debe ingresar dos números ENTEROS válidos.";
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Suma de un intervalo</title>
    <style>
        body   { font-family: Arial, sans-serif; max-width: 480px; margin: 40px auto; }
        label  { display: block; margin: 10px 0; }
        input  { padding: 6px; width: 120px; }
        button { padding: 8px 16px; margin-top: 10px; cursor: pointer; }
        .ok    { color: #146c2e; font-weight: bold; }
        .err   { color: #b00020; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Suma de los enteros en un intervalo</h1>

    <form method="post" action="suma.jsp">
        <label for="desde">Desde:
            <input required id="desde" type="number" name="desde" step="1"
                   value='<%= (sDesde != null) ? sDesde : "" %>'>
        </label>
        <label for="hasta">Hasta:
            <input required id="hasta" type="number" name="hasta" step="1"
                   value="<%= (sHasta != null) ? sHasta : "" %>">
        </label>
        <button type="submit">Sumar</button>
    </form>

    <%-- Mensaje de salida --%>
    <%
        if (error != null) {
        %>
        <p class="err">
            <%= error %>
        </p>
    <% }
        else if (resultado != null)
        {
        %>
        <p class="ok">
            <%= resultado %>
        </p>
    <% } %>
</body>
</html>
