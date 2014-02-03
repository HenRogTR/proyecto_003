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
//        if (fValidar()) {
//            fRegistrar();
//        }
//        event.preventDefault();
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
    var estado = false;
    if (!fValidarRequerido($('#sucursal').val())) {
        estado = true;
        mensaje += '* Seleccione sucursal.<br>';
    }
    if (!fValidarMinimo($('#cliente').val(), 4)) {
        estado = true;
        mensaje += '* Cliente como mínimo 4 caracteres.<br>';
    }
    if (!fValidarRequerido($('#propietario').val())) {
        estado = true;
        mensaje += '* Seleccione propietario.<br>';
    }
    var fechaEntrega = $('#fechaEntrega').val();
    if (!fValidarFecha(fechaEntrega)) {
        if (fechaEntrega != '') {
            estado = true;
            mensaje += '* Formato de fecha de enrtega incorrecta.<br>';
        }
    }
    if (!fValidarRequerido($('#placaNumero').val())) {
        estado = true;
        mensaje += '* Ingrese número de placa.<br>';
    }
    if (!fValidarRequerido($('#placaTitulo').val())) {
        estado = true;
        mensaje += '* Ingrese número de título.<br>';
    }
    if (!fValidarRequerido($('#motorNumero').val())) {
        estado = true;
        mensaje += '* Ingrese número de motor.<br>';
    }
    if (!fValidarRequerido($('#chasisNumero').val())) {
        estado = true;
        mensaje += '* Ingrese número de chasís.<br>';
    }
    if (estado) {
        fAlerta(mensaje);
    }
    return estado;
}
;

function fRegistrar() {

}
;
