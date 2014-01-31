<%-- 
    Document   : piePagina
    Created on : 20/08/2013, 04:23:48 PM
    Author     : Henrri***
--%>

<div class="ui-widget">
    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
        <p>
            <strong><a href="#" id="equipoTrabajo">Equipo de trabajo</a></strong>
        </p>
        <strong><a href="#" id="novedades">Novedades</a></p></strong>
    </div>
</div>
<div id="dEquipoTrabajo" title="Equipo de trabajo">
    <strong>Jefe de proyecto:</strong> Danny Sandoval Pezo<br>
    <strong>Analista de Sistemas:</strong> Danny Sandoval Pezo - Henrri Trujillo Romero<br>
    <strong>Programaci�n:</strong> Henrri Trujillo Romero<br>
    <strong>Prueba de errores y correci�n:</strong> Danny Sandoval Pezo - Henrri Trujillo Romero<br>
    <strong>Colaboradores:</strong> Ignacio Lamberto P. - Richar Lopez M. - Arturo Vargas B.
</div>
<!--Error del servidor-->
<div class="ui-widget" id="dServidorError" title="Error del servidor" style="font-size: 18px;">
    <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
            <strong>Error interno del servidor </strong><br><label id="lServidorError"></label><br> Si es la primera vez reintente o sino contacte con el administrador.</p>
    </div>
</div>
<!--Mensaje de alerta-->
<div id="dMensajeAlerta" title="Mensaje de alerta.">
    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
            <strong>�Alerta!</strong><br> <div id="dMensajeAlertaDiv"></div></p>
    </div>
</div>

<div id="dAlerta" title="Mensaje de alerta.">
    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
            <strong>�Alerta!</strong><br>
            <span id="dAlertaDiv"></span></p>
    </div>
</div>
<!--Procesando petici�n-->
<div id="dProcesandoPeticion" title="Procesando petici�n">
    <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em; text-align: center">
        <p>
            <img src="../imagenes/loading_1.gif" style="height: 100px;"/><br>
            <strong><label id="lProcesandoPeticion">�Procesando petici�n!</label> Espere por favor...</strong></p>
    </div>
</div>

<!--div libre-->
<div id="dLibre" style="text-align: center; vertical-align: middle;">
    <div id="dLibreSub" class="izquierda">
        <img src="../imagenes/loading_1.gif" style="height: 50px;"/>
    </div>
</div>

<div id="dNovedades" title="Novedades" style="font-size: 10px;">
    <div style="background: #F1F1F7">
        <h3 class="titulo">30/01/2014</h3>
        <p>            
            * Pruebas de errores.<br>
        </p>
    </div>
</div>