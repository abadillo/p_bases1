
function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};


var privilegios = null;
var rol = null;
var correo = null;
var fk_cliente = null;
var fk_empleado = null;




$(document).ready(function() {
  

    $.ajax({
                
        url:   '/sesion',
        type: 'GET',
        data: {
            'b': 0,
        },
        async: false
            
        }).done(function(resp){
        
            var opciones = [];
            opciones.push('<option value="0" selected disabled>MENU</option>');

            console.log(resp)

            if (resp['privilegios']){
                rol = resp['fk_rol'];
                privilegios = resp['privilegios'];
                correo = resp['us_correo'];
                fk_empleado = resp['fk_empleado'];
                fk_cliente = resp['fk_cliente'];


                opciones.push('<option value="1002">Cerrar Sesion</option>');    
                
                for (var i=0, l=privilegios.length; i<l; i++){
                    if (i != 2)
                         opciones.push('<option value="'+privilegios[i].pv_codigo+'">'+privilegios[i].pv_descripcion+'<opciones>');
                }  
            }
            else{
                opciones.push('<option value="1000">Iniciar Sesion</option>');
                opciones.push('<option value="1001">Crear Cuenta</option>');
            }
            
            $('#selectpriv').html(opciones.join(''));
    

            
        }).fail(function(resp){
            alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
    });




});






$(function(){

    function cerrar_sesion(){

        $.ajax({
                
            url:   '/sesion',
            type: 'DELETE',
            dataSrc: ""
                
            }).done(function(resp){
            
                window.location.href = window.location.href;
                
            }).fail(function(resp){
                alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
        });
    
    
    };


    $('#selectpriv').change(function() {

        priv = $(this).find('option:selected').val();
        console.log(priv);

        switch(priv) {
            case '1000':
                window.location.href =  '/inicio_sesion';	
                break;
            case '1001':
                window.location.href =  '/registro/natural';	
                break;
            case '1002':
                cerrar_sesion();	
                break;
            case '1':
                window.location.href =  '/cliente/'+fk_cliente;	
                break;
            case '2':
                window.location.href =  '/ver_carrito';	
                break;
            case '3':
                window.location.href =  '/Generar Presupuesto';	
                break;
            case '4':
                window.location.href =  '/Generar Compra Web';	
                break;
            case '5':
                window.location.href =  '/Asignación De Descuentos';	
                break;
            case '6':
                window.location.href =  '/Generar Revista Notimart (PDF)';	
                break;
            case '7':
                window.location.href =  '/Reporte De Ingresos/Egresos';	
                break;
            case '8':
                window.location.href =  '/Reporte De Clientes Frecuentes';	
                break;
            case '9':
                window.location.href =  '/Reporte De Mejores Clientes';	
                break;
            case '10':
                window.location.href =  '/Reporte De Clientes Con Presupuestos Efectivos';	
                break;
            case '11':
                window.location.href =  '/Reporte De Meses Productivos';	
                break;
            case '12':
                window.location.href =  '/Reporte De Mejores Clientes';	
                break;
            case '13':
                window.location.href =  '/Imprimir Orden De Despacho';	
                break;
            case '14':
                window.location.href =  '/Procesar Orden De Despacho';	
                break;
            case '15':
                window.location.href =  '/Cerrar Orden De Despacho';	
                break;
            case '16':
                window.location.href =  '/Administración De Zonas De Almacen';	
                break;
            case '17':
                window.location.href =  '/Administración De Almacen De Tienda';	
                break;
            case '18':
                window.location.href =  '/Administración De Producto';	
                break;
            case '19':
                window.location.href =  '/Generación De Orden De Reposicion';	
                break;
            case '20':
                window.location.href =  '/Aprobación De Reposición';	
                break;
            case '21':
                window.location.href =  '/Recepción De Orden Reposición';	
                break;
            case '22':
                window.location.href =  '/mostrar/proveedores';	
                break;
            case '23':
                window.location.href =  '/mostrar/monedas';	
                break;
            case '24':
                window.location.href =  '/Administración De Cotizaciones';	
                break;
            case '25':
                window.location.href =  '/mostrar/tipo_pagos';	
                break;
            case '26':
                window.location.href =  '/mostrar/marcas';	
                break;
            case '27':
                window.location.href =  '/Administración De Rubros';	
                break;
            case '28':
                window.location.href =  '/Emisión De Carnet';	
                break;
            case '29':
                window.location.href =  '/registro/natural';	
                break;
            case '30':
                window.location.href =  '/Modficar Perfil de Cliente';	
                break;
            case '31':
                window.location.href =  '/Administración De Pasillo De Tienda';	
                break;
            case '32':
                window.location.href =  '/Reposición De Pasillo';	
                break;
            case '33':
                window.location.href =  '/compra_fisica';	
                break;
            case '34':
                window.location.href =  '/mostrar/empleados';	
                break;
            case '35':
                window.location.href =  '/mostrar/beneficios';	
                break;
            case '36':
                window.location.href =  '/Asignación De Beneficios';	
                break;
            case '37':
                window.location.href =  '/Administración De Horarios';	
                break;
            case '38':
                window.location.href =  '/Registro De Vacaciones';	
                break;
            case '39':
                window.location.href =  '/Administración De Privilegios';	
                break;
            case '40':
                window.location.href =  '/Administración De Roles';	
                break;
            case '41':
                window.location.href =  '/Asignación De Privilegios';	
                break;
            case '42':
                window.location.href =  '/Reporte De Horarios';	
                break;
            case '43':
                window.location.href =  '/Reporte De Asistencia';	
                break;
            case '44':
                window.location.href =  '/Reporte De Empleados';	
                break;
            case '45':
                window.location.href =  '/Registro De Horario';	
                break;
        
           
          } 
        
        
    });
    

});


/*

CLI23 FATIMAVANESA23@gmail.com


EMP1 TULIOAURELIO1@gmail.com
EMP2 CORANIAVICTORIA2@gmail.com
EMP3 CONSUELOBELINDA3@gmail.com
EMP4 FERMINIGNACIO4@gmail.com
EMP5 PACIANOALVARO5@gmail.com
EMP6 AMADASARA6@gmail.com
EMP7 MIALEOPOLDA7@gmail.com
EMP8 CHRISTIANEJENNIFER8@gmail.com
EMP9 MIGUELAGUSTIN9@gmail.com
EMP10 THAISCONSUELO10@gmail.com

*/


