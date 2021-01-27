
function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};





$(document).ready(function() {
    $.ajax({
                
        url:   '/sesion',
        type: 'POST',
        dataSrc: ""
            
        }).done(function(resp){
        
            console.log(resp)

            if (resp['mensaje'])
                $("#cerrar_sesion").hide();
            else
                $("#iniciar_sesion").hide();
            
        }).fail(function(resp){
            alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
    });

});



$(function(){
    
    
    $("#cerrar_sesion").click(function(){
        $.ajax({
                
            url:   '/sesion',
            type: 'DELETE',
            dataSrc: ""
                
            }).done(function(resp){
            
                if (resp) 
                    console.log(resp)
                
            }).fail(function(resp){
                alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });

    });
   

    $("#iniciar_sesion").click(function(){
                 
            window.location.href =  "/inicio_sesion"		

    });

});



