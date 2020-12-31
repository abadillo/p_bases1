function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};


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
            c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
    });


};



$(document).ready(function() {
    
    var id = (window.location.pathname.split('/'))[2];
    var datos_user;
 
    
    $.ajax({
                
        url:   '/manejo_natural',
        type: 'GET',
        data: {
            'id': id,
        },
        async: false, 
                   
    
        }).done(function(response){
            
            if (response['error'])
				alerta(response['error']);

            datos_user = response;         

        }).fail(function(){
            c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });


    
    var tienda_registro;

    $.ajax({
                
        url:   '/mostrar/tiendas',
        type: 'POST',
        dataSrc: "",
        async: false, 
            
        }).done(function(resp){
            
            tiendas = resp;     
                      
        }).fail(function(resp){
            c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });


    

    document.getElementById('id_user').value = datos_user[0].cl_id;
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
    
    var direccion;

    $.ajax({
                
        url:   '/lugares',
        type: 'POST',
        data: {
            'fk_dir': datos_user[0].fk_lugar ,
        },
        async: false, 
            
        }).done(function(response){
            
            direccion= response;

        });



    var idv_estado = direccion['idv_estado'];
    var idv_municipio =  direccion['idv_municipio'];
    var idv_parroquia =  direccion['idv_parroquia'];
    var dir = direccion['direccion']

    document.getElementById("inputdir").value = dir;


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
        window.location.href =  "/perfil_natural/"+id;
        
    });

});


$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/perfil_natural',
            data:  $('form').serialize(),
            type: 'PUT',
                
            }).done(function(response){
                
                console.log(response);
                
                /*if (response['mensaje'] == 'correo o contraseña invalida')
                    $(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   )
                else
                    window.location.href =  "/"		*/			
                
            }).fail(function(response){
                c_error();
            });

        e.preventDefault();
    
    });
});


$(function(){
    $("#Editar1").click(function(){
        
        $("#id_user").removeAttr('disabled'); 
        $("#inputcedula").removeAttr('disabled');
        $("#inputtelefono").removeAttr('disabled');
        $("#inputtelefono2").removeAttr('disabled');
        $("#inputtelefono3").removeAttr('disabled');
        $("#inputpnombre").removeAttr('disabled');
        $("#inputsnombre").removeAttr('disabled');
        $("#inputpapellido").removeAttr('disabled');
        $("#inputsapellido").removeAttr('disabled');
        $("#inputcont").removeAttr('disabled');
        $("#inputdir").removeAttr('disabled');
        
        $("#Editar1").css("display","none"); 
        $("#Editar3").css("display","block"); 
       

        $("#Editar2").css("display","none"); 
        $("#Editar4").css("display","block"); 
       
    });
});
   


