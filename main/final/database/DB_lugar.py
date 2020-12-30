from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal
 


class DB_lugar(DB):

    def getlastid (self):

        try:

            self.cursor.execute("SELECT lu_codigo::int FROM lugar ORDER BY  lu_codigo DESC LIMIT 1;")

            resp = self.cursor.fetchone()
 
            id = resp[0]
           
            return id+1

        except Exception:
            return jsonify({'error':'Errorrr: Hubo un problema con el servidor'})
            
    def getdir (self,fk_lugar):
        
        self.cursor.execute("SELECT lu_nombre FROM lugar WHERE lu_codigo = %s", (fk_lugar,) )
        direccion = self.cursor.fetchone()

        self.cursor.execute("SELECT fk_lugar FROM lugar WHERE lu_codigo = %s", (fk_lugar,) )
        idv_parroquia = self.cursor.fetchone()
        
        self.cursor.execute("SELECT fk_lugar FROM lugar WHERE lu_codigo = %s", (idv_parroquia,) )
        idv_municipio = self.cursor.fetchone()
        
        self.cursor.execute("SELECT fk_lugar FROM lugar WHERE lu_codigo = %s", (idv_municipio,) )
        idv_estado = self.cursor.fetchone()

        data = {
                'idv_parroquia'     :   idv_parroquia[0],        
                'idv_municipio'     :   idv_municipio[0],             
                'idv_estado'        :   idv_estado[0],
                'direccion'         :   direccion[0],
        }     

        return (data)

    def get2 (self,item,item2):

        try:

            tipo = item 
            fk_lugar = item2
            
            
            if item2 == '':
                self.cursor.execute("SELECT * FROM lugar WHERE lu_tipo = %s", (tipo,) )
            else:
                self.cursor.execute("SELECT * FROM lugar WHERE lu_tipo = %s AND fk_lugar = %s", (tipo,fk_lugar,) )

            resp = self.cursor.fetchall()
            columnas = self.cursor.description
           
            data = self.querydictdecimal(resp,columnas)
        
            return data 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})

    def getall (self):  
    
        try:

            self.cursor.execute("SELECT * FROM lugar")
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

            data['lu_codigo'] = self.getlastid()

            keys = data.keys()
            columns = ','.join(keys)
            values = ','.join(['%({})s'.format(k) for k in keys])
            
            query = 'INSERT INTO lugar ({0}) VALUES ({1}) RETURNING lu_codigo'.format(columns, values)
            
            #print(self.cursor.mogrify(query, data))   imprimer el comando sql

            self.cursor.execute(query,data)
            self.connection.commit()

            id_creado = self.cursor.fetchone()[0]

            return id_creado

        except Exception:
            return None

    def delete (self,id):

        try:

            self.cursor.execute("DELETE FROM lugar WHERE lu_codigo = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def verifica_exist(self,data):
        return None
       

    def verif_login(self,data):
        return None
   