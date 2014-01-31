/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {

    $('.mayuscula').blur(function() {
        this.value = $.trim(this.value.toUpperCase());
    });

    $('#equipoTrabajo').click(function(event) {
        $('#dEquipoTrabajo').dialog('open');
        event.preventDefault();
    });
    $('#novedades').click(function(event) {
        $('#dNovedades').dialog('open');
        event.preventDefault();
    });

    $.ui.autocomplete.prototype._renderItem = function(ul, item) {
        var term = this.term.split(' ').join('|');
        var re = new RegExp("(" + term + ")", "gi");
        var t = item.label.replace(re, "<strong>$1</strong>");
        return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + t + "</a>")
                .appendTo(ul);
    };
});

$(function() {
    $("#ulMenu").menu();

    //<editor-fold defaultstate="collapsed" desc="dialog's. Clic en el signo + de la izquierda para mas detalles.">
    $('#dEquipoTrabajo').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 180,
        width: 600,
        buttons: {
            Aceptar: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            $(this).dialog("close");
        }
    });
    $('#dNovedades').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 500,
        width: 600,
        buttons: {
            Aceptar: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            $(this).dialog("close");
        }
    });

    $('#dServidorError').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 250,
        width: 600,
        buttons: {
            Aceptar: function() {
                $(this).dialog('close');
            }
        },
        close: function() {
            $(this).dialog('close');
        }
    });

    $("#dMensajeAlerta").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 250,
        width: 400,
        buttons: {
            Aceptar: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            $(this).dialog("close");
        }
    });

    $("#dAlerta").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 300,
        width: 500,
        buttons: {
            Aceptar: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            $(this).dialog("close");
        }
    });

    $("#dProcesandoPeticion").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 250,
        width: 400,
        close: function() {
            $(this).dialog("close");
        }
    });

    $('#dLibre').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 155,
        width: 150,
        close: function() {
            fDLibreReiniciar();
            $(this).dialog('close');
        },
        buttons: {
            Aceptar: function() {
                $(this).dialog('close');
            }
        }
    });
//</editor-fold>

});

//<editor-fold defaultstate="collapsed" desc="procesarRespuesta(ajaxResponse). Clic en el signo + de la izquierda para mas detalles.">
function procesarRespuesta(ajaxResponse) {
    var response;
    try {
        eval('response=' + ajaxResponse);
    } catch (ex) {
        response = null;
    }
    return response;
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fMensajeAlerta(mensaje). Clic en el signo + de la izquierda para mas detalles.">
function fMensajeAlerta(mensaje) {
    $('#dMensajeAlertaDiv').empty().append(mensaje);
    $('#dMensajeAlerta').dialog('open');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fAlerta(mensaje). Clic en el signo + de la izquierda para mas detalles.">
function fAlerta(mensaje) {
    $('#dAlertaDiv').empty().append('<br>' + mensaje);
    $('#dAlerta').dialog('open');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fAlertaCerrar(). Clic en el signo + de la izquierda para mas detalles.">
function fAlertaCerrar() {
    $('#dAlerta').dialog('close');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fProcesandoPeticion(mensaje). Clic en el signo + de la izquierda para mas detalles.">
function fProcesandoPeticion(mensaje) {
    $('#lProcesandoPeticion').text(mensaje);
    $('#dProcesandoPeticion').dialog('open');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fProcesandoPeticionCerrar(). Clic en el signo + de la izquierda para mas detalles.">
function fProcesandoPeticionCerrar() {
    $('#dProcesandoPeticion').dialog('close');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fRedireccionarEspera(direccion, tiempo). Clic en el signo + de la izquierda para mas detalles.">
function fRedireccionarEspera(direccion, tiempo) {
    setTimeout(function() {
        $(location).attr('href', direccion);
    }, tiempo);
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fEspererarGif(). Clic en el signo + de la izquierda para mas detalles.">
function  fEspererarGif() {
    return '<div class="esperando"><img alt="not found" src="../imagenes/loading.gif" style="height: 11px;"></div>';
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fDLibreAbrir(). Clic en el signo + de la izquierda para mas detalles.">
function fDLibreAbrir() {
    var $dLibre = $('#dLibre').dialog('open');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fDLibreCerrar(). Clic en el signo + de la izquierda para mas detalles.">
function fDLibreCerrar() {
    var $dLibre = $('#dLibre').dialog('close');
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fDLibreEditar(alto, ancho, titulo, contenido). Clic en el signo + de la izquierda para mas detalles.">
/**
 * 
 * @param {type} alto
 * @param {type} ancho
 * @param {type} titulo
 * @param {type} contenido
 * @returns {undefined}
 */
function fDLibreEditar(alto, ancho, titulo, contenido) {
    var $dLibreSub = $('#dLibreSub');
    var $dLibre = $('#dLibre');
    $dLibreSub.empty().append(contenido);
    $dLibre.dialog('option', 'height', alto);
    $dLibre.dialog('option', 'width', ancho);
    $dLibre.dialog('option', 'title', titulo);
}
;
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="fDLibreReiniciar(). Clic en el signo + de la izquierda para mas detalles.">
function fDLibreReiniciar() {
    var $dLibreSub = $('#dLibreSub');
    var $dLibre = $('#dLibre');
    $dLibreSub.empty().append('<img src="../imagenes/loading_1.gif" style="height: 50px;"/>');
    $dLibre.dialog('option', 'height', 155);
    $dLibre.dialog('option', 'width', 150);
    $dLibre.dialog('option', 'title', '');
}
;
//</editor-fold>
