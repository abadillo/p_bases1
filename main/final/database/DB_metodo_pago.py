from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal


 


class DB_metodo_pago(DB):


    def getall2 (self,fk_cliente):  
    
        try:

            self.cursor.execute("SELECT * FROM cliente WHERE fk_cliente = %s", (fk_cliente,) )
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

            query = 'INSERT INTO metodo_pago ({0}) VALUES ({1})'.format(columns, values)
            
            print(self.cursor.mogrify(query, data)) 
            self.cursor.execute(query,data)
            self.connection.commit()
            
            return jsonify({'mensaje':'metodo_pago creado satisfactoriamente'}) 

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
    
            query = 'UPDATE metodo_pago SET {0} WHERE cl_id = {1}'.format(values,id)

            print(self.cursor.mogrify(query,datamod)) 
            self.cursor.execute(query,datamod)
            self.connection.commit()
            
            return ({'mensaje':'metodo_pago modificado satisfactoriamente'}) 
            

        except Exception:
            return ({'error':'Error: Hubo un problema con el servidor'}) 

    def delete (self,id):

        try:

            
            self.cursor.execute("DELETE FROM metodo_pago WHERE cl_id = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    
   