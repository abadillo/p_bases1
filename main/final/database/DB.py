from abc import abstractmethod, ABCMeta
import psycopg2
from psycopg2 import Error
from flask import Flask, render_template, json, request, jsonify

from configuracion import configuracion

class DB(metaclass=ABCMeta):

    def __init__(self): 
        
        try:
            self.cursor = None

            db_info = configuracion('C:\database.ini', 'local').config
            self.connection = psycopg2.connect(**db_info)
            
            
            self.cursor = self.connection.cursor()

        except (Exception):
            print(Exception)

    def querydict(self,resp,columnas):
        
        columnas = [col.name for col in columnas]
        data = []     

        if type(resp) is list:
            for valor in resp:
                data.append(dict(zip(columnas, valor)))
                
            return data

        elif type(resp) is tuple:
            data.append(dict(zip(columnas, resp)))

            return data



    def getall (self):
        pass

    def add (self, data):
        pass

    def verifica_exist(self,data):
        pass

    def verif_login(self,data):
        pass

    
      
       
   


   
  
