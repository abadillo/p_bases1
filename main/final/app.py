from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql

from DB_cliente_natural import DB_cliente_natural
from DB import DB
import logging

import numpy 


app = Flask(__name__)
app.debug = True






####################################################################


@app.route('/')                                     #metodo request de default es GET
def main():
    return render_template('inicio.html')


@app.route('/registro', methods= ['GET', 'POST'] )
def registro():
    
    if request.method == 'POST':
        return render_template("registro_natural.html")
    
    else:
        try:          
        
            db = DB_cliente_natural()         
    
            query = sql.SQL("INSERT INTO cliente_natural({fields}) VALUES ({values});").format(
                fields=sql.SQL(',').join([
                    sql.Identifier('cl_correo'),
                    sql.Identifier('cl_id'),                    
                    sql.Identifier('cl_contraseña'),
                    sql.Identifier('cl_puntos'),
                    sql.Identifier('cl_afiliacion'),
                    sql.Identifier('cl_cedula'),
                    sql.Identifier('cl_p_nombre'),
                    sql.Identifier('cl_s_nombre'),
                    sql.Identifier('cl_p_apellido'),
                    sql.Identifier('cl_s_apellido'),
                    sql.Identifier('cl_rif')
                ]),
                values=sql.SQL(',').join([
                    sql.Literal('ale4x@gmail.com'),
                    sql.Literal(2),
                    sql.Literal('ab2132'),
                    sql.Literal(1232),
                    sql.Literal(10),
                    sql.Literal(25952031),
                    sql.Literal('Alex'),
                    sql.Literal(None),
                    sql.Literal('Ber'),
                    sql.Literal('Alf'),
                    sql.Literal(None)
                ]))


            db.cursor.execute(query)
            db.connection.commit()

            return "cliente creado"


        except Exception as e:
            return json.dumps({'error':str(e)})


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
        return request.form


@app.route('/update_correo',methods=['POST','GET'])
def update_correo():
    
    try:
            
        correo = request.form['inputCorreo']
        #contraseña = request.form['inputContraseña']

        db = DB_cliente_natural()         
        #print(type(correo))
        #print(correo)
        
        #db.cursor.execute("SELECT cl_contraseña FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        db.cursor.execute("SELECT cl_id FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        #print('nose2')
    
        db.connection.commit()
        
        print (correo)

        if (db.cursor.fetchone()): i = 1
        else: i = 0
        
        correo = i
        

        return jsonify('', render_template('correo_no_existe.html', i = i ))



        #if correo and contraseña:
         #   return render_template("registro_natural.html")
        #else:
         #   return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'ERROR XS':str(e)})
   


@app.route('/inicio_sesion2',methods=['POST','GET'])
def inicio_sesion2():
    return "xd"
   






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