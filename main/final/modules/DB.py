from abc import abstractmethod, ABCMeta
import psycopg2
from psycopg2 import Error
from flask import Flask, render_template, json, request, jsonify



class DB(metaclass=ABCMeta):

    def __init__(self): 
        
        try:
            self.cursor = None

            self.connection = psycopg2.connect(
                host = "labs-dbservices01.ucab.edu.ve",
                user = "grupo4bd1",
                password = "bases1_abgmjd",
                port ="5432",
                database = "grupo4db1_"
            )

            self.cursor = self.connection.cursor()

        except (Exception):
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
            

                
    @abstractmethod
    def add (self, data):
        pass



      
       
   


   
  
