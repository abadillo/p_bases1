from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql

from database.DB_cliente_natural import DB_cliente_natural


app = Flask(__name__)
app.debug = True


####################################################################


@app.route('/')                                     #metodo request de default es GET
def main():
    return render_template('inicio.html')
    

@app.route('/registro_natural', methods= ['GET', 'POST'] )
def registro_natural():
    
    if request.method == 'GET':
        return render_template("registro_natural.html")
    
    else:
        try:
            
            data = {
                'cl_correo'     : 'alex@gmail.com',     #string    
                'cl_cedula'     : 21522033,             #int 
                'cl_rif'        : 122121,               #int
                
                'cl_contraseña' : 'buenobueno',         #string 
                'cl_puntos'     : 0,                    #int
                'cl_afiliacion' : 123,                  #int
                'cl_p_nombre'   : 'fernan',             #string 
                'cl_s_nombre'   : 'flow',               #string  #None
                'cl_p_apellido' : 'will',               #string 
                'cl_s_apellido' : 'rex',                #string  #None
            }

            return request.form

            db = DB_cliente_natural()   
            resp = db.add(data)

            return resp

        except Exception :
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


@app.route('/registro_juridico', methods= ['GET', 'POST'] )
def registro_juridico():
    
    if request.method == 'GET':
        return render_template("registro_juridico.html")
    
    else:
        try:

            data = {
                'cl_correo'     : 'alex@gmail.com',     #string    
                'cl_cedula'     : 21522033,             #int 
                'cl_rif'        : 122121,               #int
                
                'cl_contraseña' : 'buenobueno',         #string 
                'cl_puntos'     : 0,                    #int
                'cl_afiliacion' : 123,                  #int
                'cl_p_nombre'   : 'fernan',             #string 
                'cl_s_nombre'   : 'flow',               #string  #None
                'cl_p_apellido' : 'will',               #string 
                'cl_s_apellido' : 'rex',                #string  #None
            }

            return request.form

            db = DB_cliente_natural()   
            resp = db.add(data)

            return resp

        except Exception :
            return jsonify({'error':'Error: Hubo un problema con el servidor'})



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


@app.route('/inicio_sesion',methods=['POST','GET'])
def inicio_sesion():

    if request.method == 'GET':
        return render_template("inicio_sesion.html")

    else: 
        correo = request.form['inputCorreo']
        contraseña = request.form['inputContraseña']

        db = DB_cliente_natural()         
        #print(type(correo))
        #print(correo)
        
        #db.cursor.execute("SELECT cl_contraseña FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        db.cursor.execute("SELECT * FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        #print('nose2')
    
        db.connection.commit()
        
        data = db.cursor.fetchone()
 
        
        if data is None:   
            
            return jsonify({'mensaje':'correo o contraseña invalida'})   
             
        else: 
           
            if data[2] == contraseña:  
                return jsonify({'mensaje':'conexion_ establecida'}) 
            else:
                return jsonify({'mensaje':'correo o contraseña invalida'}) 
       

        #if correo and contraseña:
         #   return render_template("registro_natural.html")
        #else:
         #   return json.dumps({'html':'<span>Enter the required fields</span>'})
       
        
@app.route('/mostrar',methods=['POST','GET','DELETE'])
def mostrar():
    
    if request.method == 'GET':
        return render_template("mostrar_clientes.html")
    
    if request.method == 'POST': 
       
        db = DB_cliente_natural()         
    
        db.cursor.execute("SELECT cl_id::int,cl_correo,cl_cedula::bigint,cl_rif::bigint,cl_contraseña FROM cliente_natural")
        resp = db.cursor.fetchall()
        columnas = db.cursor.description

        columnas = [col.name for col in columnas]
        data = []     

        if type(resp) is list:
            for valor in resp:
                data.append(dict(zip(columnas, valor)))
                
            resss = data

        elif type(resp) is tuple:
            data.append(dict(zip(columnas, resp)))
            resss = data
 

        return jsonify(resss)

    if request.method == 'DELETE':

        id = int(request.get_data())
        print(id)

        #delete cliente natural {id} 

        return request.get_data()


###########################


   

@app.route('/showSignin')
def showSignin():
    return render_template('signin.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')


@app.route('/signUp2',methods=['POST','GET'])
def signU2p():
    try:
        db = DB_cliente_natural()
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        #if db.cursor :  return json.dumps({'message':'Conexion Establecida !'})

        # validate the received values
        if _name and _email and _password:
            
            # All Good, let's call MySQL
            #ok = ok
            #conn = mysql.connect()
            #cursor = conn.cursor()
            #cursor.callproc('sp_createUser',(_name,_email,_password))
            #data = cursor.fetchall()

            print(_name)

            if db.cursor : 
                db.cursor.execute("INSERT INTO cliente_natural (cl_nombre) VALUES ('%s');" %(_email) )
                db.connection.commit()
                return json.dumps({'message':'conexion establecida'})
            
            
            """if len(data) is 0:
                #conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})"""

        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
 



if (__name__ == '__main__'):    
    app.run(port=5005)