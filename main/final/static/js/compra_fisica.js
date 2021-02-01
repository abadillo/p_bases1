
function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};



$(document).ready(function() {

    
    
   console.log("ready");

   

});





$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/manejo_juridico',
            data:  $('form').serialize(),
            type: 'POST',
                
            }).done(function(response){
                
                console.log(response);
                
                if(response['error'])
					alerta(response['error']);
				
				else if (response['invalido'])
                    alerta(response['invalido']);
				
                else
                    window.location.href =  "/mostrar/juridicos";
								
                
            }).fail(function(response){
                alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
            });

        e.preventDefault();
    
    });
});

 

var id_cliente = 2;


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
            flag = 0;                           /*CAMBIAR A 1*/
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
            flag = 0;                           /*CAMBIAR A 1*/
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
                        response;
                        
                        $("#fondo3").fadeOut("slow");       
                        $("#fondo4").fadeIn("slow");     
                        $("#fondo3").css("display", "none"); 

                        mostrar_carrito(response);
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

    $("#Regresar2").click(function(){

        $("#fondo4").css("display", "block");   
        $("#fondo5").fadeOut("slow");     
        $("#fondo4").fadeIn("slow");   
    });      





    $("#boton-dos").click(function(){

        $("#Datos-extra1").fadeOut("slow");
        $("#Datos-extra2").fadeIn("slow");
        $("#Datos-extra1").css("display","none");  
        document.getElementById("boton-dos").style.backgroundColor= "skyblue";
        $("#boton-uno").css("color","#fff");  
        $("#boton-uno").css("background-color","#007bff");
        $("#boton-uno").css("border-color","007bff");
             
    });

    $("#boton-uno").click(function(){

        $("#Datos-extra2").fadeOut("speed");
        $("#Datos-extra1").css("display","block");      
        $("#Datos-extra1").fadeIn("slow");   
        document.getElementById("boton-uno").style.backgroundColor= "skyblue";
        $("#boton-dos").css("color","#fff");  
        $("#boton-dos").css("background-color","#6c757d");
        $("#boton-dos").css("border-color","6c757d");     
           
    });   
    
    

    $("#selecttipo1").click(function(){
        window.location.href = "/registro/natural";

    });
   

});