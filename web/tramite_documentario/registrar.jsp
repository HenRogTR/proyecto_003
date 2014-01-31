<%-- 
    Document   : registrar
    Created on : 31/01/2014, 09:57:46 AM
    Author     : Henrri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL DE TARJETAS DE PROPIEDAD</title>
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
                <h3 class="titulo">REGISTRAR</h3>
                <form action="../sTD">
                    <table class="reporte-tabla-1">
                        <thead>
                            <tr>
                                <th colspan="4"><span class="espaciado5">REGISTRO DE TRÁMITE DE TARJETA</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th colspan="4">
                                    <button class="sexybutton" type="button"><span><span><span class="cancel">Cancelar</span></span></span></button>
                                    <button class="sexybutton" type="reset"><span><span><span class="undo">Restaurar</span></span></span></button>
                                    <button class="sexybutton" type="submit"><span><span><span class="save">Registrar</span></span></span></button>
                                </th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <th class="ancho120px"><span><label>COD. REGISTRO</label></span></th>
                                <td class="ancho240px contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                                <th class="ancho120px"><span><label>SUCURSAL</label></span></th>
                                <td class="ancho240px">
                                    <div></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>APE.-NOM. / RAZÓN SOCIAL</label></span></th>
                                <td colspan="3" class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>PROPIETARIO</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                                <th><span><label>F. ENTREGA</label></span></th>
                                <td class="contenedorEntrada"><div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div></td>
                            </tr>
                            <tr>
                                <th><span><label>N° PLACA</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                                <th><span><label>N° TÍTULO</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>N° MOTOR</label></span></th>
                                <td class="contenedorEntrada">
                                    <textarea name="" id="" class="entrada anchoTotal mayuscula alto60px"></textarea>
                                </td>
                                <th><span><label>N° CHASÍS</label></span></th>
                                <td class="contenedorEntrada">
                                    <textarea name="" id="" class="entrada anchoTotal mayuscula alto60px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>CARROCERÍA</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                                <th><span><label>ESTADO</label></span></th>
                                <td class="contenedorEntrada">
                                    <div><input type="text" name="" id="" class="entrada anchoTotal mayuscula"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th><span><label>OBSERVACIÓN</label></span></th>
                                <td colspan="3" class="contenedorEntrada">
                                    <textarea name="" id="" class="entrada anchoTotal mayuscula alto60px"></textarea>
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