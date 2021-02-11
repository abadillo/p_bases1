
function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};




$(document).ready(function() {
    
    $.ajax({
                
        url:   '/carrito_web',                 
        type: 'POST',
        dataSrc: ""
        
    }).done(function(resp){
        
        if(resp['error'])
            alerta(resp['error']);
        
        else if (resp['invalido'])
            alerta(resp['invalido']);
        
        else
            mostrar_carrito(resp)
          
    }).fail(function(response){
        alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
    });


    

});

$(function(){

    
    $("#boton_pagar").click(function(){
        console.log("bueno");
    });  

        
    $("#boton_regresar").click(function(){
        window.location.href =  '/'
    });  

});