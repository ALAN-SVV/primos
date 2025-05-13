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

//path
@WebServlet("/registro") // Mapea el servlet a la URL "/registro"
public class Servlet extends HttpServlet {

    /**
     * Método que procesa las peticiones POST del formulario
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Mapa para almacenar mensajes de error
        Map<String, String> errores = new HashMap<>();
        // Variable para almacenar el resultado
        String resultado = null;
        String primos=null;

        // Obtener parámetros del formulario
        String numero1Str = request.getParameter("numero1");
        String numero2Str = request.getParameter("numero2");
        String operacion = request.getParameter("operacion");


        // Validar y convertir los números de String a double
        double numero1 = 0, numero2 = 0;
        try {
            numero1 = Double.parseDouble(numero1Str);
            numero2 = Double.parseDouble(numero2Str);
        } catch (NumberFormatException e) {
            // Si ocurre error en la conversión, agregar mensaje de error
            errores.put("numeros", "Los números deben ser válidos.");
        }

        // Si no hay errores en los números, realizar la operación
        if (errores.isEmpty()) {
            switch (operacion) {
                case "primos":
                    for (int primo = 0; numero1 >= 0; numero1++) {
                        if (numero1 >= 0) {
                            String.valueOf(numero1++ / 1);
                        } else {
                            // Error al dividir por cero
                            errores.put("Error", "No se puede poner un numero negativo.");
                        }
                        if (numero2 > numero1) {
                            resultado = String.valueOf(numero1++ / 1);
                        } else {
                            // Error al dividir por cero
                            errores.put("Error", "No se puede poner un rango negativo .");
                        }

                        if (numero2 >= 0) {
                            resultado = String.valueOf(numero1++ / 1);
                        } else {
                            // Error al dividir por cero
                            errores.put("Error", "No se puede poner un numero negativo .");
                        }
                        break;

                    }
            }
        }
        // Establecer atributos para pasar a la JSP
        request.setAttribute("errores", errores); // Mapa de errores
        request.setAttribute("resultado", resultado); // Resultado de la operación


        // Redirigir a la página JSP (index.jsp) para mostrar el resultado
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}