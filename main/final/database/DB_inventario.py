from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal


 


class DB_inventario(DB):

    def getall3 (self,tienda):  
    
        try:
           
            query = 'SELECT * FROM producto INNER JOIN almacen ON almacen.fk_producto = producto.pr_id WHERE almacen.fk_tienda = {0}'.format(tienda)
            
            
            print(self.cursor.mogrify(query))  
            self.cursor.execute(query)
            
            resp = self.cursor.fetchall()
            columnas = self.cursor.description
            data = self.querydictdecimal(resp,columnas)

            return data 

        except Exception:
            return None
      
