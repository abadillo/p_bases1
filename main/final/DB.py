from abc import abstractmethod, ABCMeta
import psycopg2
from psycopg2 import Error
import logging

class DB(metaclass=ABCMeta):

    def __init__(self):
        
        try:
            self.connection = psycopg2.connect(
                host = "labs-dbservices01.ucab.edu.ve",
                user = "grupo4bd1",
                password = "bases1_abgmjd",
                port ="5432",
                database = "grupo4db1_"
            )

            
            self.cursor = self.connection.cursor()
            print("Conexion Establecida: ")
            print(self.connection.get_dsn_parameters(), "\n")


        except (Exception, Error) as error:
            print("Error en Conexion", error) 
            self.cursor = None

                
    @abstractmethod
    def get_id (self):
        pass



      
       
   


   
  
