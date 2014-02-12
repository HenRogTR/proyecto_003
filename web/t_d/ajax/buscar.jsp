<%-- 
    Document   : buscar
    Created on : 12/02/2014, 02:52:18 PM
    Author     : Henrri
--%>

<%@page import="utilitarios.cManejoFechas"%>
<%@page import="utilitarios.cOtros"%>
<%@page import="dao_dn.DocumentoNotificacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="clases.cDN"%>
<%@page import="java.util.List"%>
<%
    String term = "";
    try {
        term = request.getParameter("term").toString();
    } catch (Exception e) {
%>
<table class="reporte-tabla-1 anchoTotal">
    <tr>
        <td colspan="9"><span>Error en parámetros.</span></td>
    </tr>
</table>
<%
        return;
    }
    List l = new cDN().leer_coincidencia(term);
%>
<table class="reporte-tabla-2 anchoTotal" style="font-size: 9px;">
    <%
        for (Iterator it = l.iterator(); it.hasNext();) {
            DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
            String cliente = objDN.getCliente().replace(term, "<strong>" + term + "</strong>");
            String placa = objDN.getPlacaNumero().replace(term, "<strong>" + term + "</strong>");
            String NMotor = objDN.getMotorNumero().replace(term, "<strong>" + term + "</strong>");
            String NChasis = objDN.getChasisNumero().replace(term, "<strong>" + term + "</strong>");
    %>
    <tr>
        <td class="ancho60px"><span><a href="mantenimiento.jsp?cDN=<%=new cOtros().agregarCeros_int(objDN.getCodDocumentoNotificacion(), 8)%>"><%=new cOtros().agregarCeros_int(objDN.getCodDocumentoNotificacion(), 8)%></a></span></td>
        <td class="ancho240px"><span><%=cliente%></span></td>
        <td class="ancho140px"><span><%=objDN.getPropietario()%></span></td>
        <td class="ancho80px"><span><%=new cOtros().replace_comillas_comillasD_barraInvertida(placa)%></span></td>
        <td class="ancho140px"><span><%=new cOtros().replace_comillas_comillasD_barraInvertida(NMotor)%></span></td>
        <td class="ancho140px"><span><%=new cOtros().replace_comillas_comillasD_barraInvertida(NChasis)%></span></td>
        <td class="ancho80px"><span><%=objDN.getEstado()%></span></td>
        <td><%=new cManejoFechas().DateAString(objDN.getFechaEntrega())%></td>
    </tr>
    <%
        }
    %>
</table>