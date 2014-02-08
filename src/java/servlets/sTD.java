/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
@WebServlet(name = "sTD", urlPatterns = {"/sTD"})
public class sTD extends HttpServlet {

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
        //variables
        Integer codDocumentoNotificacion;
        String cliente;
        String propietario;
        String sucursal;
        String placaNumero;
        String tituloNumero;
        String marca;
        String motorNumero;
        String chasisNumero;
        String carroceria;
        String estado;
        String fechaEntrega;
        String observacion;
        String registro;

        try {
            accion = request.getParameter("accion").toString();
        } catch (Exception e) {
            out.print("Acción no encontrada");
            return;
        }

        if (accion.equals("registrar")) {
            try {
                cliente = request.getParameter("cliente").toString();
                propietario = request.getParameter("propietario").toString();
                sucursal = request.getParameter("sucursal").toString();
                placaNumero = request.getParameter("placaNumero").toString();
                tituloNumero = request.getParameter("tituloNumero").toString();
                marca = request.getParameter("marca").toString();
                motorNumero = request.getParameter("motorNumero").toString();
                chasisNumero = request.getParameter("chasisNumero").toString();
                carroceria = request.getParameter("carroceria").toString();
                estado = request.getParameter("estado").toString();
                fechaEntrega = request.getParameter("fechaEntrega").toString();
                observacion = request.getParameter("observacion").toString();
                registro = new cOtros().registro("1", 1);
            } catch (Exception e) {
                out.print("Error en parámetros");
            }
            out.print("Correcto");
        }

        if (accion.equals(
                "editar")) {

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
