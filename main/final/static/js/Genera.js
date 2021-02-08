function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};

$(document).ready(function() {

    $("#ASISTENCIA").hide();   
   
    $("#HORARIO").hide();

    $("#INGRESO_EGRESO").hide();

    
    $("#HORARIO").show();
    $("#ASISTENCIA").show();   
    $("#INGRESO_EGRESO").show();
});


$(function(){

    $( ".target" ).change(function() {

        priv = $(this).find('option:selected').val();          
        
        
        
      

            $("#Genera").click(function(){            

                //var asis = priv;
                priv = $(this).find('option:selected').val();          
                alert(priv);

                $.ajax({
                        
                    url:   '/Genera/'+asis,
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

                });
       
    });
    
});

$(function(){
    $("#Genera3").click(function(){            

        $.ajax({
                    
                        url:   '/Genera/Ingreso',
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
        
            });
        });