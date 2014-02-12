<%-- 
    Document   : eM
    Created on : 12/02/2014, 03:28:22 PM
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
        response.sendRedirect("../");
        return;
    }
    Integer codExtraInteger = 0;
    Extra objExtra = null;
    try {
        codExtraInteger = Integer.parseInt(request.getParameter("codExtraInteger"));
        objExtra = new cExtra().leer_cod(codExtraInteger, accionTipo);
    } catch (Exception e) {
        response.sendRedirect("../sExtra?accionTipo=" + accionTipo + "&accion=mantenimiento&parametro=ultimo");
        return;
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
    </head>
    <body>
        <input type="hidden" name="paginaActualPermiso" value="1" title="MANTENIMIENTO DE CLIENTES"/>
        <div id="wrap">
            <div id="right">
                <h3 class="titulo">CONTROL <%=accionTipo.toUpperCase()%></h3>
                <table class="reporte-tabla-1">
                    <thead>
                        <%
                            if (objExtra == null) {
                        %>
                        <tr>
                            <th colspan="3" class="medio" style="width: 600px;">
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=primero"><span><span><span class="first">Primero</span></span></span></a>
                                <a class="sexybutton" ><span><span><span class="prev">Anterior</span></span></span></a>
                                <a class="sexybutton" ><span><span><span class="next">Siguiente</span></span></span></a>
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=ultimo"><span><span><span class="last">Último</span></span></span></a>
                            </th>                            
                            <th>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="eR.jsp"><span class="add"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="edit"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="delete"></span></a>
                            </th>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                            <th colspan="3" class="medio" >
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=primero"><span><span><span class="first">Primero</span></span></span></a>
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=anterior&codExtraInteger=<%=objExtra.getCodExtra()%>"><span><span><span class="prev">Anterior</span></span></span></a>
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=siguiente&codExtraInteger=<%=objExtra.getCodExtra()%>"><span><span><span class="next">Siguiente</span></span></span></a>
                                <a class="sexybutton" href="../sExtra?accionTipo=<%=accionTipo%>&accion=mantenimiento&parametro=ultimo"><span><span><span class="last">Último</span></span></span></a>
                            </th>
                            <th>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="eR.jsp?accionTipo=<%=accionTipo%>"><span class="add"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="eE.jsp?accionTipo=<%=accionTipo%>&codExtraInteger=<%=objExtra.getCodExtra()%>"><span class="edit"></span></a>
                                <button id="bEliminar" class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="delete"></span></button>
                            </th>
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                    <tbody>
                        <%
                            if (objExtra == null) {
                        %>
                        <tr>
                            <td colspan="4">
                                <div>Registro no encontrado.</div>
                            </td>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                            <th class="ancho120px"><span><label>COD. REGISTRO</label></span></th>
                            <td class="ancho240px contenedorEntrada">
                                <div>
                                    <input type="text" name="codExtra" id="codDocumentoNotificacion" value="<%=objExtra.getCodExtra()%>" class="ocultar"/>
                                    <span><%=new cOtros().agregarCeros_int(objExtra.getCodExtra(), 8)%></span>
                                </div>
                            </td>
                            <th class="ancho120px"><span><label>CÓDIGO USO(*)</label></span></th>
                            <td class="ancho240px contenedorEntrada">
                                <div>
                                    <span><%=objExtra.getCodigo().toUpperCase()%></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><%=accionTipo.toUpperCase()%></span></th>
                            <td colspan="3">
                                <div>
                                    <span><%=objExtra.getLetra().toUpperCase()%></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span>OBSERVACIÓN</span></th>
                            <td colspan="3" class="alto80px"><div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objExtra.getObservacion())%></div></td>
                        </tr>
                        <%
                            }
                        %>
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