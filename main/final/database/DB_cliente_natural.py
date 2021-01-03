from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal


 


class DB_cliente_natural(DB):


    def get (self,item):

        try:

            id = item
            
            self.cursor.execute("SELECT * FROM cliente WHERE cl_id = %s", (id,) )
            resp = self.cursor.fetchone()
            
            columnas = self.cursor.description
           
            resp = self.querydictdecimal(resp,columnas)

            data = resp[0]

            for atributo in data:
                if (data[atributo] == None):
                    data[atributo] = ''

            return data 

        except Exception:
            return ({'error':'Error: Hubo un problema con el servidor o el cliente no existe'})


    def getall (self):  
    
        try:

            self.cursor.execute("SELECT * FROM cliente WHERE cl_tipo = 'NATURAL'")
            resp = self.cursor.fetchall()

            columnas = self.cursor.description

            data = self.querydictdecimal(resp,columnas)

            return data 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
    
    def add (self, data):
        
        try:

            for key in data.keys():
                if (data[key] == '' or data[key] == ' '): data[key] = None
                     
            keys = data.keys()
            columns = ','.join(keys)
            values = ','.join(['%({})s'.format(k) for k in keys])

            query = 'INSERT INTO cliente ({0}) VALUES ({1})'.format(columns, values)
            
            print(self.cursor.mogrify(query, data)) 
            self.cursor.execute(query,data)
            self.connection.commit()
            
            return jsonify({'mensaje':'Cliente creado satisfactoriamente'}) 

        except Exception:
            print(Exception)
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    def update (self, id, data):

        try:

            datamod = dict(data)
            dataol = self.get(id)
            
            for atributo in data:
                if (data[atributo] == dataol[atributo]):
                    datamod.pop(atributo)
                    
            
            if (not datamod): return ({'invalido':'Ningun dato fue actualizado'}) 
            
            for key in datamod.keys():
                if (datamod[key] == '' or datamod[key] == ' '): datamod[key] = None

            keys = datamod.keys()
            values = ','.join(['{} = %({})s'.format(k, k) for k in keys])
    
            query = 'UPDATE cliente SET {0} WHERE cl_id = {1}'.format(values,id)

            print(self.cursor.mogrify(query,datamod)) 
            self.cursor.execute(query,datamod)
            self.connection.commit()
            
            return ({'mensaje':'Cliente modificado satisfactoriamente'}) 
            

        except Exception:
            return ({'error':'Error: Hubo un problema con el servidor'}) 

    def delete (self,id):

        try:

            self.cursor.execute("DELETE FROM cliente WHERE cl_id = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def verifica_exist(self,data):

        try:
           
            
            self.cursor.execute("SELECT %s FROM cliente WHERE cl_correo = %s ;", ('cl_id',data['cl_correo'],))
                 
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'correo ya registrado'})  

                      

        
            self.cursor.execute("SELECT %s FROM cliente WHERE cl_cedula = %s ;", ('cl_id',data['cl_cedula'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'cedula ya registrada'})  

             


            self.cursor.execute("SELECT %s FROM cliente WHERE cl_rifn = %s ;", ('cl_id',data['cl_rifn'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'el rif ya esta registrado'})  

           

            return 0


        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    def verif_login(self,data):
        
        try:
            
            self.cursor.execute("SELECT * FROM cliente  WHERE cl_correo = %s ;", (data['cl_correo'],))        

            obj = self.cursor.fetchone()  

            if obj is None:    
                return jsonify({'invalido':'correo o contraseña invalida'}) 

            if data['cl_contraseña'] == obj[2] : 
                return jsonify({'mensaje':'login valido'}) 
            else:
                return jsonify({'invalido':'correo o contraseña invalida'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidorr'})
    
  

   