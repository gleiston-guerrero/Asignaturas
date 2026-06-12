<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%!
    private String color;

    public int suma(int num1, int num2){
        return num1 + num2;
    }

    %>
</head>
<body>
<%
    String strMensaje;
    Double cDouble;
    double dDouble;

    cDouble = 12.89;
    dDouble = 13.89;

    strMensaje = "Hola mundo!";
%>
<h1><%= "Hello World!" %>
</h1>
<!--<h2><%= 5 + 5 %></h2> -->
<%
    dDouble = 5+5;
    String color;
    if (Math.floor(dDouble) == Math.ceil(dDouble)){
        color = "#0F0";
        %>
        <h2 style="color:">El valor no tiene decimales</h2>
        <%
    }
    else {
        color = "#F0F";
        %>
            <h2>El valor Sí tiene decimales</h2>
        <%
    }
%>
<h2 style="color: <%=color%>;"><%= dDouble %></h2>

<h3><%= Math.ceil(12.35)%></h3>
<h3><%= Math.ceil(12.68)%></h3>

<h3><%= Math.floor(12.35)%></h3>
<h3><%= Math.floor(12.68)%></h3>

<h3><%= Math.round(12.35)%></h3>
<h3><%= Math.round(12.68)%></h3>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>