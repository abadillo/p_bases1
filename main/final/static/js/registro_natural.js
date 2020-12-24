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


$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/registro_natural',
            data:  $('form').serialize(),
            type: 'POST',
                
            }).done(function(response){
                
                console.log(response);
                
                /*if (response['mensaje'] == 'correo o contraseña invalida')
                    $(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   )
                else
                    window.location.href =  "/"		*/			
                
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

    $("#selecttipo2").click(function(){
        window.location.href = "/registro_juridico";

          });
});



