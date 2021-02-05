function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};

$(function(){

     $('form').submit(function(e){

        $.ajax({
                
            url:   '/Genera',
            type: 'POST',
            data:  $('form').serialize(),
          
                
            }).done(function(response){
                
                console.log(response);
                
                if(response['error'])
                    c_error(response['error']);
                
                else if (response['invalido'])
                    c_error(response['invalido']);
                
                else
                    window.location.href =  "/pdf";				
                
            }).fail(function(response){
                c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
            });

        e.preventDefault();
    
    });
});



