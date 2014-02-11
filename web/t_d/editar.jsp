<%-- 
    Document   : editar
    Created on : 31/01/2014, 09:57:57 AM
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
                <div>
                    <h3 class="titulo">CONTROL DE TARJETAS DE PROPIEDAD</h3>
                    <div class="articles" style="font-size: 12px;padding: 10px;text-align: justify;">
                        Como llegar a Yucra desde el óvalo Saenz Peña.
                        <br /><br />
                        <img src="../librerias/imagenes/ruta_yucra.PNG" alt="Example pic" style="border: 3px solid #ccc;" />                        
                    </div>
                </div>
                <div>
                    <div style="width: 48%; float: left;">
                        <h3 class="titulo">MISIÓN</h3>
                        <div class="articles" style="font-size: 12px;padding: 10px;text-align: justify;">
                            Somos la empresa comercial que brinda servicio personalizado con una amplia gama de productos de calidada través de una cultura de valores.
                        </div>
                    </div>
                    <div style="width: 48%; float: right;">
                        <h3 class="titulo">VISIÓN</h3>
                        <div class="articles" style="font-size: 12px;padding: 10px;text-align: justify;">
                            Ser la empresa comercial con productos de calidad para la exigencia de cada necesidad brindando un servicio de excelencia.
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