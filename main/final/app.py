from flask import Flask, render_template, json, request, jsonify, session, redirect, url_for      #para ejecutar servidor
from datetime import datetime, timedelta                                        # 1)entrar al final con "cd"
import datetime  # 2)comando "python app.py"

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
from database.DB_carrito import DB_carrito
from database.DB_producto import DB_producto

app = Flask(__name__)
app.debug = True
app.secret_key = "llavesuperrsecreta2924"
app.permanent_session_lifetime = timedelta(days=5)




@app.route('/sesion',methods=['GET','DELETE'])  
def sesion():
    
    if request.method == 'GET':
        
        if 'us_correo' in session:
            print(session)
            resp = {
               'us_codigo'      : session['us_codigo'],
               'us_correo'      : session['us_correo'],
               'fk_empleado'    : session['fk_empleado'],
               'fk_cliente'     : session['fk_cliente'],
               'fk_rol'         : session['fk_rol'],
               'privilegios'    : session['privilegios']
            }
        
           
            return jsonify(resp)
        else:
            return jsonify({'mensaje': 'Debe iniciar Sesion' })    

    if request.method == 'DELETE':
        
        session.pop('us_correo',None)
        return jsonify({'mensaje': 'Se ha cerrado sesion' })    


@app.route('/control_entrada', methods=['GET','POST'])    
def control_entrada():

    if request.method == 'GET':

        query = """SELECT to_char(coen_entrada,'DD/MM/YYYY HH12:MI:SS AM') coen_entrada FROM control_entrada 
                   WHERE coen_salida is NULL AND fk_empleado = {0}""".format(session['fk_empleado'])

        resp = DB_generic().select(query)
         
        if resp :  return 'Se registrar la salida de su ultima entrada:\n' + resp[0]['coen_entrada'] 
        
        return 'Se registrara la entrada.'
    

    if request.method == 'POST':

        query = """SELECT coen_entrada FROM control_entrada 
                   WHERE coen_salida is NULL AND fk_empleado = {0}""".format(session['fk_empleado'])

        resp = DB_generic().select(query)

        if (resp): 
            equery = """UPDATE control_entrada SET coen_salida = CURRENT_TIMESTAMP 
                        WHERE coen_salida is NULL AND fk_empleado = {0}""".format(session['fk_empleado'])

        else:
            equery = """INSERT INTO control_entrada (coen_entrada,fk_empleado) 
                        VALUES (CURRENT_TIMESTAMP,{0})""".format(session['fk_empleado'])
                

        if (DB_generic().equery(equery)): return 'Registro exitoso'
        
        return "Registro fallido\nIntentelo de nuevo"
        
     
@app.route('/ver_productos',methods=['POST'])    
def ver_productos():
        
    search = request.form['search']

    query = """SELECT p.*, r.ru_nombre, m.ma_nombre FROM producto p, rubro r, marca m 
                WHERE p.fk_rubro = r.ru_codigo AND p.fk_marca = m.ma_codigo AND LOWER(p.pr_nombre) LIKE '%{0}%'""".format(search)

    resp = DB_generic().select(query)
    
    return jsonify(resp)
    


#### Interfaces principales ####


@app.route('/')                            
def main():
    return render_template('inicio.html')
    
@app.route('/inicio_sesion', methods=['GET','POST'])    
def inicio_sesion():

    if request.method == 'GET':
        if 'us_correo' in session:
            return redirect(url_for('main'))
        else:
            return render_template("inicio_sesion.html")

    if request.method == 'POST':
        
        correo =  request.form['inputcorreo'] 
        contrasena = request.form['inputcontrasena']         
        
        db = DB_usuario()
        resp = db.get2('us_correo',correo)


        if not(resp): 
           return jsonify({'invalido': 'Este usuario no esta registrado'}) 
        
       
        if resp['us_contrasena'] == contrasena:
            
            session.permanent = True

            query ='SELECT P.PV_CODIGO, P.PV_DESCRIPCION FROM PRIVILEGIO P,PRIVILEGIO_ROL PR WHERE P.PV_CODIGO = PR.FK_PRIVILEGIO AND PR.FK_ROL = {0}'.format(resp['fk_rol'])
            
            session['us_codigo'] = resp['us_codigo']
            session['us_correo'] = resp['us_correo']
            session['fk_empleado'] = resp['fk_empleado']
            session['fk_cliente'] = resp['fk_cliente']
            session['fk_rol'] = resp['fk_rol']
            session['privilegios'] = DB_generic().select(query)
            
            return jsonify({'mensaje': 'Bienvenido a UcabMart'}) 
            
        
        return jsonify({'invalido': 'Contraseña Invalida'})        


@app.route('/compra_fisica', methods=['GET','PUT'])    
def compra_fisica():

    if request.method == 'GET':
        return render_template("compra_fisica.html")

    if request.method == 'PUT':
                
        return jsonify({'invalido': 'Contraseña Invalida'})        


@app.route('/cancela_compra/<id_carrito>', methods=['GET','PUT'])    
def cancela_compra(id_carrito):

    if request.method == 'GET':
        return render_template("cancela_compra.html")








##### Interfaces de registro/ver perfil #####

@app.route('/registro/<entidad>')  ##ventana registros
def registro(entidad):

    return render_template("registro_"+entidad+".html")
    


@app.route('/<entidad>/<id>') ## Ver perfiles
def ver_perfil(entidad,id):
     
    if entidad == 'cliente':
        cliente = DB_cliente().get(session['fk_cliente'])
        if cliente['cl_tipo'] == 'NATURAL':  return redirect(url_for('ver_perfil',entidad='natural', id=id))
        if cliente['cl_tipo'] == 'JURIDICO': return redirect(url_for('ver_perfil',entidad='juridico', id=id))

    return render_template("perfil_"+entidad+".html")




#####  DATATABLE  #####

@app.route('/mostrar/<obj>',methods=['GET','POST'])    
def mostrar(obj):

    if request.method == 'GET':
        return render_template("mostrar.html")

    #aplica para post  <<<

    resp = None

    if obj == 'naturales':
        resp = DB_cliente().getall('NATURAL')

    if obj == 'juridicos':        
        resp = DB_cliente().getall('JURIDICO')

    if obj == 'empleados':
        resp = DB_empleado().getall()

    if obj == 'tiendas':
        resp = DB_tienda().getall()

    if obj == 'proveedores':
        resp = DB_proveedor().getall()
    
    if obj == 'monedas':   
        resp = DB_generic().select("""
            SELECT m.*, c.* FROM moneda m , cotizacion c 
            WHERE m.mo_codigo = c.fk_moneda AND c.ct_expira is NULL
            AND m.mo_codigo > 1""")

    if obj == 'marcas':   
        resp = DB_generic().getall("marca")

    if obj == 'beneficios':   
        resp = DB_generic().getall("beneficio")

    if obj == 'tipo_pagos':   
        resp = DB_generic().getall("tipo_pago")

    if obj == 'rubros':   
        resp = DB_generic().getall("rubro")

    if obj == 'horarios':   
        resp = DB_generic().select("""
            SELECT ho_codigo, ho_descripcion, ho_dia, 
            to_char(ho_hora_entrada, 'HH12:MIAM') AS ho_hora_entrada, 
            to_char(ho_hora_salida, 'HH12:MIAM') AS ho_hora_salida FROM horario""")

    if obj == 'zonas':   
        resp = DB_generic().getall("zona")

    if obj == 'roles':   
        resp = DB_generic().getall("rol")

    if obj == 'privilegios':   
        resp = DB_generic().getall("privilegio")

    if obj == 'productos':   
        resp = DB_generic().select("""
            SELECT p.*, r.ru_nombre, m.ma_nombre FROM producto p, rubro r, marca m 
            WHERE p.fk_rubro = r.ru_codigo AND p.fk_marca = m.ma_codigo""")

    if not(resp):
        return """<h1>ERROR 404 </h1>
                  <h3>This is not the page you are looking for.</h3>"""
        

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
     
        item = request.args['item']
        datos_cl = DB_cliente().get(item)

        if ('invalido' or 'error') in datos_cl: return datos_cl
 
        id = datos_cl['cl_id']

        #datos correo y contraseña
        db = DB_usuario()
        data2 = db.get2('fk_cliente',id)
        
        #añadde data2 a datos_cl
        datos_cl.update(data2)
        
        return jsonify(datos_cl)

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
     
        item = request.args['item']
        datos_cl = DB_cliente().get(item)

        if ('invalido' or 'error') in datos_cl: return datos_cl
 
        id = datos_cl['cl_id']

        #datos correo y contraseña
        db = DB_usuario()
        data2 = db.get2('fk_cliente',id)
        
        #añadde data2 a datos_cl
        datos_cl.update(data2)
        
        return jsonify(datos_cl)

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
        data2 = db.get2('fk_empleado',id)
        
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
            'fk_empleado_sup' :     None,  
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
        
        
        try:
            data['fk_empleado_sup'] = int(request.form['selectempsup'])
        except:
            None 


        #insercion de empleado y usuario
       
        id_empleado = db.add(data)
        print(id_empleado)

        try:
            if 'error' in id_empleado:  return jsonify(id_empleado)
            if 'invalido' in id_empleado: return jsonify(id_empleado)
        except: None

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
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        data['fk_lugar_fiscal'] = db2.add(direccion)

        try:

            direccion2 = {
                'lu_nombre'     :   request.form['inputdir2'],        
                'lu_tipo'       :   'DIRECCION',             
                'fk_lugar'      :   request.form['selectparroquia2'],         
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

          
@app.route('/manejo_carrito', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_carrito():
   
    if request.method == 'GET':             #listo  
        id = request.args['id']

        data = DB_carrito().get(id) 

        return jsonify(data)

    if request.method == 'POST':

        tienda = DB_empleado().get(session['fk_empleado'])['fk_tienda']

        data = {
            'fk_cliente'        : int(request.form['id_cliente']),
            'fk_tienda'         : tienda,
            'ca_monto_total'    : 0
        }

        id_carrito = DB_carrito().add(data)

        return jsonify(id_carrito)


    if request.method == 'PUT':

        pr_id = int(request.form['codigo'])

        producto = DB_producto().get(pr_id)

        if ('invalido' or 'error') in producto: return producto

        print(producto)

        unidades = request.form['cant']

        data = {
            'ca_unidades' : int(request.form['cant']),
            'ca_costo'    : producto['pr_precio'],
            'fk_carrito'  : int(request.form['carrito']),
            'fk_producto' : pr_id
        }

        resp = DB_generic().add('carrito_producto',data)

        print(resp)
    
        if ('error' in resp): 
            return jsonify({'invalido':'invalido: producto ya en carrito'}) 

        data.update(producto)

        print(data)

        return data


    if request.method == 'DELETE':

        data = {
            'fk_carrito'  : int(request.form['fk_carrito']),
            'fk_producto' : int(request.form['fk_producto'])
        }
        
        resp = DB_generic().delete('carrito_producto', data )


        return resp

          

@app.route('/manejo_moneda',methods=['GET', 'POST','PUT','DELETE'])
def manejo_moneda():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('moneda','mo_codigo',id)[0]

        cot = DB_generic().getwhere('cotizacion','fk_moneda',id) 
        
        data['cotizacion'] = cot

        return jsonify(data)   


    if request.method == 'POST':                    

        data = {
            'mo_descripcion'     :   request.form['inputmoneda']
        }

        id = DB_generic().add_return('moneda',data,'mo_codigo')

        data_cot = {
            'ct_fecha'  :   str(datetime.datetime.now()),
            'ct_valor'	:	int(request.form['inputcot']),
            'ct_expira' :   None,
            'fk_moneda'	:	id,	
        }

        resp = DB_generic().add('cotizacion',data_cot)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_moneda'])

        data = {
                'mo_descripcion'     :   request.form['inputmoneda']
        }

        resp = DB_generic().update('moneda','mo_codigo',id,data)

        if (request.form['cot_nueva'] == ''): return resp

        ct_fecha = str(datetime.datetime.now())

        query = "UPDATE cotizacion SET ct_expira = '{0}' WHERE ct_expira is NULL AND fk_moneda = {1}".format(ct_fecha,id)

        print(DB_generic().equery(query))

        data_cot = {
            'ct_fecha'  :   ct_fecha,
            'ct_valor'	:	int(request.form['cot_nueva']),
            'ct_expira' :   None,
            'fk_moneda'	:	id,	
        }

        resp = DB_generic().add('cotizacion',data_cot)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data_cot = {
            'fk_moneda'      :  id
        }
        data = {
            'mo_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('cotizacion',data_cot)
        resp = db.delete('moneda',data)
       
        return resp

@app.route('/manejo_marca',methods=['GET', 'POST','PUT','DELETE'])
def manejo_marca():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('marca','ma_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        val = False

        try:
            print(request.form['inputpropia'])
            val = True
        except: None
        

        data = {
            'ma_nombre'     :   request.form['inputmarca'],
            'ma_ucabmart'   :   val
        }

        resp = DB_generic().add('marca',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_marca'])

        val = False

        try:
            print(request.form['inputpropia'])
            val = True
        except: None
        
        data = {
            'ma_nombre'     :   request.form['inputmarca'],
            'ma_ucabmart'   :   val
        }

        resp = DB_generic().update('marca','ma_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'ma_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('marca',data)
       
        return resp

@app.route('/manejo_beneficio',methods=['GET', 'POST','PUT','DELETE'])
def manejo_beneficio():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('beneficio','be_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'be_nombre'     :   request.form['inputbeneficio'],
        }

        resp = DB_generic().add('beneficio',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_beneficio'])
        
        data = {
            'be_nombre'     :   request.form['inputbeneficio'],
        }

        resp = DB_generic().update('beneficio','be_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'be_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('beneficio',data)
       
        return resp

@app.route('/manejo_tipo_pago',methods=['GET', 'POST','PUT','DELETE'])
def manejo_tipo_pago():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('tipo_pago','tp_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'tp_descripcion'     :   request.form['inputtipo_pago'],
        }

        resp = DB_generic().add('tipo_pago',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_tipo_pago'])
        
        data = {
            'tp_descripcion'     :   request.form['inputtipo_pago'],
        }

        resp = DB_generic().update('tipo_pago','tp_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'tp_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('tipo_pago',data)
       
        return resp

@app.route('/manejo_rubro',methods=['GET', 'POST','PUT','DELETE'])
def manejo_rubro():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('rubro','ru_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'ru_nombre'     :   request.form['inputrubro'],
        }

        resp = DB_generic().add('rubro',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_rubro'])
        
        data = {
            'ru_nombre'     :   request.form['inputrubro'],
        }

        resp = DB_generic().update('rubro','ru_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'ru_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('rubro',data)
       
        return resp

@app.route('/manejo_horario',methods=['GET', 'POST','PUT','DELETE'])
def manejo_horario():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        query = """
            SELECT ho_codigo, ho_descripcion, ho_dia, 
            to_char(ho_hora_entrada, 'HH24:MI') AS ho_hora_entrada, 
            to_char(ho_hora_salida, 'HH24:MI') AS ho_hora_salida FROM horario 
            WHERE ho_codigo = {0}""".format(id)

        resp = DB_generic().select(query)

        return jsonify(resp[0])   

    if request.method == 'POST':                    

        data = {
            'ho_descripcion'     :   request.form['inputhorario'],
            'ho_dia'             :   request.form['selectdia'],
            'ho_hora_entrada'    :   request.form['inputhorae'],
            'ho_hora_salida'     :   request.form['inputhoras']
        }

        resp = DB_generic().add('horario',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_horario'])

        data = {
            'ho_descripcion'     :   request.form['inputhorario'],
            'ho_dia'             :   request.form['selectdia'],
            'ho_hora_entrada'    :   request.form['inputhorae']+':00',
            'ho_hora_salida'     :   request.form['inputhoras']+':00'
        }


        resp = DB_generic().update('horario','ho_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'ho_codigo'     : id
        }

        resp = DB_generic().delete('horario',data)
       
        return resp

@app.route('/manejo_zona',methods=['GET', 'POST','PUT','DELETE'])
def manejo_zona():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('zona','zo_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'zo_nombre'     :   request.form['inputzona'],
        }

        resp = DB_generic().add('zona',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_zona'])
        
        data = {
            'zo_nombre'     :   request.form['inputzona'],
        }

        resp = DB_generic().update('zona','zo_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'zo_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('zona',data)
       
        return resp

@app.route('/manejo_rol',methods=['GET', 'POST','PUT','DELETE'])
def manejo_rol():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('rol','ro_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'ro_nombre'     :   request.form['inputrol'],
        }

        resp = DB_generic().add('rol',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_rol'])
        
        data = {
            'ro_nombre'     :   request.form['inputrol'],
        }

        resp = DB_generic().update('rol','ro_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'ro_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('rol',data)
       
        return resp

@app.route('/manejo_privilegio',methods=['GET', 'POST','PUT','DELETE'])
def manejo_privilegio():
    
    if request.method == 'GET':                 
        id = request.args['item']
        
        data = DB_generic().getwhere('privilegio','pv_codigo',id)[0]
    
        return jsonify(data)   

    if request.method == 'POST':                    

        data = {
            'pv_descripcion'     :   request.form['inputprivilegio'],
        }

        resp = DB_generic().add('privilegio',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_privilegio'])
        
        data = {
            'pv_descripcion'     :   request.form['inputprivilegio'],
        }

        resp = DB_generic().update('privilegio','pv_codigo',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'pv_codigo'     : id
        }

        db = DB_generic()   
        resp = db.delete('privilegio',data)
       
        return resp




@app.route('/manejo_producto',methods=['GET', 'POST','PUT','DELETE'])
def manejo_producto():
    
    if request.method == 'GET':                 
        id = request.args['item']

        query = """
            SELECT p.*, r.ru_nombre, m.ma_nombre FROM producto p, rubro r, marca m 
            WHERE p.fk_rubro = r.ru_codigo AND p.fk_marca = m.ma_codigo
            AND p.pr_id = {0}""".format(id)

        resp = DB_generic().select(query)

        return jsonify(resp[0]) 

    if request.method == 'POST':                    

        data = {
            'pr_nombre' :   request.form['inputproducto'],
            'pr_precio' :   int(request.form['inputprecio']),
            'pr_peso' :     int(request.form['inputpeso']),
            'fk_proveedor': int(request.form['selectproveedor']),
            'fk_rubro' :    int(request.form['selectrubro']),
            'fk_marca' :    int(request.form['selectmarca']),
        }

        resp = DB_generic().add('producto',data)

        return resp

    if request.method == 'PUT':                    

        id = int(request.form['id_producto'])
        
        data = {
            'pr_nombre' :   request.form['inputproducto'],
            'pr_precio' :   int(request.form['inputprecio']),
            'pr_peso' :     int(request.form['inputpeso']),
            #'fk_proveedor': int(request.form['selectproveedor']),
            'fk_rubro' :    int(request.form['selectrubro']),
            'fk_marca' :    int(request.form['selectmarca']),
        }

        resp = DB_generic().update('producto','pr_id',id,data)

        return jsonify(resp)    

    if request.method == 'DELETE':                  

        id = int(request.form['codigos'])

        data = {
            'pr_id'     : id
        }

        db = DB_generic()   
        resp = db.delete('producto',data)
       
        return resp











### datatable embeded 

@app.route('/metodo_pago_cliente', methods= ['GET', 'POST','DELETE'])
def manejo_metodo_pago_cliente():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        db = DB_metodo_pago()         
        resp = db.getall(id)
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
def manejo_horarios_empleado():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        query ='SELECT he.fk_empleado, he.fk_horario, ho.ho_descripcion FROM horario_empleado he, horario ho WHERE he.fk_horario = ho.ho_codigo AND fk_empleado = {0}'.format(id)

        resp =  DB_generic().select(query)

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
def manejo_beneficios_empleado():

    if request.method == 'GET':
        
        id = int(request.args['id'])
                
        query ='SELECT bm.fk_empleado, bm.fk_beneficio, be.be_nombre FROM beneficio_empleado bm, beneficio be WHERE bm.fk_beneficio = be.be_codigo AND fk_empleado = {0}'.format(id)

        resp =  DB_generic().select(query)
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

@app.route('/privilegios_rol', methods= ['GET', 'POST','DELETE'])
def manejo_privilegios_rol():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        db = DB_generic()  

        query ='SELECT pr.fk_rol, pr.fk_privilegio, pv.pv_descripcion FROM privilegio_rol pr, privilegio pv WHERE pr.fk_privilegio = pv.pv_codigo AND pr.fk_rol = {0}'.format(id)

        resp =  DB_generic().select(query)

        return jsonify(resp)
    
    if request.method == 'POST': 
       
        data = {
            'fk_rol'   :  int(request.form['fk_rol']),
            'fk_privilegio'     :  int(request.form['fk_privilegio']),
        }
        

        db = DB_generic()
        resp = db.add('privilegio_rol',data)
        
        return resp
 
    if request.method == 'DELETE':

       
        data = {
            'fk_rol'   :  int(request.form['fk_rol']),
            'fk_privilegio'     :  int(request.form['fk_privilegio'])
        }

        db = DB_generic()   
        resp = db.delete('privilegio_rol',data)

        return resp

@app.route('/vacaciones', methods= ['GET', 'POST','DELETE'])
def manejo_vacaciones():

    if request.method == 'GET':
        
        id = int(request.args['id'])

        resp =  DB_generic().getwhere('vacaciones','fk_empleado',id)

        return jsonify(resp)
    
    if request.method == 'POST': 
       
        data = {
            'va_fecha_ini'   :  request.form['fecha_ini'],
            'va_fecha_fin'   :  request.form['fecha_fin'],
            'fk_empleado'    :  int(request.form['fk_empleado']),
        }

        resp = DB_generic().add('vacaciones',data)
        return resp
 
    if request.method == 'DELETE':

        data = {
            'va_fecha_ini'   :  request.form['va_fecha_ini'],
            'fk_empleado'    :  int(request.form['fk_empleado']),
        }

        resp = DB_generic().delete('vacaciones',data)

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
        resp = db.getall(tipo,fk_obj)
        print(resp)

        return jsonify(resp)

    
           

        



if (__name__ == '__main__'):    
    app.run(port=5005)


