<%--
  Created by IntelliJ IDEA.
  User: ALan Velasco
  Date: 11/5/2025
  Time: 19:38
  Descrpcion: formulario
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Map" %>
<%
  Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<html lang="en">
<head>
  <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"/>
  <title>Formulario usuario</title>
  <style>
    body {
      background-color: #f8f9fa;
    }
    h3 {
      color: #6f42c1;
      text-align: center;
      margin-bottom: 25px;
      font-weight: bold;
    }
    form {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(111, 66, 193, 0.1);
      max-width: 600px;
      margin: 0 auto;
    }
    label {
      color: #495057;
      font-weight: 500;
    }
    input[type="text"],
    input[type="password"],
    select {
      border: 1px solid #ced4da;
      border-radius: 5px;
      padding: 8px 12px;
      width: 100%;
      margin-bottom: 10px;
      background-color: #f8f9fa;
    }
    input[type="submit"] {
      background-color: #6f42c1;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      width: 100%;
      margin-top: 15px;
    }
    input[type="submit"]:hover {
      background-color: #5a32b0;
    }
    input[type="checkbox"],
    input[type="radio"] {
      margin-right: 8px;
    }
    div[style='color:red;'] {
      color: #dc3545 !important;
      font-size: 0.875em;
      margin-top: -8px;
      margin-bottom: 10px;
    }
    .form-section {
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    .form-section:last-child {
      border-bottom: none;
    }
  </style>
</head>
<body>
<div style="padding: 20px;">
  <h3>Formulario de Usuario</h3>

  <div>
    <form action="/formulario/registro" method="post">
      <div class="form-section">
        <label for="username">Usuario:</label>
        <div>
          <input type="text" name="username" id="username">
        </div>
        <div>
          <%
            if(errores != null && errores.containsKey("username")){
              out.print("<div style ='color:red;'>"+ errores.get("username")+ "</div>");
            }
          %>
        </div>
      </div>

      <div class="form-section">
        <label for="password">Password</label>
        <div>
          <input type="password" name="password" id="password">
        </div>
        <div>
          <%
            if(errores != null && errores.containsKey("password")){
              out.print("<div style ='color:red;'>"+ errores.get("password")+ "</div>");
            }
          %>
        </div>
      </div>

      <div class="form-section">
        <label for="email">Email</label>
        <div>
          <input type="text" name="email" id="email">
        </div>
        <div>
          <%
            if(errores != null && errores.containsKey("email")){
              out.print("<div style ='color:red;'>"+ errores.get("email")+ "</div>");
            }
          %>
        </div>
      </div>

      <div class="form-section">
        <label for="pais">País</label>
        <div>
          <select name="pais" id="pais">
            <option value="">-----Seleccionar-----</option>
            <option value="ES">España</option>
            <option value="EC">Ecuador</option>
            <option value="PE">Perú</option>
            <option value="CO">Colombia</option>
            <option value="BR">Brazil</option>
            <option value="AR">Argentina</option>
            <option value="VE">Venezuela</option>
          </select>
        </div>
        <div>
          <%
            if(errores != null && errores.containsKey("pais")){
              out.print("<div style ='color:red;'>"+ errores.get("pais")+ "</div>");
            }
          %>
        </div>
      </div>

      <div class="form-section">
        <label for="lenguajes">Lenguajes</label>
        <div>
          <select name="lenguajes" id="lenguajes">
            <option value="">-----Seleccionar-----</option>
            <option value="Java">Java</option>
            <option value="Python">Python</option>
            <option value="C#">C#</option>
            <option value="C++">C++</option>
            <option value="Angular">Angular</option>
          </select>
        </div>
        <div>
          <%
            if(errores != null && errores.containsKey("lenguajes")){
              out.print("<div style ='color:red;'>"+ errores.get("lenguajes")+ "</div>");
            }
          %>
        </div>
      </div>

      <div class="form-section">
        <label>Roles</label>
        <div>
          <input type="checkbox" name="roles" value="ROLE_ADMIN">
          <label>Administrador</label>
        </div>
        <div>
          <input type="checkbox" name="roles" value="ROLE_USER">
          <label>Usuario</label>
        </div>
        <div>
          <input type="checkbox" name="roles" value="ROLE_MODERADOR">
          <label>Moderador</label>
        </div>
        <%
          if(errores != null && errores.containsKey("roles")){
            out.print("<div style ='color:red;'>"+ errores.get("roles")+ "</div>");
          }
        %>
      </div>

      <div class="form-section">
        <label>Idiomas</label>
        <div>
          <input type="radio" name="idioma" value="es">
          <label>Español</label>
        </div>
        <div>
          <input type="radio" name="idioma" value="en">
          <label>Ingles</label>
        </div>
        <div>
          <input type="radio" name="idioma" value="ru">
          <label>Ruso</label>
        </div>
        <%
          if(errores != null && errores.containsKey("idioma")){
            out.print("<div style ='color:red;'>"+ errores.get("idioma")+ "</div>");
          }
        %>
      </div>

      <div class="form-section">
        <label for="habilitar">Habilitar</label>
        <div>
          <input type="checkbox" name="habilitar" id="habilitar" checked>
        </div>
      </div>

      <div>
        <div>
          <input type="submit" value="Enviar">
        </div>
      </div>

      <input type="hidden" name="secreto" value="123456">
    </form>
  </div>
</div>
</body>
</html>