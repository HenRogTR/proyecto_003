/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('#bEliminar').click(function() {
        $('#dEliminarConfirmar').dialog('open');
    });
    $('#bBuscar')
            .click(function() {
                $('#dBuscar').dialog('open');
            });
    $('#bBuscar2').click(function() {
        if (fValidarMinimo($('#buscar').val(), 3)) {
            fBuscar();
        } else {
            fAlerta('Ingrese como mínimo 3 caracteres.');
        }
    });

    $('#buscar').keypress(function(event) {
        var key = event.charCode ? event.charCode : (event.keyCode ? event.keyCode : 0);
        if (key == 13) {
            if (fValidarMinimo($('#buscar').val(), 3)) {
                fBuscar();
            } else {
                fAlerta('Ingrese como mínimo 3 caracteres.');
            }
            event.preventDefault();//para el caso de ie se ejecuta como enter al boton y se cerraba el dialog.
        }
    });
});

$(function() {
    $('#dEliminarConfirmar').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 200,
        width: 400,
        buttons: {
            Cancelar: function() {
                $(this).dialog('close');
            },
            Borrar: function() {
                fEliminar();
            }
        },
        close: function() {
            $(this).dialog('close');
        }
    });
    $('#dBuscar').dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        height: 550,
        width: 1000,
        buttons: {
            Cerrar: function() {
                $(this).dialog('close');
            }
        },
        close: function() {
            $(this).dialog('close');
        }
    });
});

function fEliminar() {
    var data = {
        cDN: $('#codDocumentoNotificacion').val(),
        accion: 'eliminar'
    };
    var url = '../sDN';
    try {
        $.ajax({
            type: 'post',
            url: url,
            data: data,
            beforeSend: function() {

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                fAlerta(errorThrown + '()');
            },
            success: function(ajaxResponse, textStatus) {
                $('#dEliminarConfirmar').dialog('close');
                if ($.isNumeric(ajaxResponse)) {
                    $(location).attr('href', '../sDN?accion=mantenimiento&parametro=ultimo');
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
        fErrorServidor(ex);
    }
}
;

function fBuscar() {
    var data = {
        term: $('#buscar').val()
    };
    var url = 'ajax/buscar.jsp';
    try {
        $.ajax({
            type: 'post',
            url: url,
            data: data,
            beforeSend: function() {

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                fAlerta(errorThrown + '()');
            },
            success: function(ajaxResponse, textStatus) {
                $('#dCuerpo').empty().append(ajaxResponse);
            },
            statusCode: {
                404: function() {
                    fErrorServidor('Página no encontrada(' + url + ').');
                }
            }
        });
    }
    catch (ex) {
        fErrorServidor(ex);
    }
}
;

