<%@ page contentType="text/html; charset=UTF-8" %>
<%-- Version con EXPRESIONES EL: no hay bucles en EL, por eso se usa la
     formula de la suma aritmetica:  suma = (a+b) * (|a-b| + 1) / 2
     Todo se calcula con operadores de EL: + - * / >= y el ternario ?: --%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Suma de un intervalo (EL)</title>
    <style>
        body   { font-family: Arial, sans-serif; max-width: 480px; margin: 40px auto; }
        label  { display: block; margin: 10px 0; }
        input  { padding: 6px; width: 120px; }
        button { padding: 8px 16px; margin-top: 10px; cursor: pointer; }
        .ok    { color: #146c2e; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Suma de los enteros en un intervalo (EL)</h1>

    <form method="get" action="sumael.jsp">
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

    <%-- Solo muestra el resultado cuando ya se enviaron ambos valores.
         El ternario devuelve '' (cadena vacia) en la primera carga. --%>
    <p class="ok">
        ${ (empty param.desde or empty param.hasta) ? '' :
           'La suma de los enteros entre ' += param.desde += ' y ' += param.hasta
           += ' (ambos incluidos) es: '
           += ((param.desde + param.hasta)
              * ( ((param.desde >= param.hasta) ? (param.desde - param.hasta)
                                                 : (param.hasta - param.desde)) + 1 )
              / 2) }
    </p>
</body>
    <!--
        5 a 10 => (5 + 10) * ((10-5) + 1)/2 = 15 * 3 = 45
        5 +6 +7 +8 +9 +10 = 45
    -->
</html>
