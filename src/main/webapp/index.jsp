<%--
  Created by IntelliJ IDEA.
  User: ALan Velasco
  Date: 11/5/2025
  Time: 19:38
  Descrpcion: formulario
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>

<%
  @SuppressWarnings("unchecked")
  Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
  String resultado = (String) request.getAttribute("resultado"); // Recuperar el resultado
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Prueba</title>
  <link rel="stylesheet" href="<%= request.getContextPath()%>/css/estilos.css"/>
</head>
<body>
<% if (errores != null && !errores.isEmpty()) { %>
<div class="alert">
  <ul>
    <% for (String err : errores.values()) { %>
    <li><%= err %></li>
    <% } %>
  </ul>
</div>
<% } %>

<form action="<%= request.getContextPath() %>/registro" method="post">


  <h3>Ejercicios de primos prueba</h3>

  <div class="form-group">
    <label for="numero1">Número 1:</label>
    <input type="number" name="numero1" id="numero1" required />
  </div>

  <div class="form-group">
    <label for="numero2">Número 2:</label>
    <input type="number" name="numero2" id="numero2" required />
  </div>

  <div class="form-group">
    <label for="operacion">Operación:</label>
    <select name="operacion" id="operacion">
      <option value="primos">primos</option>
    </select>
  </div>

  <div class="form-group submit">
    <button type="submit">Calcular</button>
  </div>

  <% if (resultado != null) { %>
  <div class="resultado">
    <h4>Resultado:</h4>
    <p><%= resultado %></p>
  </div>
  <% } %>

  <input type="hidden" name="secreto" value="123456" />
</form>
</body>
</html>