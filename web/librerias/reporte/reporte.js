/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(e) {
    $('.aDN').click(function(e) {
        var $estado = $('#estado');
        if (!fValidarRequerido($estado.val())) {
            fAlerta('Seleccione estado.');
            return;
        }
        switch ($(this).attr('id')) {
            case 'rEstado':
                $(this).attr('target', '_blank').attr('href', 'reporte/r_e.jsp?estado=' + $estado.val());
                break;
            case 'rEstadoExcel':
                $(this).attr('target', '_blank').attr('href', 'reporte/r_eExcel.jsp?estado=' + $estado.val());
                break;
            default :
                fAlerta('Reporte no implementado.');
                break;
        }
    });
});

