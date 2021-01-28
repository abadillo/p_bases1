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

            print(self.cursor.mogrify(query))  
            self.cursor.execute(query)
            
            resp = self.cursor.fetchall()
            columnas = self.cursor.description
            data = self.querydictdecimal(resp,columnas)

            return data 

        except Exception:
            return None
      

    def getwhere (self,tabla,atributo,valor):  
    
        try:
           
            query = 'SELECT * FROM {0} WHERE {1} = {2}'.format(tabla,atributo,valor)

            print(self.cursor.mogrify(query))  
            self.cursor.execute(query)
        
            resp = self.cursor.fetchall()
            columnas = self.cursor.description
            
            data = self.querydictdecimal(resp,columnas)

            return data 

        except Exception:
            return None


            
    def add (self,table, data):
        
        try:

            for key in data.keys():
                if (data[key] == '' or data[key] == ' '): data[key] = None
                     
            keys = data.keys()
            columns = ','.join(keys)
            values = ','.join(['%({})s'.format(k) for k in keys])

            query = 'INSERT INTO {0} ({1}) VALUES ({2})'.format(table,columns, values)
            
            print(self.cursor.mogrify(query, data)) 
            self.cursor.execute(query,data)
            self.connection.commit()
            
            return jsonify({'mensaje':'horario creado satisfactoriamente'}) 

        except Exception:
            print(Exception)
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

  
    def delete (self,table, data):
        
        try:

            keys = data.keys()
            values = ' AND '.join(['{} = %({})s'.format(k, k) for k in keys])
    
            query = 'DELETE FROM {0} WHERE {1}'.format(table,values)
            
            print(self.cursor.mogrify(query, data)) 
            self.cursor.execute(query,data)
            self.connection.commit()


            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    

      

    def select (self,query):  
    
        try:
           
            print(self.cursor.mogrify(query))  
            self.cursor.execute(query)
        
            resp = self.cursor.fetchall()
            columnas = self.cursor.description
            
            data = self.querydictdecimal(resp,columnas)

            return data 

        except Exception:
            return None

 
   
