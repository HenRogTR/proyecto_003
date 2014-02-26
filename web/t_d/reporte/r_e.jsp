<%-- 
    Document   : r_e
    Created on : 25/02/2014, 09:39:01 AM
    Author     : Henrri
--%>
<%@page import="utilitarios.cOtros"%>
<%@page import="dao_dn.DocumentoNotificacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="clases.cDN"%>
<%@page import="java.util.List"%>
<%
    String estado = "";
    List reporList = null;
    try {
        estado = request.getParameter("estado").toString();
        reporList = new cDN().leer_por_estado2(estado);
        if (reporList == null) {
            out.print("Reporte no encontrado");
            return;
        }
    } catch (Exception e) {
        out.print("Error en parámetros.");
        return;
    }
%>

<%@page import="utilitarios.cManejoFechas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <table class="anchoTotal">
            <thead>
                <tr>
                    <th colspan="4">REPORTE DE TARJETA DE CRÉDITO :: ESTADO -> <%=estado%> </th>
                    <th colspan="3"><%=new cManejoFechas().fechaHoraActual()%></th>
                </tr>
                <tr class="top3 bottom2">
                    <th style="width: 70px;" class="centrado"><span>Código</span></th>
                    <th><span>Cliente</span></th>
                    <th class="ancho100px"><span>Propietario</span></th>
                    <th class="ancho120px"><span>N° Placa</span></th>
                    <th class="ancho120px"><span>N° Título</span></th>
                    <th class="ancho120px"><span>Marca</span></th>
                    <th class="ancho140px"><span>N° Motor</span></th>
                    <th class="ancho140px"><span>N° Chasís</span></th>
                    <th class="ancho120px"><span>Carrocería</span></th>
                    <th class="ancho80px"><span>Estado</span></th>
                    <th class="ancho80px"><span>F. Entrega</span></th>
                    <th class="ancho160px"><span>Observación</span></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Iterator it = reporList.iterator(); it.hasNext();) {
                        DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
                %>
                <tr>
                    <td style="padding-left: 5px;"><div><a href="../mantenimiento.jsp?cDN=<%=objDN.getCodDocumentoNotificacion()%>" target="_blank"><%=new cOtros().agregarCeros_int(objDN.getCodDocumentoNotificacion(), 8)%></a></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getCliente())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getPropietario())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getPlacaNumero())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getTituloNumero())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getMarca())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getMotorNumero())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getChasisNumero())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getCarroceria())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getEstado())%></div></td>
                    <td style="padding-left: 5px;"><div><%=new cManejoFechas().DateAString(objDN.getFechaEntrega())%></div></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
