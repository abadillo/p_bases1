$(document).ready(function() {

    var lugares;
    var id_estado;
    var id_municipio;
    var id_parroquia;

    $.ajax({
                
        url:   '/lugares',
        type: 'GET',
        dataSrc: "",
            
        }).done(function(resp){
            
            console.log(resp);
            lugares = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>ESTADO</option>');

            for (var i=0, l=lugares.length; i<l; i++){
                if (lugares[i].lu_tipo == 'ESTADO')
                    opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
            }

            $('#selectestado').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

    
    $('#selectestado').change(function() {

        id_estado = $(this).find('option:selected').val();
        var opciones = [];

        opciones.push('<option value="default" selected disabled>MUNICIPIO</option>');

        for (var i=0, l=lugares.length; i<l; i++){
            if (lugares[i].lu_tipo == 'MUNICIPIO' && lugares[i].fk_lugar == id_estado )
                opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
        }

        $('#selectmunicipio').html(opciones.join(''));
        
    });
    

    $('#selectmunicipio').change(function() {

        id_municipio = $(this).find('option:selected').val();
        var opciones = [];

        opciones.push('<option value="default" selected disabled>PARROQUIA</option>');

        for (var i=0, l=lugares.length; i<l; i++){
            if (lugares[i].lu_tipo == 'PARROQUIA' && lugares[i].fk_lugar == id_municipio )
                opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
        }

        $('#selectparroquia').html(opciones.join(''));
        
    });

    
    $('#selectparroquia').change(function() {

        id_parroquia = $(this).find('option:selected').val();
    });
    



    
    var tiendas;
    var id_tienda;
    
    $.ajax({
                
        url:   '/tiendas',
        type: 'GET',
        dataSrc: "",
            
        }).done(function(resp){
            
            console.log(resp);
            tiendas = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>TIENDAS</option>');

            for (var i=0, l=tiendas.length; i<l; i++){
                opciones.push('<option value="'+tiendas[i].ti_codigo+'">'+tiendas[i].ti_nombre+'<opciones>');
            }

            $('#selecttienda').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

    
    $('#selecttienda').change(function() {

        id_tienda = $(this).find('option:selected').val();
        console.log(id_tienda);

    });

});


$(function () {    

    $('form').submit(function(e){
   
    $.ajax({
        url: '/registro_juridico',  
        data: $('form').serialize(),        
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

});