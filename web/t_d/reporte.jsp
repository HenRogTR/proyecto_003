<%-- 
    Document   : reporte
    Created on : 31/01/2014, 12:42:24 PM
    Author     : Henrri
--%>

<%@page import="dao_dn.Extra"%>
<%@page import="java.util.Iterator"%>
<%@page import="clases.cExtra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:.DN Grupo Yucra</title>
        <!--todos-->
        <script type="text/javascript" src="../librerias/jquery/jquery-1.9.0.js" ></script>
        <script type="text/javascript" src="../librerias/jquery-ui/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="../librerias/principal/todos.css" media="all"/>
        <!--cambios-->
        <%@include file="../principal/inclusiones.jsp" %>
        <script type="text/javascript" src="../librerias/utilitarios/validaciones.js"></script>
        <script type="text/javascript" src="../librerias/reporte/reporte.js"></script>
    </head>
    <body>
        <input type="hidden" name="paginaActualPermiso" value="1" title="MANTENIMIENTO DE CLIENTES"/>
        <div id="wrap">
            <div id="right">
                <h3 class="titulo">REPORTES</h3>
                <table class="reporte-tabla-1" style="padding: 20px;">
                    <tbody>
                        <tr>
                            <th class="ancho60px"><span>ESTADO</span></th>
                            <td class="ancho320px contenedorEntrada">
                                <%
                                    List estadoList = new cExtra().leer("estado");
                                %>
                                <div>
                                    <select id="estado" name="estado" class="contenedorEntrada anchoTotal limpiar">
                                        <option value="">Seleccionar</option>
                                        <%
                                            for (Iterator it = estadoList.iterator(); it.hasNext();) {
                                                Extra objExtra = (Extra) it.next();
                                        %>
                                        <option value="<%=objExtra.getLetra()%>"><%=objExtra.getLetra()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </td>
                            <td class="ancho90px">
                                <a id="rEstado" class="sexybutton sexyicononly aDN"><span><span><span class="print"></span></span></span></a>
                                <a id="rEstadoExcel" class="sexybutton sexyicononly aDN"><span><span><span class="excel"></span></span></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="left">                
                <div id="menu">
                    <%@include file="../principal/menu.jsp" %>
                </div>
            </div> 
            <div style="clear: both;"></div>
            <div id="footer">
                <%@include file="../principal/piePagina.jsp" %>
            </div>
        </div>
    </body>
</html>