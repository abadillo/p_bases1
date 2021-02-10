from agatereports.basic_report import BasicReport
from database.DB_reporte import DB_reporte
from datetime import datetime
import datetime
import pandas
import os



class Reporte():
    def asistencia(self,fecha,tienda):
        
        db = DB_reporte()
        Datos = db.report(fecha,tienda) 
        print(Datos)    

        path = os.getcwd() + r'\reportes\descargas\Asistencia.xlsx'      
        pandas.DataFrame(Datos).to_excel( path ) 

        return 'BIEN O BUENO'

    def horario(self,fecha,tienda,empleado):
        
        db = DB_reporte()
        Datos = db.report(fecha,tienda)     

        path = os.getcwd() + r'\reportes\temp\datos_horario.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index=False) 


        jrxml_filename = './reportes/jrxml/Horario.jrxml'  # input jrxml filename
        output_filename = './reportes/descargas/Horario.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_horario.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()

        return 'BIEN O BUENO'

    def ingreso(self,fecha1,fecha2):

        db=DB_reporte()
        Datos = db.ingreso(fecha1,fecha2)
        print(Datos)

        path = os.getcwd() + r'\reportes\temp\datos_ingresos.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index = False) 


        jrxml_filename = './reportes/jrxml/Ingresos.jrxml'  # input jrxml filename
        output_filename = './reportes/descargas/Ingresos.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_ingresos.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()
        rutapdf = os.getcwd() + r'\reportes\descargas\Ingresos.pdf'  

        return 'BIEN O BUENO'
   
    def frecuentes(self):

        db=DB_reporte()
        Datos = db.frecuentes()
        print(Datos)

        path = os.getcwd() + r'\reportes\temp\datos_Frecuentes.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index = False) 


        jrxml_filename = './reportes/jrxml/Frecuentes.jrxml'  # input jrxml filename
        output_filename = './reportes/descargas/Frecuentes.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_frecuentes.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()
        rutapdf = os.getcwd() + r'\reportes\descargas\Frecuentes.pdf'  

        return 'BIEN O BUENO'
   
    def Mes(self):

        db=DB_reporte()
        Datos = db.Mes()
        print(Datos)

        path = os.getcwd() + r'\reportes\temp\datos_Mes.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index = False) 


        jrxml_filename = './reportes/jrxml/Mes.jrxml'  # input jrxml filename
        output_filename = './reportes/descargas/Mes.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_Mes.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()
        rutapdf = os.getcwd() + r'\reportes\descargas\Mes.pdf'  

        return 'BIEN O BUENO'    



if (__name__ == '__main__'):
    Reporte().Mes()   

    {'ti_nombre': 'UCABmart - Barrancas', 'nom_cliente': 'FABIANO LEONARDO, JONES GODINEZ', 'cant_compras': 3, 'max': 238500000},
   
    
   
