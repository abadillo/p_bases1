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
    
    var datos;
    var tienda_registro;

    var direccion;

    var id_estado;
    var id_municipio;
    var id_parroquia;
    var idv_estado;
    var idv_municipio;
    var idv_parroquia;
    
    
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
            else 
                datos = response; 
           
        }).fail(function(){
            c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });

    console.log(datos);

    $.ajax({
                
        url:   '/mostrar/tiendas',
        type: 'POST',
        dataSrc: "",
        async: false, 
            
        }).done(function(resp){
            
            tiendas = resp;
            for (var i=0, l=tiendas.length; i<l; i++){
                if (tiendas[i].ti_codigo == datos.fk_tienda)
                    tienda_registro = tiendas[i].ti_nombre;
            }     
                      
        }).fail(function(resp){
            c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });


    $.ajax({
                
        url:   '/lugares',
        type: 'POST',
        data: {
            'fk_dir': datos.fk_lugar ,
        },
        async: false, 
            
        }).done(function(response){
        
            idv_estado = response['idv_estado'];
            idv_municipio =  response['idv_municipio'];
            idv_parroquia =  response['idv_parroquia'];
            direccion = response['direccion']
        });

   
    



    $("#id_user").val(datos.cl_id);
    $("#inputcedula").val(datos.cl_cedula);
    $("#inputcorreo").val(datos.cl_correo);
    $("#inputtelefono").val("nada");
    $("#inputpnombre").val(datos.cl_p_nombre);
    $("#inputsnombre").val(datos.cl_s_nombre);
    $("#inputpapellido").val(datos.cl_p_apellido);
    $("#inputsapellido").val(datos.cl_s_apellido);
    $("#inputcont").val(datos.cl_contrasena);
    $("#inputrif").val(datos.cl_rif);

    $("#tiendaregistro").val(tienda_registro);
    
    $("#inputdir").val(direccion);


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

    $('#loading').hide();
    

});

$(function(){
    $("#Modificar").click(function(){
        
        $("#inputtelefono").removeAttr('disabled');
        $("#inputtelefono2").removeAttr('disabled');
        $("#inputtelefono3").removeAttr('disabled');
        $("#inputpnombre").removeAttr('disabled');
        $("#inputsnombre").removeAttr('disabled');
        $("#inputpapellido").removeAttr('disabled');
        $("#inputsapellido").removeAttr('disabled');
        $("#inputcont").removeAttr('disabled');
        $("#selectestado").removeAttr('disabled');
        $("#selectmunicipio").removeAttr('disabled');
        $("#selectparroquia").removeAttr('disabled');
        $("#inputdir").removeAttr('disabled');
        
        $("#Modificar").css("display","none"); 
        $("#Cancelar").css("display","block"); 
       

        $("#Carnet").css("display","none"); 
        $("#Confirmar").css("display","block"); 
       
    });
});

$(function(){
    $("#Cancelar").click(function(){
        window.location.href=window.location.href;
    });
});

$(function(){
    $("#Confirmar").click(function(){
      
        $("#id_user").removeAttr('disabled');

        $('#loading').show()

        $.ajax({
            
            url:   '/manejo_natural',
            data:  $('form').serialize(),
            type: 'PUT',
                
            }).done(function(response){
                
                $('#loading').hide()

                if(response['error'])
					alerta(response['error']);
				
				else if (response['invalido'])
                    alerta(response['invalido']);
				
                else
                    alerta(response['mensaje']);
                
                
                window.location.href=window.location.href;
             	
                
            }).fail(function(response){
                alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
            });

        
    });
});
       
        

   


