$(function () {
    

$('envio').submit(function(e){

   
    $.ajax({
        url: '/registro_juridico',  
        data: $('envio').serialize(),        
        type: 'POST',
        
    }).done(function(response){

        console.log("Terminó la petición",response);                

    }).fail(function(response){
        $('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

    e.preventDefault();

});
});

$(function(){

    $("#Continuar").click(function(){
                
        $("#fondo3").fadeOut("slow");       
        $("#fondo4").fadeIn("slow");     
        $("#fondo3").css("display", "none");            				

    });          


    $("#Regresar").click(function(){
        $("#fondo3").css("display", "block");   
        $("#fondo4").fadeOut("slow");     
        $("#fondo3").fadeIn("slow");   
    });      
    
    $("#continuar2").click(function(){

        $("#fondo4").fadeOut("slow");
        $("#fondo5").fadeIn("slow");
        $("#fondo4").css("display","none");
    });  

    $("#Regresar2").click(function(){
        $("#fondo4").css("display", "block");   
        $("#fondo5").fadeOut("slow");     
        $("#fondo4").fadeIn("slow");   
    });      
    

});