package com.alan.formulario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

// Servlet para procesar el formulario
@WebServlet("/registro")
public class Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        // Obtener los datos del formulario
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");
        String idioma = req.getParameter("idioma");
        boolean habilitar = req.getParameter("habilitar") != null && req.getParameter("habilitar").equals("on");
        String secreto = req.getParameter("secreto");

        // Validar los datos
        Map<String, String> errores = new HashMap<>();
        validarCampos(username, password, email, pais, lenguajes, roles, idioma, errores);

        // Si no hay errores, mostrar los datos
        if (errores.isEmpty()) {
            mostrarResultados(resp, username, password, email, pais, lenguajes, roles, idioma, habilitar, secreto);
        } else {
            // Si hay errores, redirigir a la página del formulario
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    // Método para validar los campos del formulario
    private void validarCampos(String username, String password, String email, String pais, String[] lenguajes, String[] roles, String idioma, Map<String, String> errores) {
        // Validaciones...
    }

    // Método para mostrar los resultados del formulario
    private void mostrarResultados(HttpServletResponse resp, String username, String password, String email, String pais, String[] lenguajes, String[] roles, String idioma, boolean habilitar, String secreto) throws IOException {
        try (PrintWriter out = resp.getWriter()) {
            // Generar la respuesta HTML
        }
    }
}