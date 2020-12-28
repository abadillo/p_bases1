$(document).ready(function() {

    var estados;
    var municipios;
    var parroquias;


    var id_estado;
    var id_municipio;
    var id_parroquia;

    $.ajax({
                
        url:   '/lugares',
        type: 'GET',
        data: {
            'LUGAR': 'ESTADO' ,
            'FK_LUGAR': '',
        },
        async: false, 
            
        }).done(function(resp){
            
            console.log(resp);
            estados = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>ESTADO</option>');

            for (var i=0, l=estados.length; i<l; i++){
                opciones.push('<option value="'+estados[i].lu_codigo+'">'+estados[i].lu_nombre+'<opciones>');
            }

            $('#selectestado').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

   
    $('#selectestado').change(function() {

        id_estado = $(this).find('option:selected').val();
        
        $.ajax({
                
            url:   '/lugares',
            type: 'GET',
            data: {
                'LUGAR': 'MUNICIPIO' ,
                'FK_LUGAR': id_estado,
            },
            async: false, 
                
            }).done(function(resp){
                
                console.log(resp);
                municipios = resp;         
    
                var opciones = [];
    
                opciones.push('<option value="default" selected disabled>MUNICIPIOS</option>');
    
                for (var i=0, l=municipios.length; i<l; i++){
                    opciones.push('<option value="'+municipios[i].lu_codigo+'">'+municipios[i].lu_nombre+'<opciones>');
                }
    
                $('#selectmunicipio').html(opciones.join(''));
    
                
            }).fail(function(resp){
                $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
        });
        
    });
    

    $('#selectmunicipio').change(function() {

        id_municipio = $(this).find('option:selected').val();
        

        $.ajax({
                
            url:   '/lugares',
            type: 'GET',
            data: {
                'LUGAR': 'PARROQUIA' ,
                'FK_LUGAR': id_municipio,
            },
            async: false, 
                
            }).done(function(resp){
                
                console.log(resp);
                parroquias = resp;         
    
                var opciones = [];

                opciones.push('<option value="default" selected disabled>PARROQUIA</option>');

                for (var i=0, l=parroquias.length; i<l; i++){
                    opciones.push('<option value="'+parroquias[i].lu_codigo+'">'+parroquias[i].lu_nombre+'<opciones>');
                }

                $('#selectparroquia').html(opciones.join(''));
    
                
            }).fail(function(resp){
                $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
        });
          
        
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



