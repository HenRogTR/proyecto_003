/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//<editor-fold defaultstate="collapsed" desc=". Clic en el signo + de la izquierda para mas detalles.">

//</editor-fold>

$(document).ready(function() {
    var data = '';
    var url = '';
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
});
