from flask import Flask, render_template, json, request, jsonify #para ejecutar servidor
import psycopg2                                                  # 1)entrar al final con "cd"
from psycopg2.sql import SQL, Composable, Identifier, Literal    # 2)comando "python app.py"
from psycopg2 import Error
from psycopg2 import sql
from datetime import datetime
import datetime

from database.DB_usuario import DB_usuario
from database.DB_cliente import DB_cliente

from database.DB_lugar import DB_lugar
from database.DB_telefono import DB_telefono
from database.DB_tienda import DB_tienda
from database.DB_metodo_pago import DB_metodo_pago
from database.DB_generic import DB_generic
from database.DB_empleado import DB_empleado
from database.DB_persona_contacto import DB_persona_contacto
from database.DB_proveedor import DB_proveedor
from database.DB_inventario import DB_inventario


app = Flask(__name__)
app.debug = True







#### Interfaces principales ####


@app.route('/')                               
def main():
    return render_template('inicio.html')
    
@app.route('/inicio_sesion',methods=['POST','GET'])         #listo falta ccs
def inicio_sesion():

    if request.method == 'GET':
        return render_template("inicio_sesion.html")

    else: 
        
        db = DB_cliente()

        data = {
            'cl_correo'     : request.form['inputCorreo'],    
            'cl_contraseña' : request.form['inputContraseña']         
        }

        resp = db.verif_login(data)

        return resp
        




##### Interfaces de registro/ver perfil #####



@app.route('/registro/<entidad>', methods=['GET'])  ##ventana registros
def registro(entidad):

    return render_template("registro_"+entidad+".html")
    


@app.route('/<entidad>/<id>',methods=['GET']) ## Ver perfiles
def ver_perfil(entidad,id):
     
    return render_template("perfil_"+entidad+".html")




#####  DATATABLE  #####

@app.route('/mostrar/<obj>',methods=['GET','POST'])    
def mostrar(obj):

    if obj == 'naturales':
    
        if request.method == 'GET':
            return render_template("mostrar.html")

        if request.method == 'POST':

            db = DB_cliente()         
            resp = db.getall('NATURAL')

            return jsonify(resp)    


    if obj == 'juridicos':

        if request.method == 'GET':
            return render_template("mostrar.html")

        if request.method == 'POST':

            db = DB_cliente()         
            resp = db.getall('JURIDICO')

            return jsonify(resp)  


    if obj == 'empleados':

        if request.method == 'GET':
            return render_template("mostrar.html")

        if request.method == 'POST':

            db = DB_empleado()         
            resp = db.getall()

            return jsonify(resp)  


    if obj == 'tiendas':

        if request.method == 'GET':

            return render_template("mostrar.html")
    
        if request.method == 'POST':

            db = DB_tienda()  
            resp = db.getall()

            return jsonify(resp)


    if obj == 'proveedores':

        if request.method == 'GET':
            return render_template("mostrar.html")

        if request.method == 'POST':

            db = DB_proveedor()         
            resp = db.getall()

            return jsonify(resp)

    

    
    if obj == 'roles':

        if request.method == 'POST':

            db = DB_generic()
            resp = db.getall2("rol")

            del resp[0]
                        


            return jsonify(resp)



            



    
    



########   REST   ###########


@app.route('/manejo_tienda',methods=['GET', 'POST','PUT','DELETE'])
def manejo_tienda():
    
    if request.method == 'GET':                 #listo
        id = request.args['codigo']
        
        db = DB_tienda()
        data = db.get(id) 

        return jsonify(data)   

    if request.method == 'POST':                    #listo

        db = DB_lugar()   

        direccion = {
            'lu_codigo'     :   None,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        id_direccion = db.add(direccion)


        data = {
            'ti_nombre'     :   request.form['inputtienda'],
            'fk_lugar'      :   id_direccion,
        }

        db = DB_tienda()  
        resp = db.add(data)
        return resp

    if request.method == 'PUT':                    #listo

       id = int(request.form['id_user'])

       data = {

           'ti_nombre' : request.form['inputtienda'],
       }

       db = DB_tienda()
       resp = db.update(id,data)


       id_direccion = (db.get(id))['fk_lugar']

       direccion = {
            'lu_nombre'     :   request.form['inputdir'],   
            'fk_lugar'      :   int(request.form['selectparroquia']),     
       }
    
       db = DB_lugar()
       resp2 = db.update( id_direccion , direccion )    

       if ('mensaje') in resp.keys(): 
            return jsonify(resp)
        
       if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)


       return jsonify(resp)    

    if request.method == 'DELETE':                  #listo

        id = int(request.form['codigos'])

        db = DB_tienda()   

        resp = db.delete(id)

        return resp



@app.route('/manejo_natural', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_natural():

    if request.method == 'GET':         #listo
     
        id = request.args['id']
        
        #datos normales
        db = DB_cliente()
        data = db.get(id) 

        #datos correo y contraseña
        db = DB_usuario()
        data2 = db.get2(id,'fk_cliente')
        
        #añadde data2 a data 
        data.update(data2)
        
        return jsonify(data)

    if request.method == 'POST':            #listo
        
        #datos cliente

        data = {
            'cl_cedula'     :int(request.form['inputcedula']), 
            'cl_rif'        :    request.form['inputrif'], 
            'cl_afiliacion' :    None,
            'cl_p_nombre'   :    request.form['inputpnombre'],
            'cl_s_nombre'   :    request.form['inputsnombre'],   
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'], 
            'cl_puntos'     :    0,
            'fk_lugar'      :    None,    
            'fk_tienda'     :    int(request.form['selecttienda']),
            'cl_tipo'       :    'NATURAL',
            
        }

        #datos usuario

        d_user = {
            'us_correo'     :    request.form['inputcorreo'], 
            'us_contrasena' :    request.form['inputcont'],  
            'fk_cliente'    :    None,
            'fk_rol'        :    1,
        }
        
        #validacion de existencia de cedula, rif y correo
        db = DB_cliente()
        resp = db.verif('cl_rif',data['cl_rif'])
        if (resp): return jsonify({'invalido': 'Este rif ya esta registrado'}) 
        resp = db.verif('cl_cedula',data['cl_cedula'])
        if (resp): return jsonify({'invalido': 'Esta cedula ya esta registrada'}) 
        
        db2 = DB_usuario()
        resp = db2.verif('us_correo',d_user['us_correo'])
        if (resp): return jsonify({'invalido': 'Este correo ya esta registrado'}) 


        
        #direccion de usuario
        direccion = {
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        db3 = DB_lugar() 
        
        #datos adicionales de cliente
        data['fk_lugar'] = db3.add(direccion)
        data['cl_afiliacion'] = db.getafiliacion(data['fk_tienda'])
        
    

        #insercion de cliente y usuario
        
        id_cliente = db.add(data)

        d_user['fk_cliente'] = id_cliente
        db2.add(d_user)



        #telefonos

        db4 = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),  
            'fk_cliente'         :   id_cliente,         
        }

        db4.add(telefono) 

        try:
            
            telefono2 = {
                'te_tipo'            :   request.form['tipotlf2'],        
                'te_numero'          :   int(request.form['inputtelefono2']), 
                'fk_cliente'         :   id_cliente,         
            }

            db4.add(telefono2) 
       
        except: None

        try:
            
            telefono3 = {
                'te_tipo'            :   request.form['tipotlf3'],        
                'te_numero'          :   int(request.form['inputtelefono3']), 
                'fk_cliente'         :   id_cliente,         
            }

            db4.add(telefono3) 
       
        except: None


        return jsonify({'mensaje': 'Cliente Creado Satisfactoriamente' }) 

    if request.method == 'PUT':              #listo
        
        id = int(request.form['id_user'])

        data = {
        
            'cl_p_nombre'   :    request.form['inputpnombre'], 
            'cl_s_nombre'   :    request.form['inputsnombre'],  
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'],
        }        

        db = DB_cliente()
        resp = db.update(id,data)


        

        #actualiza contrañase
        
        data_us = {
            'us_contrasena' :    request.form['inputcont'],
        }
        
        db2 = DB_usuario()
        resp2 = db2.update2( id, 'fk_cliente', data_us)


        #actualiza direccion

        datosuser =  db.get(id)
        id_direccion = datosuser['fk_lugar']
        

        direccion = {
            'lu_nombre'     :   request.form['inputdir'],   
            'fk_lugar'      :   int(request.form['selectparroquia']),     
        }
        
        db = DB_lugar()
        resp3 = db.update( id_direccion , direccion ) 


        #actualiza telefonos

        db = DB_telefono()


        if (request.form['tlfcodigo']):
            codigo_tlf = int(request.form['tlfcodigo'])

            try:
                telefono = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono']),  
                }

                resp6 =  db.update( codigo_tlf, telefono ) 

            except Exception: 
                resp6 = db.delete(codigo_tlf)



        if (request.form['tlfcodigo2']):
            codigo_tlf2 = int(request.form['tlfcodigo2'])

            try:
                telefono2 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono2']),  
                }

                resp6 =  db.update( codigo_tlf2, telefono2 ) 

            except Exception: 
                resp6 = db.delete(codigo_tlf2)



        if (request.form['tlfcodigo3']):
            codigo_tlf3 = int(request.form['tlfcodigo3'])

            try:
                telefono3 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono3']),  
                }

                resp6 =  db.update( codigo_tlf3, telefono3 ) 

            except Exception: 
                resp6 = db.delete(codigo_tlf3)




        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)
        if ('mensaje') in resp3.keys(): 
            return jsonify(resp3)
        
        
        return jsonify(resp)
      
    if request.method == 'DELETE':          #listo

        id = int(request.get_data())

        db2 = DB_cliente() 
        resp = db2.delete(id)

        return resp


@app.route('/manejo_juridico', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_juridico():

    if request.method == 'GET':         #listo
     
        id = request.args['id']
        
        #datos normales
        db = DB_cliente()
        data = db.get(id) 

        #datos correo y contraseña
        db = DB_usuario()
        data2 = db.get2(id,'fk_cliente')
        
        #añadde data2 a data 
        data.update(data2)
        
        return jsonify(data)

    if request.method == 'POST':            #listo
        
        #datos cliente

        data = {
            'cl_rif'            :    request.form['inputrif'], 
            'cl_afiliacion'     :    None,
            'cl_razon_social'   :    request.form['inputrazon'],
            'cl_pagina_web'     :    request.form['inputpagina'],   
            'cl_den_comercial'  :    request.form['inputden'], 
            'cl_capital'        :    int(request.form['inputcapital']), 
            'cl_puntos'         :    0,
            'fk_lugar_fiscal'   :    None,   
            'fk_lugar_fisica'   :    None,   
            'fk_tienda'         :    int(request.form['selecttienda']),
            'cl_tipo'           :    'JURIDICO',
            
        }

        #datos usuario

        d_user = {
            'us_correo'     :    request.form['inputcorreo'], 
            'us_contrasena' :    request.form['inputcont'],  
            'fk_cliente'    :    None,
            'fk_rol'        :    1,
        }
        
        #validacion de existencia de cedula, rif y correo
        db = DB_cliente()
        resp = db.verif('cl_rif',data['cl_rif'])
        if (resp): return jsonify({'invalido': 'Este rif ya esta registrado'}) 
        
        db2 = DB_usuario()
        resp = db2.verif('us_correo',d_user['us_correo'])
        if (resp): return jsonify({'invalido': 'Este correo ya esta registrado'}) 


        


        #direccion de usuario

        db3 = DB_lugar() 

        direccion = {
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        data['fk_lugar_fiscal'] = db3.add(direccion)


        try:
            
            direccion2 = {
                'lu_nombre'     :   request.form['inputdir2'],        
                'lu_tipo'       :   'DIRECCION',             
                'fk_lugar'      :   request.form['selectparroquia2'],         
            }

            if not (direccion2['lu_nombre'] == '' or direccion2['lu_nombre'] == ' '):
                data['fk_lugar_fisica'] = db3.add(direccion2)
       
        except: None


        
        
        #datos adicionales de cliente
       
        data['cl_afiliacion'] = db.getafiliacion(data['fk_tienda'])
        
    

        #insercion de cliente y usuario
        
        id_cliente = db.add(data)

        d_user['fk_cliente'] = id_cliente
        db2.add(d_user)



        #telefonos 

        db4 = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),  
            'fk_cliente'         :   id_cliente,         
        }

        db4.add(telefono) 

        try:
            
            telefono2 = {
                'te_tipo'            :   request.form['tipotlf2'],        
                'te_numero'          :   int(request.form['inputtelefono2']), 
                'fk_cliente'         :   id_cliente,         
            }

            db4.add(telefono2) 
       
        except: None

        try:
            
            telefono3 = {
                'te_tipo'            :   request.form['tipotlf3'],        
                'te_numero'          :   int(request.form['inputtelefono3']), 
                'fk_cliente'         :   id_cliente,         
            }

            db4.add(telefono3) 
       
        except: None


        #personas de contacto

        db5 = DB_persona_contacto()


        persona1 = {
            'peco_cedula'     :int(request.form['Cedula1']), 
            'peco_p_nombre'   :    request.form['Primer-nom'],
            'peco_s_nombre'   :    request.form['Segundo-nom'],   
            'peco_p_apellido' :    request.form['Primer-ap'], 
            'peco_s_apellido' :    request.form['Segundo-ap'], 
            'fk_cliente'      :   id_cliente,  
        }

        idcontacto = db5.add(persona1)
                
        telefonop = {
            'te_tipo'               :   'CELULAR',        
            'te_numero'             :   int(request.form['Telefono']),
            'fk_persona_contacto'   :   idcontacto,         
        }

        db4.add(telefonop) 

        try:
            
            persona2 = {
                'peco_cedula'     : int(request.form['Cedula2']), 
                'peco_p_nombre'   :    request.form['Primer-nom2'],
                'peco_s_nombre'   :    request.form['Segundo-nom2'],   
                'peco_p_apellido' :    request.form['Primer-ap2'], 
                'peco_s_apellido' :    request.form['Segundo-ap2'], 
                'fk_cliente'      :   id_cliente,       
            }

            if not (persona2['peco_p_nombre'] == '' or persona2['peco_p_nombre'] == ' '):
                
                idcontacto2 = db5.add(persona2)
                telefonop2 = {
                    'te_tipo'            :   'CELULAR',        
                    'te_numero'          :   int(request.form['Telefono2']),  
                    'fk_persona_contacto'         :   idcontacto2,         
                }   

                db4.add(telefonop2) 
       
        except: None



        return jsonify({'mensaje': 'Cliente Creado Satisfactoriamente' }) 
   
    if request.method == 'PUT':              #listo
        
        id = int(request.form['id_user'])

        data = {
            'cl_razon_social'   :    request.form['inputrazon'],
            'cl_s_nombre'       :    request.form['inputpagina'],
            'cl_den_comercial'  :    request.form['inputden'],
            'cl_capital'        :    int(request.form['inputcapital']),
        }


        #actualiza contrañase
        
        data_us = {
            'us_contrasena' :    request.form['inputcont'],
        }
        
        db2 = DB_usuario()
        resp2 = db2.update2( id, 'fk_cliente', data_us)



        #actualiza direcciones
        
        db = DB_cliente()
        datosuser =  db.get(id)

        id_direccion = datosuser['fk_lugar_fiscal']
        db3 = DB_lugar()
        
        direccion = {
            'lu_nombre'        :   request.form['inputdir'],   
            'fk_lugar'  :   int(request.form['selectparroquia']),     
        }
        
        resp3 = db3.update(id_direccion , direccion) 


        #actualiza direccion opcional (crear, actualizar o borrar)

        flag = 0

        try:
            direccion2 = {
                    'lu_nombre'     :   request.form['inputdir2'], 
                    'lu_tipo'       :   'DIRECCION',             
                    'fk_lugar'      :   request.form['selectparroquia2'],         
            }
            flag = 1
        except Exception:
            None

        id_direccion2 = datosuser['fk_lugar_fisica']

        if (flag == 1):
        
            if (direccion2['lu_nombre'] != '' and direccion2['lu_nombre'] != ' ' ):
            
                direccion2['fk_lugar'] = int(direccion2['fk_lugar']) 

                if id_direccion2: 

                    resp4 =  db.update( id_direccion2 , direccion2 ) 
                                
                else:                     
                    resp4 = db3.add(direccion2)
                    data['fk_lugar_fisica'] = resp4

            else:
                if id_direccion2 : 
                    db3.delete(id_direccion2) 
                    data['fk_lugar_fisica'] = None
                
        else:
            if id_direccion2 : 
                db3.delete(id_direccion2) 
                data['fk_lugar_fisica'] = None
            
            

        

        #actualiza usuario base 
        resp = db.update(id,data)




        #actualiza telefonos

        db5 = DB_telefono()


        if (request.form['tlfcodigo']):
            codigo_tlf = int(request.form['tlfcodigo'])

            try:
                telefono = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono']),  
                }

                resp6 =  db5.update( codigo_tlf, telefono ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf)



        if (request.form['tlfcodigo2']):
            codigo_tlf2 = int(request.form['tlfcodigo2'])

            try:
                telefono2 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono2']),  
                }

                resp6 =  db5.update( codigo_tlf2, telefono2 ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf2)



        if (request.form['tlfcodigo3']):
            codigo_tlf3 = int(request.form['tlfcodigo3'])

            try:
                telefono3 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono3']),  
                }

                resp6 =  db5.update( codigo_tlf3, telefono3 ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf3)



        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)
        if ('mensaje') in resp3.keys(): 
            return jsonify(resp3)
        
        
        return jsonify(resp)
      
    if request.method == 'DELETE':      #listo

        id = int(request.get_data())

        db = DB_cliente()   

        resp = db.delete(id)

        return resp


@app.route('/manejo_empleado', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_empleado():

    if request.method == 'GET':         #listo
     
        id = request.args['id']
        
        db = DB_empleado()
        data = db.get(id) 

        #datos correo y contraseña
        db = DB_usuario()
        data2 = db.get2(id,'fk_empleado')
        
        #añadde data2 a data 
        data.update(data2)

       

        return jsonify(data)

    if request.method == 'POST':        #listo
        
        #datos empleado

        data = {
            'em_cedula'       :  int(request.form['inputcedula']),   
            'em_p_nombre'     :     request.form['inputpnombre'],
            'em_s_nombre'     :     request.form['inputsnombre'],   
            'em_p_apellido'   :     request.form['inputpapellido'], 
            'em_s_apellido'   :     request.form['inputsapellido'], 
            'em_sueldo'       :  int(request.form['inputsueldo']), 
            'em_fecha_nac'    :     request.form['selectfecha'],     
            'fk_tienda'       :  int(request.form['selecttienda']),
            'fk_empleado_sup' :  int(request.form['selectempsup']),  
           
        }

        #datos usuario

        d_user = {
            'us_correo'     :    request.form['inputcorreo'], 
            'us_contrasena' :    request.form['inputcont'],  
            'fk_empleado'   :    None,
            'fk_rol'        :    int(request.form['selectrol']),
        }
        
        #validacion de existencia de correo
        db = DB_empleado()
        db2 = DB_usuario()
        resp = db2.verif('us_correo',d_user['us_correo'])
        if (resp): return jsonify({'invalido': 'Este correo ya esta registrado'}) 
        resp = db.verif('em_cedula',data['em_cedula'])
        if (resp): return jsonify({'invalido': 'Esta cedula ya esta registrada'}) 
        

    

        #insercion de empleado y usuario
       
        id_empleado = db.add(data)

        d_user['fk_empleado'] = id_empleado
        db2.add(d_user)



        #telefono

        db4 = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),  
            'fk_empleado'        :   id_empleado,         
        }

        db4.add(telefono) 


        return jsonify({'mensaje': 'Empleado Creado Satisfactoriamente' }) 

    if request.method == 'PUT':              #listo
        
        id = int(request.form['id_user'])

        data = {
        
            'em_p_nombre'      :    request.form['inputpnombre'], 
            'em_s_nombre'      :    request.form['inputsnombre'],  
            'em_p_apellido'    :    request.form['inputpapellido'], 
            'em_s_apellido'    :    request.form['inputsapellido'],
            'em_sueldo'        :  int(request.form['inputsueldo']),   
            'fk_tienda'        :  int(request.form['selecttienda']),
            'fk_empleado_sup'  :  int(request.form['selectempsup']),   

        }        

        db = DB_empleado()
        resp = db.update(id,data)


        

        #actualiza contrañase
        
        data_us = {
            'us_contrasena' :    request.form['inputcont'],
            'fk_rol'        :    int(request.form['selectrol']),
        }
        
        db2 = DB_usuario()
        resp2 = db2.update2( id, 'fk_empleado', data_us)



        #actualiza telefonos

        db = DB_telefono()


        if (request.form['tlfcodigo']):
            codigo_tlf = int(request.form['tlfcodigo'])

            try:
                telefono = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono']),  
                }

                resp3 =  db.update( codigo_tlf, telefono ) 

            except Exception: 
                resp3 = db.delete(codigo_tlf)



       


        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)
        if ('mensaje') in resp3.keys(): 
            return jsonify(resp3)
        
        
        
        return jsonify(resp)
      
    if request.method == 'DELETE':      

        id = int(request.get_data())

        db = DB_empleado()   

        resp = db.delete(id)

        return resp


@app.route('/manejo_proveedor', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_proveedor():
   
    if request.method == 'GET':             #listo  
        id = request.args['id']

        db = DB_proveedor()
        data = db.get(id) 

        return jsonify(data)

    if request.method == 'POST':

        data = {
            'po_rif'            :request.form['inputrif'],
            'po_den_comercial'  :request.form['inputden'],
            'po_razon_social'   :request.form['inputrazon'],
            'po_pagina_web'     :request.form['inputpagina'],
            'po_correo'         :request.form['inputcorreo'],
            'po_correo_alt'     :request.form['inputcorreo2'],
            'fk_lugar_fiscal'   : None,
            'fk_lugar_fisica'   : None,
        }

        db = DB_proveedor() 
        resp = db.verif('po_rif',data['po_rif'])        
        if (resp): return jsonify({'invalido': 'Este rif ya esta registrado'}) 
       

        db2 = DB_lugar() 

        direccion = {
            'lu_nombre'     :   request.form['inputdir2'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia2'],         
        }

        data['fk_lugar_fiscal'] = db2.add(direccion)

        try:

            direccion2 = {
                'lu_nombre'     :   request.form['inputdir'],        
                'lu_tipo'       :   'DIRECCION',             
                'fk_lugar'      :   request.form['selectparroquia'],         
            }

            if not (direccion2['lu_nombre'] == '' or direccion2['lu_nombre'] == ' '):
                data['fk_lugar_fisica'] = db2.add(direccion2)
       
        except: None

        id_proveedor = db.add(data)
        db3 = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),  
            'fk_proveedor'         :   id_proveedor,         
        }

        db3.add(telefono) 

        try:
            
            telefono2 = {
                'te_tipo'            :   request.form['tipotlf2'],        
                'te_numero'          :   int(request.form['inputtelefono2']), 
                'fk_proveedor'       :   id_proveedor,         
            }

            db3.add(telefono2) 
       
        except: None

        try:
            
            telefono3 = {
                'te_tipo'            :   request.form['tipotlf3'],        
                'te_numero'          :   int(request.form['inputtelefono3']), 
                'fk_proveedor'       :   id_proveedor,         
            }

            db3.add(telefono3) 
       
        except: None

        db4 = DB_persona_contacto()


        persona1 = {
            'peco_cedula'     :int(request.form['Cedula1']), 
            'peco_p_nombre'   :    request.form['Primer-nom'],
            'peco_s_nombre'   :    request.form['Segundo-nom'],   
            'peco_p_apellido' :    request.form['Primer-ap'], 
            'peco_s_apellido' :    request.form['Segundo-ap'], 
            'fk_proveedor'    :   id_proveedor,  
        }

        idcontacto = db4.add(persona1)
                
        telefonop = {
            'te_tipo'               :   'CELULAR',        
            'te_numero'             :   int(request.form['Telefono']),
            'fk_persona_contacto'   :   idcontacto,         
        }

        db3.add(telefonop) 

        try:
            
            persona2 = {
                'peco_cedula'     : int(request.form['Cedula2']), 
                'peco_p_nombre'   :    request.form['Primer-nom2'],
                'peco_s_nombre'   :    request.form['Segundo-nom2'],   
                'peco_p_apellido' :    request.form['Primer-ap2'], 
                'peco_s_apellido' :    request.form['Segundo-ap2'], 
                'fk_proveedor'    :    id_proveedor,       
            }

            if not (persona2['peco_p_nombre'] == '' or persona2['peco_p_nombre'] == ' '):
                
                idcontacto2 = db4.add(persona2)
                telefonop2 = {
                    'te_tipo'            :   'CELULAR',        
                    'te_numero'          :   int(request.form['Telefono2']),  
                    'fk_persona_contacto'         :   idcontacto2,         
                }   

                db3.add(telefonop2) 
       
        except: None

        return jsonify({'mensaje': 'Proveedor Creado Satisfactoriamente' }) 

    if request.method == 'PUT':

        id = int(request.form['id_user'])

        data = {

            'po_den_comercial'      :request.form['inputden'],
            'po_razon_social'       :request.form['inputrazon'],
            'po_correo'             :request.form['inputcorreo'],
            'po_pagina_web'         :request.form['inputpagina'],
        }

     

        #Actualiza direcciones proveedor

        db = DB_proveedor()
        datosuser =  db.get(id)

        id_direccion = datosuser['fk_lugar_fiscal']       
        db2 = DB_lugar()       

        direccion ={
            'lu_nombre'     : request.form['inputdir'],
            'fk_lugar'      : int(request.form['selectparroquia']),
        }

        resp2 = db2.update(id_direccion , direccion) 

        flag = 0

        try: 
            direccion2 = {
                    'lu_nombre'     :   request.form['inputdir2'], 
                    'lu_tipo'       :   'DIRECCION',             
                    'fk_lugar'      :   request.form['selectparroquia2'],    
            }
            flag = 1
        except Exception:
            None

        id_direccion2 = datosuser['fk_lugar_fisica']

        if (flag == 1):
        
            if (direccion2['lu_nombre'] != '' and direccion2['lu_nombre'] != ' ' ):
            
                direccion2['fk_lugar'] = int(direccion2['fk_lugar']) 

                if id_direccion2: 

                    resp3 =  db2.update( id_direccion2 , direccion2 ) 
                                
                else:                     
                    resp3 = db2.add(direccion2)
                    data['fk_lugar_fisica'] = resp4

            else:
                if id_direccion2 : 
                    db2.delete(id_direccion2) 
                    data['fk_lugar_fisica'] = None
                
        else:
            if id_direccion2 : 
                db3.delete(id_direccion2) 
                data['fk_lugar_fisica'] = None
            
        

        #acutaliza proveedor
        resp = db.update(id,data)    



        #actualiza telefonos

        db5 = DB_telefono()


        if (request.form['tlfcodigo']):
            codigo_tlf = int(request.form['tlfcodigo'])

            try:
                telefono = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono']),  
                }

                resp6 =  db5.update( codigo_tlf, telefono ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf)



        if (request.form['tlfcodigo2']):
            codigo_tlf2 = int(request.form['tlfcodigo2'])

            try:
                telefono2 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono2']),  
                }

                resp6 =  db5.update( codigo_tlf2, telefono2 ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf2)



        if (request.form['tlfcodigo3']):
            codigo_tlf3 = int(request.form['tlfcodigo3'])

            try:
                telefono3 = {
                    'te_tipo'            :   'CASA',        
                    'te_numero'          :   int(request.form['inputtelefono3']),  
                }

                resp6 =  db5.update( codigo_tlf3, telefono3 ) 

            except Exception: 
                resp6 = db5.delete(codigo_tlf3)



        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)
        
        if ('mensaje') in resp3.keys(): 
            return jsonify(resp3)
        
        
        
        return jsonify(resp)
      
    if request.method == 'DELETE':

        id = int(request.get_data())

        db = DB_proveedor()   

        resp = db.delete(id)

        return resp






### datatable embeded 

@app.route('/metodo_pago_cliente', methods= ['GET', 'POST','DELETE'])
def manejo_metodo_pago():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        db = DB_metodo_pago()         
        resp = db.getall2(id)
        print(resp)

        return jsonify(resp)
    
    if request.method == 'POST': 
       
        data = {
            'mc_documento'   :  request.form['mc_documento'],
            'fk_cliente'     :  int(request.form['fk_cliente']),
            'fk_tipo_pago'   :  int(request.form['fk_tipo_pago']),
        }
        

        db = DB_metodo_pago()
        resp = db.add(data)
        
        return resp
 
    if request.method == 'DELETE':

        doc = request.form['mc_documento']
        fk_tipo = int(request.form['fk_tipo_pago'])
        fk_cliente = int(request.form['fk_cliente'])

        db = DB_metodo_pago()   

        resp = db.delete2(doc,fk_tipo,fk_cliente)

        return resp


@app.route('/horarios_empleado', methods= ['GET', 'POST','DELETE'])
def manejo_horarios():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        db = DB_generic()         
        resp = db.getwhere('horario_empleado','fk_empleado',id)

        return jsonify(resp)
    
    if request.method == 'POST': 
       
        data = {
            'fk_empleado'   :  int(request.form['fk_empleado']),
            'fk_horario'     :  int(request.form['fk_horario']),
        }
        

        db = DB_generic()
        resp = db.add('horario_empleado',data)
        
        return resp
 
    if request.method == 'DELETE':

       
        data = {
            'fk_empleado'   :  int(request.form['fk_empleado']),
            'fk_horario'     :  int(request.form['fk_horario'])
        }

        db = DB_generic()   
        resp = db.delete('horario_empleado',data)

        return resp



@app.route('/beneficios_empleado', methods= ['GET', 'POST','DELETE'])
def manejo_beneficios():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        db = DB_generic()         
        resp = db.getwhere('beneficio_empleado','fk_empleado',id)

        return jsonify(resp)
    
    if request.method == 'POST': 
       
        data = {
            'fk_empleado'   :  int(request.form['fk_empleado']),
            'fk_beneficio'     :  int(request.form['fk_beneficio']),
        }
        

        db = DB_generic()
        resp = db.add('beneficio_empleado',data)
        
        return resp
 
    if request.method == 'DELETE':

       
        data = {
            'fk_empleado'   :  int(request.form['fk_empleado']),
            'fk_beneficio'     :  int(request.form['fk_beneficio'])
        }

        db = DB_generic()   
        resp = db.delete('beneficio_empleado',data)

        return resp


#### comboboxes / getall where #####


@app.route('/lugares',methods=['POST','GET'])  
def lugares():
    
    if request.method == 'GET':
 
        tipo = request.args.get('LUGAR')
        fk_lugar = request.args.get('FK_LUGAR')

        db = DB_lugar()  
        resp = db.get2(tipo,fk_lugar)

        return jsonify(resp)


    if request.method == 'POST':
        
        fk_dir = request.form['fk_dir']
        
        db = DB_lugar()
        resp = db.getdir(fk_dir)

        return resp



@app.route('/metodos_pago',methods=['POST'])  
def metodos_pago():
    
    if request.method == 'POST':

        db = DB_generic()
        resp = db.getall2("tipo_pago")

        return jsonify(resp)



@app.route('/horarios',methods=['POST'])  
def horarios():
    
    if request.method == 'POST':
        
        db = DB_generic()
        resp = db.getall2("horario")

        for entidad in resp:
            for atributo in entidad:
                if type(entidad[atributo]) == datetime.time:
                    entidad[atributo] = str(entidad[atributo])

        return jsonify(resp)



@app.route('/beneficios',methods=['POST'])  
def beneficios():
    
    if request.method == 'POST':
        
        db = DB_generic()
        resp = db.getall2("beneficio")

        for entidad in resp:
            for atributo in entidad:
                if type(entidad[atributo]) == datetime.time:
                    entidad[atributo] = str(entidad[atributo])

        return jsonify(resp)


@app.route('/inventario/<id>',methods=['GET','POST'])  
def inventario(id):

    if request.method == 'GET':
        return render_template("inventario.html")

    if request.method == 'POST':

        tienda = int(request.form['tienda'])

        db = DB_inventario()         
        resp = db.getall3(tienda)

        return jsonify(resp)










@app.route('/telefonos/<id>',methods=['POST','GET'])  
def telefonos(id):
    
    if request.method == 'GET':

        fk_obj = id
        tipo = request.args.get('tipo')
        

        db = DB_telefono()         
        resp = db.getall2(tipo,fk_obj)
        print(resp)

        return jsonify(resp)

    
           

        



if (__name__ == '__main__'):    
    app.run(port=5005)


