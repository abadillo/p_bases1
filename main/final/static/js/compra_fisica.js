
function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};


$(function(){

    var flag;


    document.addEventListener("keyup", function(event) {
        if (event.code === 'Enter') {
            $("#buscar").click();
        }
    });


    $("#buscar").click(function(){    
       
        var form = $('form');
        flag = 0;
     
        if (!(form[0][0].checkValidity())){
            form[0][0].reportValidity();
            flag = 1;                        
        }
            
        
        if (flag == 0 ){
            
            var datos_cli;
            var item = $(inputitem).val();
            flag = 1;
            
            $.ajax({
                        
                url:   '/manejo_natural',
                type: 'GET',
                data: {
                    'item': item,
                },
                async: false, 
                        
            
                }).done(function(response){
                    
                    if (response['error'])
                        alerta(response['error']);
                    else if (response['invalido'])
                        alerta(response['invalido']);

                    else{
                        datos_cli = response;
                        flag = 0 
                        
                        panel_str = []
                        id_cliente = datos_cli['cl_id'];

                        $("#datos_clid").html( 'Cliente N°: '+id_cliente )

                        for (var key of Object.keys(datos_cli))
                            if (datos_cli[key] != '' && key != 'us_contrasena' )
                                panel_str.push(key + ": " +datos_cli[key] + ',  ' );

                        $("#datos_cliente").html( panel_str)
                    }
                    

                }).fail(function(){
                    alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
                });

        
        }

    });  

    $("#Continuar").click(function(){    
       
        var form = $('form');
                
        if (!(form[0][0].checkValidity())){
            form[0][0].reportValidity();
            flag = 0;                          
        }
            
        
        if (flag == 0 ){
            
            $.ajax({
            
                url:   '/manejo_carrito',
                data:  {'id_cliente' : id_cliente },
                type: 'POST',
                async: false,
                    
                }).done(function(response){
                    
                    console.log(response);
                    
                    if(response['error'])
                        alerta(response['error']);
                    
                    else if (response['invalido'])
                        alerta(response['invalido']);
                    
                    else{
                        id_carrito = response;
                        
                        $("#fondo3").fadeOut("slow");       
                        $("#fondo4").fadeIn("slow");     
                        $("#fondo3").css("display", "none"); 

                        mostrar_carrito(id_carrito);
                    }               
                    
                }).fail(function(response){
                    alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
                });

                 
        }

    });  




    $("#Regresar").click(function(){

        $("#fondo3").css("display", "block");   
        $("#fondo4").fadeOut("slow");     
        $("#fondo3").fadeIn("slow");   
    });      
    
    $("#Continuar2").click(function(){

        var form = $('form');
        flag = 0;
     
        for (var n = 9; n <= 19; n++){
            if (!(form[0][n].checkValidity())){
                form[0][n].reportValidity();
                console.log(form[0][n]);
                console.log(n);
                flag = 1;
                break;
            }
        }
    
        flag = 0;
    
        if (flag == 0 ){
            $("#fondo4").fadeOut("slow");
            $("#fondo5").fadeIn("slow");
            $("#fondo4").css("display","none");
        }
    });  

        

});