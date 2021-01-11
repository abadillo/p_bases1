function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};


$(document).ready(function() {
    
    var id = (window.location.pathname.split('/'))[2];
    
    var datos;
    var tienda_registro;
    
    
    $.ajax({
                
        url:   '/manejo_empleado',
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
            alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
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
            alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });



   
    



    $("#id_user").val(datos.em_codigo);
    $("#inputcedula").val(datos.em_cedula);
    $("#inputcorreo").val(datos.em_correo);
    $("#inputtelefono").val("nada");
    $("#inputpnombre").val(datos.em_p_nombre);
    $("#inputsnombre").val(datos.em_s_nombre);
    $("#inputpapellido").val(datos.em_p_apellido);
    $("#inputsapellido").val(datos.em_s_apellido);
    $("#inputcont").val(datos.em_contrasena);


    


    var date = new Date(datos.em_fecha_nac),
        mnth = ("0" + (date.getMonth() + 1)).slice(-2),
        day = ("0" + (date.getDate())).slice(-2);
    var fecha = ([date.getFullYear(), mnth, day].join("-"));

  
     
    fecha.setDate(fecha.getDate() + 1);


    $('#selectfecha').val(fecha);
   
    $("#inputsueldo").val(datos.em_sueldo);
    $("#tiendaregistro").val(tienda_registro);
    
    





    $('#loading').hide();

    
    

});

$(function(){
    $("#Modificar").click(function(){
        
        $("#inputtelefono").removeAttr('disabled');
       
        $("#inputpnombre").removeAttr('disabled');
        $("#inputsnombre").removeAttr('disabled');
        $("#inputpapellido").removeAttr('disabled');
        $("#inputsapellido").removeAttr('disabled');
        $("#inputcont").removeAttr('disabled');
        
        $("#selectrol").removeAttr('disabled');
        $("#selectempsup").removeAttr('disabled');
        $("#inputsueldo").removeAttr('disabled');
        

        $("#Modificar").css("display","none"); 
        $("#Cancelar").css("display","block"); 
       
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
            
            url:   '/manejo_empleado',
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
       
        

   


