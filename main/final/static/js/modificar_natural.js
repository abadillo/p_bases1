function lugares (lu_tipo, fk_lugar,sel_op){

    $.ajax({
                
        url:   '/lugares',
        type: 'GET',
        data: {
            'LUGAR': lu_tipo ,
            'FK_LUGAR': fk_lugar,
        },
        async: false, 
            
        }).done(function(resp){
        
            lugars = resp;          

            var opciones = [];

            opciones.push('<option value="0" selected disabled>'+lu_tipo+'</option>');

            for (var i=0, l=lugars.length; i<l; i++){

                if (sel_op == lugars[i].lu_codigo)
                    opciones.push('<option selected value="'+lugars[i].lu_codigo+'">'+lugars[i].lu_nombre+'<opciones>');
                else 
                    opciones.push('<option value="'+lugars[i].lu_codigo+'">'+lugars[i].lu_nombre+'<opciones>');

            }


            if (lu_tipo == 'ESTADO')
                $('#selectestado').html(opciones.join(''));
            else if (lu_tipo == 'MUNICIPIO')
                $('#selectmunicipio').html(opciones.join(''));
            else 
                $('#selectparroquia ').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });


};


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
    
    var resp2;

    $.ajax({
                
        url:   '/lugares',
        type: 'POST',
        data: {
            'fk_dir': datos_user[0].fk_lugar ,
        },
        async: false, 
            
        }).done(function(resp){
            
            resp2= resp;

        });



    var idv_estado = resp2['idv_estado'];
    var idv_municipio =  resp2['idv_municipio'];
    var idv_parroquia =  resp2['idv_parroquia'];

    console.log(datos_user[0].fk_lugar)
    console.log(idv_parroquia)
    console.log(idv_municipio)
    console.log(idv_estado)


    
    var id_estado;
    var id_municipio;
    var id_parroquia;


    lugares('ESTADO','',idv_estado);
    
    
    
    lugares('MUNICIPIO',idv_estado,idv_municipio);
    lugares('PARROQUIA',idv_municipio,idv_parroquia);

    

    $('#selectestado').change(function() {

        id_estado = $(this).find('option:selected').val();
        lugares('MUNICIPIO',id_estado,idv_municipio);
    });
        

    $('#selectmunicipio').change(function() {

        id_municipio = $(this).find('option:selected').val();
        lugares('PARROQUIA',id_municipio,idv_parroquia);
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