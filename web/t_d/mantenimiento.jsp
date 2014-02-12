<%-- 
    Document   : mantenimiento
    Created on : 31/01/2014, 09:57:29 AM
    Author     : Henrri
--%>

<%@page import="utilitarios.cManejoFechas"%>
<%@page import="utilitarios.cOtros"%>
<%@page import="clases.cDN"%>
<%@page import="dao_dn.DocumentoNotificacion"%>
<%
    Integer cDN = 0;
    DocumentoNotificacion objDN = null;
    try {
        cDN = Integer.parseInt(request.getParameter("cDN"));
        objDN = new cDN().leer_cod(cDN);
    } catch (Exception e) {
        response.sendRedirect("../sDN?accion=mantenimiento&parametro=ultimo");
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
        <script type="text/javascript" src="../librerias/tramite_documentario/mantenimiento.js"></script>
        <script type="text/javascript" src="../librerias/utilitarios/validaciones.js"></script>
    </head>
    <body>
        <div id="wrap">
            <div id="right">
                <h3 class="titulo">MANTENIMIENTO DE TRÁMITES DE TARJETAS <button id="bBuscar" class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="search"></span></button></h3>
                <table class="reporte-tabla-1">
                    <thead>
                        <%
                            if (objDN == null) {
                        %>
                        <tr>
                            <th colspan="3" class="medio" style="width: 600px;">
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=primero"><span><span><span class="first">Primero</span></span></span></a>
                                <a class="sexybutton" ><span><span><span class="prev">Anterior</span></span></span></a>
                                <a class="sexybutton" ><span><span><span class="next">Siguiente</span></span></span></a>
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=ultimo"><span><span><span class="last">Último</span></span></span></a>
                            </th>                            
                            <th>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="registrar.jsp"><span class="add"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="edit"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="delete"></span></a>
                            </th>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                            <th colspan="3" class="medio" >
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=primero"><span><span><span class="first">Primero</span></span></span></a>
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=anterior&cDN=<%=objDN.getCodDocumentoNotificacion()%>"><span><span><span class="prev">Anterior</span></span></span></a>
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=siguiente&cDN=<%=objDN.getCodDocumentoNotificacion()%>"><span><span><span class="next">Siguiente</span></span></span></a>
                                <a class="sexybutton" href="../sDN?accion=mantenimiento&parametro=ultimo"><span><span><span class="last">Último</span></span></span></a>
                            </th>
                            <th>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="registrar.jsp"><span class="add"></span></a>
                                <a class="sexybutton sexyicononly sexysimple sexysmall sexypropio" href="editar.jsp?cDN=<%=objDN.getCodDocumentoNotificacion()%>"><span class="edit"></span></a>
                                <button id="bEliminar" class="sexybutton sexyicononly sexysimple sexysmall sexypropio"><span class="delete"></span></button>
                            </th>
                        </tr>
                        <%
                            }
                        %>
                    </thead>
                    <tbody>
                        <%
                            if (objDN == null) {
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
                                    <input type="text" name="codDocumentoNotificacion" id="codDocumentoNotificacion" value="<%=objDN.getCodDocumentoNotificacion()%>" class="ocultar"/>
                                    <span><%=new cOtros().agregarCeros_int(objDN.getCodDocumentoNotificacion(), 8)%></span>
                                </div>
                            </td>
                            <th class="ancho120px"><span><label>SUCURSAL</label></span></th>
                            <td class="ancho240px contenedorEntrada">
                                <div>
                                    <span><%=objDN.getSucursal()%></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>APE.-NOM. / RAZÓN SOCIAL</label></span></th>
                            <td colspan="3" class="contenedorEntrada">
                                <div><%=objDN.getCliente()%></div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>PROPIETARIO</label></span></th>
                            <td class="contenedorEntrada">                                
                                <div>
                                    <span><%=objDN.getPropietario()%></span>
                                </div>
                            </td>
                            <th><span><label>F. ENTREGA</label></span></th>
                            <td class="contenedorEntrada"><div><%=new cManejoFechas().DateAString(objDN.getFechaEntrega())%></div></td>
                        </tr>
                        <tr>
                            <th><span><label>N° PLACA</label></span></th>
                            <td class="contenedorEntrada">
                                <div><%=objDN.getPlacaNumero()%></div>
                            </td>
                            <th><span><label>N° TÍTULO</label></span></th>
                            <td class="contenedorEntrada">
                                <div><%=objDN.getTituloNumero()%></div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>N° MOTOR</label></span></th>
                            <td class="contenedorEntrada">
                                <div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getMotorNumero())%></div>
                            </td>
                            <th><span><label>N° CHASÍS</label></span></th>
                            <td class="contenedorEntrada alto60px">
                                <div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getChasisNumero())%></div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>MARCA</label></span></th>
                            <td class="contenedorEntrada">
                                <div>
                                    <span><%=objDN.getMarca()%></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>CARROCERÍA</label></span></th>
                            <td class="contenedorEntrada">
                                <div><%=objDN.getCarroceria()%></div>
                            </td>
                            <th><span><label>ESTADO</label></span></th>
                            <td class="contenedorEntrada">
                                <div>
                                    <span><%=objDN.getEstado()%></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span><label>OBSERVACIÓN</label></span></th>
                            <td colspan="3" class="contenedorEntrada alto60px">
                                <div><%=new cOtros().replace_comillas_comillasD_barraInvertida(objDN.getObservacion())%></div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!--dialog's-->
                <div id="dEliminarConfirmar" title="Confirmación de eliminar" style="font-size: 14px;">
                    <div class="ui-state-error ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                            <strong>¡Alerta!</strong> Sr. Usuario ¿confirma borrar este registro? Este proceso no podrá deshacerse.</p>
                    </div>
                </div>
                <div id="dBuscar" title="Buscar registro" style="padding: 20px;">
                    <div style="overflow: auto">
                        <table class="reporte-tabla-1">
                            <thead>
                                <tr>
                                    <th class="ancho60px"><span>Buscar</span></th>
                                    <td class=" contenedorEntrada" style="width: 600px;">
                                        <input type="text" name="buscar" id="buscar" value="" class="entrada anchoTotal mayuscula limpiar" />
                                    </td>
                                    <td>
                                        <button id="bBuscar2" type="button" class="sexybutton sexyicononly sexysimple sexysmall sexypropio" ><span class="search"></span></button>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <table class="reporte-tabla-2 " style="margin-top: 10px; font-size: 9px; width: 1000px;">
                            <thead>
                                <tr>
                                    <th class="ancho60px"><span>CÓDIGO</span></th>
                                    <th class="ancho240px"><span>CLIENTE</span></th>
                                    <th class="ancho140px"><span>PROPIETARIO</span></th>
                                    <th class="ancho80px"><span>N° PLACA</span></th>
                                    <th class="ancho140px"><span>N° MOTOR</span></th>
                                    <th class="ancho140px"><span>N° CHASÍS</span></th>
                                    <th class="ancho80px"><span>ESTADO</span></th>
                                    <th><span>F. ENTREGA</span></th>
                                </tr>
                            </thead>
                        </table>
                        <div id="dCuerpo" style="width: 1000px; height: 340px;">

                        </div>
                    </div>
                </div>
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