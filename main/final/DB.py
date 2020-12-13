from abc import abstractmethod, ABCMeta
import psycopg2
from psycopg2 import Error


class DB(metaclass=ABCMeta):

    def __init__(self):
        
        try:
            connection = psycopg2.connect(
                host = "labs-dbservices01.ucab.edu.ve",
                password = "bases1_abgmjd",
                username = "grupo4bd1",
                port ="5432",
                dbname = "grupo4db1_"
            )

            self.cursor = connection.cursor()
            print("Conexion Establecida: ")
            print(connection.get_dsn_parameters(), "\n")

        except (Exception, Error) as error:
            print("Error en Conexion", error)        
            

                
    @abstractmethod
    def get_id (self):
        pass
       
    @abstractmethod
    def get( self, id):
        pass

    @abstractmethod
    def gets(self):
        pass

    @abstractmethod
    def add( self, item , item2 ):
        pass



   
  
