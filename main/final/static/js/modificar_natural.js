$(document).ready(function() {
    
    
    var datos_user;
 
    $.ajax({
                
        url:   '/modificar_natural',
        type: 'PUT',
        dataSrc: "",
            
        }).done(function(resp){
            
            datos_user = resp;         

      
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
            
            
            
            
            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });


    $.ajax({
                
        url:   '/tiendas',
        type: 'GET',
        dataSrc: "",
            
        }).done(function(resp){
            
            var tienda_registro;
            tiendas = resp;     
            
            for (var i=0, l=tiendas.length; i<l; i++){
                if (tiendas[i].ti_codigo == datos_user[0].fk_tienda)
                    tienda_registro = tiendas[i].ti_nombre;
            }

            document.getElementById("tiendaregistro").value = tienda_registro;
            
            
           
                    
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });



    
    

    $.ajax({
                
        url:   '/lugares',
        type: 'GET',
        dataSrc: "",
            
        }).done(function(resp){
            
            console.log(resp);
            var lugares = resp;         
            var id_estado;
            var id_municipio;
            var id_parroquia;

            for (var i=0, l=lugares.length; i<l; i++){
                if (lugares[i].lu_codigo == 19)
                    id_parroquia = lugares[i].fk_lugar;
            }

            for (var i=0, l=lugares.length; i<l; i++){
                if (lugares[i].lu_codigo == id_parroquia)
                    id_municipio = lugares[i].fk_lugar;
            }
            
            for (var i=0, l=lugares.length; i<l; i++){
                if (lugares[i].lu_codigo == id_municipio)
                    id_estado = lugares[i].fk_lugar;
            }

            console.log(datos_user[0].fk_lugar)
            console.log(id_parroquia)
            console.log(id_municipio)
            console.log(id_estado)

        });
           
            



    
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