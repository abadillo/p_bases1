from flask import Flask, render_template, json, request, jsonify #para ejecutar servidor
import psycopg2                                                  # 1)entrar al final con "cd"
from psycopg2.sql import SQL, Composable, Identifier, Literal    # 2)comando "python app.py"
from psycopg2 import Error
from psycopg2 import sql

from database.DB_cliente_natural import DB_cliente_natural

from database.DB_lugar import DB_lugar
from database.DB_telefono import DB_telefono
from database.DB_tienda import DB_tienda



app = Flask(__name__)
app.debug = True


####################################################################


@app.route('/')                                     #metodo request de default es GET
def main():
    return render_template('inicio.html')
    
@app.route('/inicio_sesion',methods=['POST','GET'])         #listo falta ccs
def inicio_sesion():

    if request.method == 'GET':
        return render_template("inicio_sesion.html")

    else: 
        
        db = DB_cliente_natural()

        data = {
            'cl_correo'     : request.form['inputCorreo'],    
            'cl_contraseña' : request.form['inputContraseña']         
        }

        resp = db.verif_login(data)

        return resp
        
     
@app.route('/registro_natural', methods= ['GET', 'POST'] )
def registro_natural():
    
    if request.method == 'GET':
        return render_template("registro_natural.html")
    
    else:
        try:
            
            db = DB_lugar()   

            lu_codigo = db.getlastid()

            direccion = {
                'lu_codigo'     :   lu_codigo,
                'lu_nombre'     :   request.form['inputdir'],        
                'lu_tipo'       :   'DIRECCION',             
                'fk_lugar'      :   request.form['selectparroquia'],         
            }

            id_direccion = db.add(direccion)


            data = {
                'cl_correo'     :    request.form['inputcorreo'],            #string    
                'cl_cedula'     :int(request.form['inputcedula']),             #int 
                'cl_rif'        :    request.form['inputrif'],               #int
                
                'cl_contrasena' :    request.form['inputcont'],         #string 
                'cl_afiliacion' :    123,                                       #int
                'cl_p_nombre'   :    request.form['inputpnombre'],             #string 
                'cl_s_nombre'   :    request.form['inputsnombre'],               #string 
                'cl_p_apellido' :    request.form['inputpapellido'],               #string 
                'cl_s_apellido' :    request.form['inputsapellido'],                #string  
                'fk_lugar'      :    None,    
                'fk_tienda'     :    int(request.form['selecttienda']),
            }

            data['fk_lugar'] = id_direccion


            for key in data.keys():
                if (data[key] == '' or data[key] == ' '): data[key] = None

            db = DB_cliente_natural()   
            resp = db.add(data)


            db = DB_telefono()   

            telefono = {
                'te_tipo'            :   request.form['tipotlf'],        
                'te_numero'          :   int(request.form['inputtelefono']),             
                'fk_cliente_natural' :   None,         
            }

            db.add(telefono) 


            return resp

        except Exception :
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


@app.route('/registro_juridico', methods= ['GET', 'POST'] )
def registro_juridico():
    
    if request.method == 'GET':
        return render_template("registro_juridico.html")
    
    else:
        return xd 



@app.route('/mostrar',methods=['POST','GET','DELETE'])     #datatable falta delete y update
def mostrar():
    
    if request.method == 'GET':
        return render_template("mostrar_clientes.html")
    
    if request.method == 'POST': 
       
        db = DB_cliente_natural()         
    
        resp = db.getall()
 
        return jsonify(resp)

    if request.method == 'DELETE':

        id = int(request.get_data())

        db = DB_cliente_natural()   

        resp = db.delete(id)

        #delete cliente natural {id} 

        return resp


@app.route('/lugares',methods=['POST','GET','PUT'])     #datatable falta update
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
       
@app.route('/tienda',methods=['POST','GET','PUT','DELETE'])
def tienda():
    
    if request.method == 'GET'
        return render_template("registro_tienda.html")


    if request.method == 'POST'

        db =DB_lugar()   

        lu_codigo = db.getlastid()

        direccion = {
            'lu_codigo'     :   lu_codigo,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        id_direccion = db.add(direccion)

        data = {

            'ti_nombre'     :   request.form['inputtienda'],                        
            'fk_lugar'      :   lu_codigo,
        }

        db = DB_tienda()  
        resp = db.add(data)
        return resp

    if request.method == 'PUT'
        return "cliente actualizado"   #update

    if request.method == 'DELETE'
        return "cliente eliminado"
 

@app.route('/tiendas',methods=['POST','GET','PUT'])     #datatable falta update
def tiendas():
    
    
    if request.method == 'GET':

        db = DB_tienda()  
        resp = db.getall()
        return jsonify(resp)




@app.route("/perfil_natural/<int:cl_id>", methods=['POST', 'GET','PUT'])    
def perfil_natural(cl_id):
   
    if request.method == 'GET':                 
        return render_template('perfil_natural.html', cl_id = cl_id)     

    if request.method == 'PUT':
        db = DB_cliente_natural()
         
        datos_usuario = db.get(cl_id) 

        for atributo in datos_usuario[0]:
            if (datos_usuario[0][atributo] == None): datos_usuario[0][atributo] = ''
        
        return jsonify(datos_usuario)

    if request.method == 'POST':
        return "xd"


       

    
###########################


@app.route('/perfil/<cl_nombre>')
def perfil(cl_nombre):
    return render_template("perfil_natural.html", cl_nombre = cl_nombre)    


@app.route('/producto/<int:pr_id>')        #url generico
def datos_producto(pr_id):
    return "datos produto %s" %pr_id     #escribe en pantalla 


@app.route('/carrito', methods= ['GET', 'POST'] )
def carrito():

    if request.method == 'GET':
        
        lista = ["Pantalones", "Pollo", "Caraotas"]


        return render_template("carrito.html", lista = lista)   
    

    else:   return "ah bueno"

#######################################

   


if (__name__ == '__main__'):    
    app.run(port=5005)


