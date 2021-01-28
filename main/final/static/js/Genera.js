


 $('#Genera').click(function(){

     $('form').submit(function(e){

        $.ajax({
                
            url:   '/Genera/pdf',
            type: 'POST',
            data:  $('form').serialize(),
            
                
            }).done(function(response){
                
                console.log(response);
                
                if(response['error'])
                    c_error(response['error']);
                
                else if (response['invalido'])
                    c_error(response['invalido']);
                
                else
                    window.location.href =  "/";				
                
            }).fail(function(response){
                c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
            });

        e.preventDefault();
    
    });
});



