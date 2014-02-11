/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(event) {
    $('#fechaEntrega')
            .mask('00/00/0000')
            .blur(function(event) {
                if (!fValidarFecha(this.value)) {
                    this.value = '';
                }
            })
            ;

    $('#bRegistrar').click(function(event) {
        if (fValidar()) {
            fRegistrar();
        }
        event.preventDefault();
    });

});

$(function() {

    $('#fechaEntrega').datepicker({
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 2
    });

});

function fValidar() {
    var mensaje = '';
    var estado = true;
    if (!fValidarRequerido($('#sucursal').val())) {
        estado = false;
        mensaje += '* Seleccione sucursal.<br>';
    }
    if (!fValidarMinimo($('#cliente').val(), 4)) {
        estado = false;
        mensaje += '* Cliente como mínimo 4 caracteres.<br>';
    }
    if (!fValidarRequerido($('#propietario').val())) {
        estado = false;
        mensaje += '* Seleccione propietario.<br>';
    }
    var fechaEntrega = $('#fechaEntrega').val();
    if (!fValidarFecha(fechaEntrega)) {
        if (fechaEntrega != '') {
            estado = false;
            mensaje += '* Formato de fecha de enrtega incorrecta.<br>';
        }
    }
    if (!fValidarRequerido($('#placaNumero').val())) {
        estado = false;
        mensaje += '* Ingrese número de placa.<br>';
    }
    if (!fValidarRequerido($('#tituloNumero').val())) {
        estado = false;
        mensaje += '* Ingrese número de título.<br>';
    }
    if (!fValidarRequerido($('#motorNumero').val())) {
        estado = false;
        mensaje += '* Ingrese número de motor.<br>';
    }
    if (!fValidarRequerido($('#chasisNumero').val())) {
        estado = false;
        mensaje += '* Ingrese número de chasís.<br>';
    }
    if (!estado) {
        fAlerta(mensaje);
    }
    return estado;
}
;

function fRegistrar() {
    var data = $('#formTramiteDocumentario').serialize() + '&accion=registrar';
    var url = '../sDN';
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
                fAlerta(errorThrown + '()');
            },
            success: function(ajaxResponse, textStatus) {
                $('#trBoton').removeClass('ocultar');
                if ($.isNumeric(ajaxResponse)) {
                    $(location).attr('href', 'mantenimiento.jsp?cDN=' + ajaxResponse);
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
