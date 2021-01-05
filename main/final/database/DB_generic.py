from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal


 


class DB_generic(DB):

    def getall2 (self,tabla):  
    
        try:
           
            query = 'SELECT * FROM {0}'.format(tabla)

            #print(self.cursor.mogrify(query))  
            self.cursor.execute(query)
        
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

  

        try:

            
            self.cursor.execute("DELETE FROM metodo_pago WHERE cl_id = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    
   