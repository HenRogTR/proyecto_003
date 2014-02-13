<%-- 
    Document   : reporte
    Created on : 31/01/2014, 12:42:24 PM
    Author     : Henrri
--%>

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
                    <h3 class="titulo">REPORTES</h3>
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