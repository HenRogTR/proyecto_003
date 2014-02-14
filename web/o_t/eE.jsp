<%-- 
    Document   : eE
    Created on : 12/02/2014, 05:02:26 PM
    Author     : Henrri
--%>
<%@page import="utilitarios.cOtros"%>
<%@page import="clases.cExtra"%>
<%@page import="dao_dn.Extra"%>
<%
    String accionTipo = "";
    try {
        accionTipo = request.getParameter("accionTipo").toString();
    } catch (Exception e) {
        response.sendRedirect("../sExtra?accionTipo=" + accionTipo + "&accion=mantenimiento&parametro=ultimo");
        return;
    }
    Integer codExtraInteger;
    Extra objExtra = null;
    try {
        codExtraInteger = Integer.parseInt(request.getParameter("codExtraInteger"));
        objExtra = new cExtra().leer_cod(codExtraInteger);
        if (objExtra == null) {
            response.sendRedirect("../sExtra?accionTipo=" + accionTipo + "&accion=mantenimiento&parametro=ultimo");
            return;
        }
    } catch (Exception e) {
        response.sendRedirect("../sExtra?accionTipo=" + accionTipo + "&accion=mantenimiento&parametro=ultimo");
    }
%>
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
        <script type="text/javascript" src="../librerias/otros/e.js"></script>
        <script type="text/javascript" src="../librerias/utilitarios/validaciones.js"></script>
    </head>
    <body>
        <div id="wrap">
            <div id="right">
                <h3 class="titulo">EDITAR <%=accionTipo.toUpperCase()%></h3>
                <form id="fExtra">
                    <input type="text" name="accionTipo" id="accionTipo" value="<%=accionTipo%>" class="ocultar"/>
                    <table class="reporte-tabla-1">
                        <thead>
                            <tr>
                                <th colspan="2"><span><strong>REGISTRO DE <%=accionTipo.toUpperCase()%></strong></span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr id="trBoton">
                                <th colspan="2">
                                    <button class="sexybutton" type="button"><span><span><span class="cancel">Cancelar</span></span></span></button>
                                    <button class="sexybutton" type="reset"><span><span><span class="undo">Restaurar</span></span></span></button>
                                    <button id="bRegistrar" class="sexybutton" type="submit"><span><span><span class="save">Registrar</span></span></span></button>
                                </th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <th class="ancho120px">
                                    <span>CÓDIGO</span>
                                </th>
                                <td class="ancho320px">
                                    <div>
                                        <input type="text" name="codExtra" 
                                               id="codExtra" value="<%=objExtra.getCodExtra()%>" class="ocultar"/>
                                        <span><%=new cOtros().agregarCeros_int(objExtra.getCodExtra(), 8)%></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span><%=accionTipo.toUpperCase()%></span>
                                </th>
                                <td class="contenedorEntrada">
                                    <div>
                                        <input type="text" name="letra" id="letra" 
                                               value="<%=objExtra.getLetra()%>" class="entrada anchoTotal mayuscula limpiar"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>OBSERVACIÓN</span>
                                </th>
                                <td class="contenedorEntrada">
                                    <textarea name="observacion" id="observacion" 
                                              class="entrada anchoTotal mayuscula alto80px limpiar"><%=objExtra.getObservacion()%></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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