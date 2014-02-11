/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.cDN;
import dao_dn.DocumentoNotificacion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilitarios.cManejoFechas;
import utilitarios.cOtros;
import utilitarios.cValidacion;

/**
 *
 * @author Henrri
 */
@WebServlet(name = "sDN", urlPatterns = {"/sDN"})
public class sDN extends HttpServlet {

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
        Integer cDN;
        String codDocumentoNotificacion;
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
                return;
            }
            //validando entradas
            DocumentoNotificacion objDN = new DocumentoNotificacion();
            objDN.setCliente(cliente);
            objDN.setPropietario(propietario);
            objDN.setSucursal(sucursal);
            objDN.setPlacaNumero(placaNumero);
            objDN.setTituloNumero(tituloNumero);
            objDN.setMarca(marca);
            objDN.setMotorNumero(motorNumero);
            objDN.setChasisNumero(chasisNumero);
            objDN.setCarroceria(carroceria);
            objDN.setEstado(estado);
            if (new cValidacion().validarFecha(fechaEntrega)) {
                objDN.setFechaEntrega(new cManejoFechas().StringADate(fechaEntrega));
            } else {
                objDN.setFechaEntrega(null);
            }
            objDN.setObservacion(observacion);
            objDN.setRegistro(registro);
            objDN.setCodDocumentoNotificacion(new cDN().crear(objDN));
            if (objDN.getCodDocumentoNotificacion() == 0) {
                out.print("Error en registro.");
            } else {
                out.print(objDN.getCodDocumentoNotificacion());
            }
        }

        if (accion.equals("editar")) {
            try {
                codDocumentoNotificacion = request.getParameter("codDocumentoNotificacion").toString();
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
                return;
            }

            DocumentoNotificacion objDN = new DocumentoNotificacion();
            objDN.setCodDocumentoNotificacion(Integer.parseInt(codDocumentoNotificacion));
            objDN.setCliente(cliente);
            objDN.setPropietario(propietario);
            objDN.setSucursal(sucursal);
            objDN.setPlacaNumero(placaNumero);
            objDN.setTituloNumero(tituloNumero);
            objDN.setMarca(marca);
            objDN.setMotorNumero(motorNumero);
            objDN.setChasisNumero(chasisNumero);
            objDN.setCarroceria(carroceria);
            objDN.setEstado(estado);
            if (new cValidacion().validarFecha(fechaEntrega)) {
                objDN.setFechaEntrega(new cManejoFechas().StringADate(fechaEntrega));
            } else {
                objDN.setFechaEntrega(null);
            }
            objDN.setObservacion(observacion);
            objDN.setRegistro(registro);
            if (new cDN().actualizar(objDN)) {
                out.print(objDN.getCodDocumentoNotificacion());
            } else {
                out.print("Error en registro.");
            }
        }

        if (accion.equals("mantenimiento")) {
            String parametro = request.getParameter("parametro");
            if (parametro == null) {
                cDN = new cDN().leer_ultimo();
                response.sendRedirect("t_d/mantenimiento.jsp?cDN=" + cDN);
            } else {
                if (parametro.equals("primero")) {

                }
                if (parametro.equals("anterior")) {

                }
                if (parametro.equals("siguiente")) {

                }
                if (parametro.equals("ultimo")) {
                    cDN = new cDN().leer_ultimo();
                    response.sendRedirect("t_d/mantenimiento.jsp?cDN=" + cDN);
                }
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
