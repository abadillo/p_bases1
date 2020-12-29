from abc import abstractmethod, ABCMeta
import psycopg2
from psycopg2 import Error
from flask import Flask, render_template, json, request, jsonify
import decimal
 

from configuracion import configuracion

class DB(metaclass=ABCMeta):

    
    def __init__(self): 
        
        try:
            self.cursor = None

            db_info = configuracion('C:\database.ini', 'ucab').config
            self.connection = psycopg2.connect(**db_info)
          
            
            self.cursor = self.connection.cursor()


        except (Exception):
            print(Exception)

    def querydictdecimal(self,resp,columnas):
        
        columnas = [col.name for col in columnas]
        data = []     

        if type(resp) is list:
            for valor in resp:
                data.append(dict(zip(columnas, valor)))
                
            data_cv = data

        elif type(resp) is tuple:
            data.append(dict(zip(columnas, resp)))

            data_cv = data


        for entidad in data_cv:
            for atributo in entidad:
                if type(entidad[atributo]) == decimal.Decimal:
                    entidad[atributo] = int(entidad[atributo])

        return data_cv



    def get2 (self,item,item2):
        pass

    def get (self,id):
        pass

    def getall (self):
        pass

    def add (self, data):
        pass

    def verifica_exist(self,data):
        pass

    def verif_login(self,data):
        pass

    def delete (self,id):
        pass
    
      
       
   


   
  
