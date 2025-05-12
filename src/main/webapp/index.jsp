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
    :root {
      --primary-color: #6c63ff;
      --secondary-color: #4dabf7;
      --accent-color: #ff6b6b;
      --light-bg: #f8f9fa;
      --dark-text: #343a40;
    }

    body {
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      min-height: 100vh;
      padding: 20px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-container {
      max-width: 650px;
      margin: 2rem auto;
      background: rgba(255, 255, 255, 0.95);
      padding: 2.5rem;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
    }

    h3 {
      color: var(--primary-color);
      text-align: center;
      margin-bottom: 1.5rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      position: relative;
      padding-bottom: 10px;
    }

    h3:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 3px;
      background: var(--accent-color);
      border-radius: 3px;
    }

    .form-control, .form-select {
      border-radius: 8px;
      padding: 12px 15px;
      border: 2px solid #e9ecef;
      transition: all 0.3s ease;
    }

    .form-control:focus, .form-select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.25);
    }

    .form-label {
      font-weight: 600;
      color: var(--dark-text);
      margin-bottom: 8px;
    }

    .form-check-input:checked {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }

    .form-check-input:focus {
      box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.25);
    }

    .btn-primary {
      background-color: var(--primary-color);
      border: none;
      padding: 12px 0;
      font-weight: 600;
      letter-spacing: 1px;
      border-radius: 8px;
      transition: all 0.3s ease;
      text-transform: uppercase;
    }

    .btn-primary:hover {
      background-color: #5a52e0;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(108, 99, 255, 0.4);
    }

    .alert-danger {
      background-color: #ff6b6b;
      color: white;
      border-radius: 8px;
      border: none;
    }

    .error-list li {
      padding: 5px 0;
    }

    /* Estilo para los grupos de opciones */
    .option-group {
      background: rgba(241, 243, 255, 0.5);
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 15px;
      border-left: 4px solid var(--primary-color);
    }

    /* Efecto hover para las tarjetas de opción */
    .form-check {
      padding: 8px 15px;
      border-radius: 6px;
      transition: all 0.2s ease;
    }

    .form-check:hover {
      background-color: rgba(108, 99, 255, 0.1);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form-container mt-5">
    <h3>Formulario de Usuario</h3>

    <% if (errores != null && errores.size() > 0) { %>
    <div class="alert alert-danger">
      <ul class="error-list mb-0">
        <% for (String error : errores.values()) {%>
        <li><%=error%></li>
        <%}%>
      </ul>
    </div>
    <%}%>

    <form action="/app_formulario/registro" method="post">
      <div class="mb-4">
        <label for="username" class="form-label">Usuario:</label>
        <input type="text" class="form-control" name="username" id="username" placeholder="Ingrese su nombre de usuario">
      </div>

      <div class="mb-4">
        <label for="password" class="form-label">Password:</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="Ingrese su contraseña">
      </div>

      <div class="mb-4">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Ingrese su correo electrónico">
      </div>

      <div class="mb-4">
        <label for="pais" class="form-label">País:</label>
        <select class="form-select" name="pais" id="pais">
          <option value="">----- Seleccionar -----</option>
          <option value="ES">España</option>
          <option value="EC">Ecuador</option>
          <option value="PE">Perú</option>
          <option value="CO">Colombia</option>
          <option value="BR">Brazil</option>
          <option value="AR">Argentina</option>
          <option value="VE">Venezuela</option>
        </select>
      </div>

      <div class="mb-4">
        <label for="Lenguajes" class="form-label">Lenguajes de programación:</label>
        <select class="form-select" name="Lenguajes" id="Lenguajes">
          <option value="">-- Seleccionar -----</option>
          <option value="Java">Java</option>
          <option value="Python">Python</option>
          <option value="C#">C#</option>
          <option value="C++">C++</option>
          <option value="Angular">Angular</option>
        </select>
      </div>

      <div class="mb-4 option-group">
        <label class="form-label">Roles:</label>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="roles" value="ROLE_ADMIN" id="role_admin">
          <label class="form-check-label" for="role_admin">Administrador</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="roles" value="ROLE_USER" id="role_user">
          <label class="form-check-label" for="role_user">Usuario</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="roles" value="ROLE_MODERADOR" id="role_mod">
          <label class="form-check-label" for="role_mod">Moderador</label>
        </div>
      </div>

      <div class="mb-4 option-group">
        <label class="form-label">Idiomas:</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="idioma" value="es" id="idioma_es">
          <label class="form-check-label" for="idioma_es">Español</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="idioma" value="en" id="idioma_en">
          <label class="form-check-label" for="idioma_en">Inglés</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="idioma" value="ru" id="idioma_ru">
          <label class="form-check-label" for="idioma_ru">Ruso</label>
        </div>
      </div>

      <div class="mb-4 form-check form-switch">
        <input class="form-check-input" type="checkbox" name="habilitar" id="habilitar" checked>
        <label class="form-check-label" for="habilitar">Habilitar cuenta</label>
      </div>

      <div class="d-grid gap-2 mt-4">
        <button type="submit" class="btn btn-primary py-3">
          <i class="bi bi-send-fill me-2"></i>Enviar Registro
        </button>
      </div>

      <input type="hidden" name="secreto" value="123456">
    </form>
  </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</body>
</html>
