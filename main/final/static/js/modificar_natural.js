$(document).ready(function() {
    
    var id = document.getElementById("id_user").value;
    console.log(id);
    
    var datos_user;
 
    $.ajax({
                
        url:   '/modificar_natural/'+id,
        type: 'PUT',
        dataSrc: "",
        async: false,        
    
        }).done(function(resp){
            
            datos_user = resp;         

        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });


    var tienda_registro;

    $.ajax({
                
        url:   '/tiendas',
        type: 'GET',
        dataSrc: "",
        async: false, 
            
        }).done(function(resp){
            
            tiendas = resp;     
                      
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });


    
    var lugares;
    var idv_estado;
    var idv_municipio;
    var idv_parroquia;

    
    $.ajax({
                
        url:   '/lugares',
        type: 'GET',
        dataSrc: "",
        async: false, 
            
        }).done(function(resp){
            
            console.log(resp);
            lugares = resp; 

        });
           
    








    console.log(datos_user[0])

    document.getElementById("inputcedula").value = datos_user[0].cl_cedula;
    document.getElementById("inputcorreo").value = datos_user[0].cl_correo;
    document.getElementById("inputtelefono").value = "nada";
    document.getElementById("inputpnombre").value = datos_user[0].cl_p_nombre;
    document.getElementById("inputsnombre").value = datos_user[0].cl_s_nombre;
    document.getElementById("inputpapellido").value = datos_user[0].cl_p_apellido;
    document.getElementById("inputsapellido").value = datos_user[0].cl_s_apellido;
    document.getElementById("inputcont").value = datos_user[0].cl_contrasena;
    document.getElementById("inputrif").value = datos_user[0].cl_rif;
        
        
    for (var i=0, l=tiendas.length; i<l; i++){
        if (tiendas[i].ti_codigo == datos_user[0].fk_tienda)
            tienda_registro = tiendas[i].ti_nombre;
    }

    document.getElementById("tiendaregistro").value = tienda_registro;
    
 
    

    

    

    for (var i=0, l=lugares.length; i<l; i++){
        if (lugares[i].lu_codigo == datos_user[0].fk_lugar)
            document.getElementById("inputdir").value = lugares[i].lu_nombre;
            idv_parroquia = lugares[i].fk_lugar;
    }

    for (var i=0, l=lugares.length; i<l; i++){
        if (lugares[i].lu_codigo == idv_parroquia)
            idv_municipio = lugares[i].fk_lugar;
    }
    
    for (var i=0, l=lugares.length; i<l; i++){
        if (lugares[i].lu_codigo == idv_municipio)
            idv_estado = lugares[i].fk_lugar;
    }

    console.log(datos_user[0].fk_lugar)
    console.log(idv_parroquia)
    console.log(idv_municipio)
    console.log(idv_estado)



    var id_estado;
    var id_municipio;
    var id_parroquia;


    var opciones = [];

    opciones.push('<option value="default" selected disabled>ESTADO</option>');

    for (var i=0, l=lugares.length; i<l; i++){
        if (lugares[i].lu_codigo == idv_estado)
            opciones.push('<option selected value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
            
        else if (lugares[i].lu_tipo == 'ESTADO')
            opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
    }

    $('#selectestado').html(opciones.join(''));

    

    var opciones = [];
    opciones.push('<option value="default" selected disabled>MUNICIPIO</option>');

    for (var i=0, l=lugares.length; i<l; i++){

        if (lugares[i].lu_codigo == idv_municipio)
            opciones.push('<option selected value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');

        else if (lugares[i].lu_tipo == 'MUNICIPIO' && lugares[i].fk_lugar == id_estado )
            opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
    }

    $('#selectmunicipio').html(opciones.join(''));




    var opciones = [];
    opciones.push('<option value="default" selected disabled>PARROQUIA</option>');

    for (var i=0, l=lugares.length; i<l; i++){
        
        if (lugares[i].lu_codigo == idv_parroquia)
            opciones.push('<option selected value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');

        else if (lugares[i].lu_tipo == 'PARROQUIA' && lugares[i].fk_lugar == id_municipio )
            opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
    }

    $('#selectparroquia').html(opciones.join(''));
     






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

    

    $('#id_user').change(function() {
        
        id = document.getElementById("id_user").value;
        window.location.href =  "/modificar_natural/"+id;
        
    });



});


$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/modificar_natural',
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
    $("#Editar1").click(function(){
        alert("funciona");

    })


});
    
   





/*
$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/lugares',
            data:  $('form').serialize(),
            type: 'POST',
                
            }).done(function(response){
                
                console.log(response);
                
                if (response['mensaje'] == 'correo o contraseña invalida')
                    $(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   )
                else
                    window.location.href =  "/"			
                
            }).fail(function(response){
                $('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
            });

        e.preventDefault();
    
    });
});



*/