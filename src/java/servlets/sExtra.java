/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.cExtra;
import dao_dn.Extra;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilitarios.cOtros;

/**
 *
 * @author Henrri
 */
@WebServlet(name = "sExtra", urlPatterns = {"/sExtra"})
public class sExtra extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String accion = null;
        String accionTipo = null;
        //variables
        Integer codExtraInteger;
        String cE;
        String codigo;
        String letra;
        String observacion;
        String registro;

        try {
            accionTipo = request.getParameter("accionTipo").toString();
        } catch (Exception e) {
            out.print("Acción tipo no encontrada");
            return;
        }
        try {
            accion = request.getParameter("accion").toString();
        } catch (Exception e) {
            out.print("Acción no encontrada");
            return;
        }
        if (accion.equals("mantenimiento")) {
            String parametro = request.getParameter("parametro");
            if (parametro == null) {
                codExtraInteger = new cExtra().leer_ultimo(accionTipo);
                response.sendRedirect("o_t/eM.jsp?accionTipo=" + accionTipo + "&codExtraInteger=" + codExtraInteger);
            } else {
                try {
                    codExtraInteger = Integer.parseInt(request.getParameter("codExtraInteger"));
                } catch (Exception e) {
                    codExtraInteger = 0;
                }
                if (parametro.equals("primero")) {
                    codExtraInteger = new cExtra().leer_primero(accionTipo);
                    response.sendRedirect("o_t/eM.jsp?accionTipo=" + accionTipo + "&codExtraInteger=" + codExtraInteger);
                }
                if (parametro.equals("anterior")) {
                    codExtraInteger = new cExtra().leer_anterior(codExtraInteger, accionTipo);
                    if (codExtraInteger == 0) {
                        codExtraInteger = new cExtra().leer_primero(accionTipo);
                    }
                    response.sendRedirect("o_t/eM.jsp?accionTipo=" + accionTipo + "&codExtraInteger=" + codExtraInteger);
                }
                if (parametro.equals("siguiente")) {
                    codExtraInteger = new cExtra().leer_siguiente(codExtraInteger, accionTipo);
                    if (codExtraInteger == 0) {
                        codExtraInteger = new cExtra().leer_ultimo(accionTipo);
                    }
                    response.sendRedirect("o_t/eM.jsp?accionTipo=" + accionTipo + "&codExtraInteger=" + codExtraInteger);
                }
                if (parametro.equals("ultimo")) {
                    codExtraInteger = new cExtra().leer_ultimo(accionTipo);
                    response.sendRedirect("o_t/eM.jsp?accionTipo=" + accionTipo + "&codExtraInteger=" + codExtraInteger);
                }
            }
        }
        if (accion.equals("registrar")) {
            try {
                codigo = accionTipo;
                letra = request.getParameter("letra").toString();
                observacion = request.getParameter("observacion").toString();
                registro = new cOtros().registro("1", 1);
            } catch (Exception e) {
                out.print("Error en parámetros.");
                return;
            }
            Extra objExtra = new Extra();
            objExtra.setCodigo(codigo);
            objExtra.setLetra(letra);
            objExtra.setObservacion(observacion);
            objExtra.setRegistro(registro);
            
            objExtra.setCodExtra(new cExtra().crear(objExtra));
            if (objExtra.getCodExtra()== 0) {
                out.print("Error en registro.");
            } else {
                out.print(objExtra.getCodExtra());
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
