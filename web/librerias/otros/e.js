/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('#bRegistrar').click(function(event) {
        if (fValidar()) {
            fRegistrar();
        }
        event.preventDefault();
    });
});

$(function() {

});

function fValidar() {
    var mensaje = '';
    var estado = true;
    if (!fValidarMinimo($('#letra').val(), 4)) {
        estado = false;
        mensaje += '*' + $('#accionTipo').val() + ' mínimo 4 caracteres.<br>';
    }
    if (!estado) {
        fAlerta(mensaje);
    }
    return estado;
}
;

function fRegistrar() {
    var data = $('#fExtra').serialize() + '&accion=editar';
    var url = '../sExtra';
    try {
        $.ajax({
            type: 'post',
            url: url,
            data: data,
            beforeSend: function() {
                $('#trBoton').addClass('ocultar');
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                $('#trBoton').removeClass('ocultar');
                fAlerta(errorThrown + '(error)');
            },
            success: function(ajaxResponse, textStatus) {
                $('#trBoton').removeClass('ocultar');
                if ($.isNumeric(ajaxResponse)) {
                    $(location).attr('href', 'eM.jsp?accionTipo=' + $('#accionTipo').val() + '&codExtraInteger=' + ajaxResponse);
                } else {
                    fAlerta(ajaxResponse);
                }
            },
            statusCode: {
                404: function() {
                    fErrorServidor('Página no encontrada(' + url + ').');
                }
            }
        });
    }
    catch (ex) {
        $('#trBoton').removeClass('ocultar');
        fErrorServidor(ex);
    }
}
;