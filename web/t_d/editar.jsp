<%-- 
    Document   : editar
    Created on : 31/01/2014, 09:57:57 AM
    Author     : Henrri
--%>

<%@page import="utilitarios.cManejoFechas"%>
<%@page import="utilitarios.cOtros"%>
<%@page import="clases.cDN"%>
<%@page import="dao_dn.DocumentoNotificacion"%>
<%@page import="dao_dn.Extra"%>
<%@page import="java.util.Iterator"%>
<%@page import="clases.cExtra"%>
<%@page import="java.util.List"%>

<%
    Integer cDN = 0;
    DocumentoNotificacion objDN = null;
    try {
        cDN = Integer.parseInt(request.getParameter("cDN"));
        objDN = new cDN().leer_cod(cDN);
        if (objDN == null) {
            response.sendRedirect("../sDN?accion=mantenimiento&parametro=ultimo");
        }
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
        <script type="text/javascript" src="../librerias/jquery-ui/jquery-ui-1.10.3.custom/js/i18n/jquery.ui.datepicker-es-min.js"></script>
        <script type="text/javascript" src="../librerias/mask/jquery.mask.min.js"></script>
        <script type="text/javascript" src="../librerias/utilitarios/validaciones.js"></script>
        <script type="text/javascript" src="../librerias/tramite_documentario/editar.js"></script>
    </head>
    <body>
        <input type="hidden" name="paginaActualPermiso" value="1" title="MANTENIMIENTO DE CLIENTES"/>
        <div id="wrap">
            <div id="right">
                <h3 class="titulo">EDITAR</h3>
                <form  id="formTramiteDocumentario">
                    <table class="reporte-tabla-1">
                        <thead>
                            <tr>
                                <th colspan="4"><span class="espaciado5">EDICIÓN DE TRÁMITE DE TARJETA</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr id="trBoton">
                                <th colspan="4">
                                    <button class="sexybutton" type="button"><span><span><span class="cancel">Cancelar</span></span></span></button>
                                    <button class="sexybutton" type="reset"><span><span><span class="undo">Restaurar</span></span></span></button>
                                    <button id="bRegistrar" class="sexybutton" type="submit"><span><span><span class="save">Registrar</span></span></span></button>
                                </th>
                            </tr>
                        </tfoot>
                        <tbody>
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
                                    <%
                                        List sucursalList = new cExtra().leer_sucursal();
                                    %>
                                    <div>
                                        <select id="sucursal" name="sucursal" class="contenedorEntrada anchoTotal limpiar">
                                            <option value="">Seleccionar</option>
                                            <%
                                                for (Iterator it = sucursalList.iterator(); it.hasNext();) {
                                                    Extra objExtra = (Extra) it.next();
                                            %>
                                            <option value="<%=objExtra.getLetra()%>" <%if (objExtra.getLetra().equals(objDN.getSucursal())) {%>selected=""<%}%>><%=objExtra.getLetra()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>APE.-NOM. / RAZÓN SOCIAL</label></span></th>
                                <td colspan="3" class="contenedorEntrada">
                                    <div><input type="text" name="cliente" id="cliente" value="<%=objDN.getCliente()%>" class="entrada anchoTotal mayuscula limpiar"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>PROPIETARIO</label></span></th>
                                <td class="contenedorEntrada">
                                    <%
                                        List propietarioList = new cExtra().leer_propietario();
                                    %>
                                    <div>
                                        <select id="propietario" name="propietario" class="contenedorEntrada anchoTotal limpiar">
                                            <option value="">Seleccionar</option>
                                            <%
                                                for (Iterator it = propietarioList.iterator(); it.hasNext();) {
                                                    Extra objExtra = (Extra) it.next();
                                            %>
                                            <option value="<%=objExtra.getLetra()%>" <%if (objExtra.getLetra().equals(objDN.getPropietario())) {%>selected=""<%}%>><%=objExtra.getLetra()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </td>
                                <th><span><label>F. ENTREGA</label></span></th>
                                <td class="contenedorEntrada"><div><input type="text" name="fechaEntrega" id="fechaEntrega" value="<%=new cManejoFechas().DateAString(objDN.getFechaEntrega())%>" class="entrada anchoTotal mayuscula limpiar"/></div></td>
                            </tr>
                            <tr>
                                <th><span><label>N° PLACA</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="placaNumero" id="placaNumero" value="<%=objDN.getPlacaNumero()%>" class="entrada anchoTotal mayuscula limpiar"/></div>
                                </td>
                                <th><span><label>N° TÍTULO</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="tituloNumero" id="tituloNumero" value="<%=objDN.getTituloNumero()%>" class="entrada anchoTotal mayuscula limpiar"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>N° MOTOR</label></span></th>
                                <td class="contenedorEntrada">
                                    <textarea name="motorNumero" id="motorNumero" class="entrada anchoTotal mayuscula alto60px limpiar"><%=objDN.getMotorNumero()%></textarea>
                                </td>
                                <th><span><label>N° CHASÍS</label></span></th>
                                <td class="contenedorEntrada">
                                    <textarea name="chasisNumero" id="chasisNumero" class="entrada anchoTotal mayuscula alto60px limpiar"><%=objDN.getMotorNumero()%></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>MARCA</label></span></th>
                                <td class="contenedorEntrada">
                                    <%
                                        List marcaList = new cExtra().leer_marca();
                                    %>
                                    <div>
                                        <select id="marca" name="marca" class="contenedorEntrada anchoTotal limpiar">
                                            <option value="">Seleccionar</option>
                                            <%
                                                for (Iterator it = marcaList.iterator(); it.hasNext();) {
                                                    Extra objExtra = (Extra) it.next();
                                            %>
                                            <option value="<%=objExtra.getLetra()%>" <%if (objExtra.getLetra().equals(objDN.getMarca())) {%>selected=""<%}%>><%=objExtra.getLetra()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>CARROCERÍA</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="carroceria" id="carroceria" value="<%=objDN.getCarroceria()%>" class="entrada anchoTotal mayuscula limpiar"/></div>
                                </td>
                                <th><span><label>ESTADO</label></span></th>
                                <td class="contenedorEntrada">
                                    <%
                                        List estadoList = new cExtra().leer_estado();
                                    %>
                                    <div>
                                        <select id="estado" name="estado" class="contenedorEntrada anchoTotal limpiar">
                                            <option value="">Seleccionar</option>
                                            <%
                                                for (Iterator it = estadoList.iterator(); it.hasNext();) {
                                                    Extra objExtra = (Extra) it.next();
                                            %>
                                            <option value="<%=objExtra.getLetra()%>" <%if (objExtra.getLetra().equals(objDN.getEstado())) {%>selected=""<%}%>><%=objExtra.getLetra()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>OBSERVACIÓN</label></span></th>
                                <td colspan="3" class="contenedorEntrada">
                                    <textarea name="observacion" id="observacion" class="entrada anchoTotal mayuscula alto60px limpiar"><%=objDN.getObservacion()%></textarea>
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