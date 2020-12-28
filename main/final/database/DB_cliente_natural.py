from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal
from database.DB_lugar import DB_lugar

 


class DB_cliente_natural(DB):


    def get (self,id):

        try:

            self.cursor.execute("SELECT * FROM cliente_natural WHERE cl_id = %s", (id,) )
            resp = self.cursor.fetchone()

            columnas = self.cursor.description
           
            data = self.querydictdecimal(resp,columnas)

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == decimal.Decimal:
                        entidad[atributo] = int(entidad[atributo])

            return data 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def getall (self):  
    
        try:

            self.cursor.execute("SELECT * FROM cliente_natural")
            resp = self.cursor.fetchall()

            columnas = self.cursor.description

            data = self.querydictdecimal(resp,columnas)

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == decimal.Decimal:
                        entidad[atributo] = int(entidad[atributo])

            return data 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
      

    def add (self, data):
        
        try:

            resp = self.verifica_exist(data)

            if (resp != 0): return resp
            else:
               
                keys = data.keys()
                columns = ','.join(keys)
                values = ','.join(['%({})s'.format(k) for k in keys])

                
                query = 'INSERT INTO cliente_natural ({0}) VALUES ({1})'.format(columns, values)
                
                print(self.cursor.mogrify(query, data)) 
                self.cursor.execute(query,data)
                self.connection.commit()
               
                return jsonify({'mensaje':'Cliente creado satisfactoriamente'}) 

        except Exception:
            print(Exception)
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    def delete (self,id):

        try:

            self.cursor.execute("DELETE FROM cliente_natural WHERE cl_id = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def verifica_exist(self,data):

        try:
            
            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_correo = %s ;", ('cl_id',data['cl_correo'],))
                 
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'correo ya registrado'})              

        
            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_cedula = %s ;", ('cl_id',data['cl_cedula'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'cedula ya registrada'})  

            if data['cl_rif'] != None: 
                return 0

            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_rif = %s ;", ('cl_id',data['cl_rif'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'el rif ya esta registrado'})  

            return 0


        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    def verif_login(self,data):
        
        try:
            
            self.cursor.execute("SELECT * FROM cliente_natural  WHERE cl_correo = %s ;", (data['cl_correo'],))        

            obj = self.cursor.fetchone()  

            if obj is None:    
                return jsonify({'invalido':'correo o contraseña invalida'}) 

            if data['cl_contraseña'] == obj[2] : 
                return jsonify({'mensaje':'login valido'}) 
            else:
                return jsonify({'invalido':'correo o contraseña invalida'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidorr'})
    
  

   