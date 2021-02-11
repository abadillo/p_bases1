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

        path = os.getcwd() + r'\reportes\temp\datos_report.xlsx'      
        pandas.DataFrame(Datos).to_excel( path ) 

        return 'Bien o bueno'

    def horario(self,fecha,tienda,empleado):
        
        db = DB_reporte()
        Datos = db.report(fecha,tienda)     

        path = os.getcwd() + r'\reportes\temp\datos_horario.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index=False) 


        jrxml_filename = './reportes/jrxml/Horario.jrxml'  # input jrxml filename
        output_filename = './reportes/pdf/Horario.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_horario.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()
        rutapdf = os.getcwd() + r'\reportes\pdf\Horario.pdf'  

        return rutapdf

    def ingreso(self,fecha1,fecha2):

        db=DB_reporte()
        Datos = db.ingreso(fecha1,fecha2)
       
        path = os.getcwd() + r'\reportes\temp\datos_ingresos.csv'      
        pandas.DataFrame(Datos).to_csv( path ,index = False) 

        jrxml_filename = './reportes/jrxml/Ingresos.jrxml'  # input jrxml filename
        output_filename = './reportes/pdf/Ingresos.pdf'    # output pdf filename
        
        data_config = {'adapter': 'csv', 'filename': './reportes/temp/datos_ingresos.csv'}

        pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
        pdf_page.generate_report()
        rutapdf = os.getcwd() + r'\reportes\pdf\Ingresos.pdf'  
        print(Datos)
        return rutapdf
   



if (__name__ == '__main__'):
    Reporte().ingreso('2020-12-01','2020-12-02')   
   
    
   

'''    dict_data= datos
[{'em_cedula': 21886853, 'n_empleado': 'ADRIA SARA, HERMOSILLO BARBOZA', 'coen_entrada': '2020-12-01', 'coen_salida': '11:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Gerente de Tienda'}, 
{'em_cedula': 16116753, 'n_empleado': 'ALFREDO ANDRnS, FLORES VELAZQUEZ', 'coen_entrada': '2020-12-01', 'coen_salida': '12:00 PM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Coordinador de Promocion y Ventas'},
{'em_cedula': 19781016, 'n_empleado': 'TITO FRANCISCO, SERNA SUAREZ', 'coen_entrada': '2020-12-01', 'coen_salida': '12:00 PM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Coordinador de Talento Humano'}, 
{'em_cedula': 16882097, 'n_empleado': 'DULCINEA nFRICA, ANGELES ORDONEZ', 'coen_entrada': '2020-12-01', 'coen_salida':'07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Jefe de Compras/Atencion al Cliente'}, 
{'em_cedula': 10650464, 'n_empleado': 'AMARA SOL, SALDANA DELAO', 'coen_entrada': '2020-12-01', 'coen_salida': '07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Cajero'}, 
{'em_cedula': 20933638, 'n_empleado': 'ORIANA AMADA, LARIOS GAMEZ', 'coen_entrada': '2020-12-01', 'coen_salida': '07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Cajero'}] 

[(Decimal('21886853'), 'ADRIA SARA, HERMOSILLO BARBOZA', '07:00 AM', '11:00 AM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Gerente de Tienda'),
 (Decimal('16116753'), 'ALFREDO ANDRnS, FLORES VELAZQUEZ', '07:00 AM', '12:00 PM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Coordinador de Promocion y Ventas'), 
 (Decimal('19781016'), 'TITO FRANCISCO, SERNA SUAREZ', '07:00 AM', '12:00 PM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Coordinador de Talento Humano'), 
 (Decimal('16882097'), 'DULCINEA nFRICA, ANGELES ORDONEZ', '12:00 PM', '07:00 AM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Jefe de Compras/Atencion al Cliente'), 
 (Decimal('10650464'), 'AMARA SOL, SALDANA DELAO', '12:00 PM', '07:00AM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Cajero'), 
(Decimal('20933638'), 'ORIANA AMADA, LARIOS GAMEZ', '12:00 PM', '07:00 AM', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa', 'Cajero')]


(Column(name='em_cedula', type_code=1700),
 Column(name='n_empleado', type_code=25),
Column(name='coen_entrada', type_code=25),
 Column(name='coen_salida', type_code=25), Column(name='coen_entrada', type_code=1082), Column(name='ti_nombre', type_code=1043), Column(name='rol', type_code=1043))


[{'em_cedula': 21886853, 'n_empleado': 'ADRIA SARA, HERMOSILLO BARBOZA', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '11:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Gerente de Tienda'},
 {'em_cedula': 16116753, 'n_empleado': 'ALFREDO ANDRnS, FLORES VELAZQUEZ', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '12:00 PM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Coordinador de Promocion y Ventas'},
 {'em_cedula': 19781016, 'n_empleado': 'TITO FRANCISCO, SERNA SUAREZ', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '12:00 PM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Coordinador de Talento Humano'},
 {'em_cedula': 16882097, 'n_empleado': 'DULCINEA nFRICA, ANGELES ORDONEZ', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Jefe de Compras/Atencion al Cliente'}, 
 {'em_cedula': 10650464, 'n_empleado': 'AMARA SOL, SALDANA DELAO', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Cajero'},
 {'em_cedula': 20933638, 'n_empleado': 'ORIANA AMADA, LARIOS GAMEZ', 'coen_entrada': datetime.date(2020, 12, 1), 'coen_salida': '07:00 AM', 'ti_nombre': 'UCABmart - Chivacoa', 'rol': 'Cajero'}]   


 [(Decimal('21886853'), 'ADRIA SARA, HERMOSILLO BARBOZA', '07:00 AM', '11:00 AM', 'Gerente de Tienda', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa'), (Decimal('16116753'), 'ALFREDO ANDRnS, FLORES VELAZQUEZ', '07:00 AM', '12:00 PM', 'Coordinador de Promocion y Ventas', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa'), (Decimal('19781016'), 'TITO FRANCISCO, SERNA SUAREZ', '07:00 AM', '12:00 PM', 'Coordinador de Talento Humano', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa'), (Decimal('16882097'), 'DULCINEA nFRICA, ANGELES ORDONEZ', '12:00 PM', '07:00 AM', 'Jefe de Compras/Atencion al Cliente', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa'), (Decimal('10650464'), 'AMARA SOL, SALDANA DELAO', '12:00 PM', '07:00 AM', 'Cajero', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa'), (Decimal('20933638'), 'ORIANA AMADA, LARIOS GAMEZ', '12:00 PM', '07:00 AM', 'Cajero', datetime.date(2020, 12, 1), 'UCABmart - Chivacoa')]
['em_cedula', 'n_empleado', 'coen_entrada', 'coen_salida', 'rol', 'dia_reporte', 'tienda_reporte']

[{'em_cedula': 21886853, 'n_empleado': 'ADRIA SARA, HERMOSILLO BARBOZA', 'coen_entrada': '07:00 AM', 'coen_salida': '11:00 AM', 'rol': 'Gerente de Tienda', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}, {'em_cedula': 16116753, 'n_empleado': 'ALFREDO ANDRnS, FLORES VELAZQUEZ', 'coen_entrada': '07:00 AM', 'coen_salida': '12:00 PM', 'rol': 'Coordinador de Promocion y Ventas', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}, {'em_cedula': 19781016, 'n_empleado': 'TITO FRANCISCO, SERNA SUAREZ', 'coen_entrada': '07:00 AM', 'coen_salida': '12:00 PM', 'rol': 'Coordinador de Talento Humano', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}, {'em_cedula': 16882097, 'n_empleado': 'DULCINEA nFRICA, ANGELES ORDONEZ', 'coen_entrada': '12:00 PM', 'coen_salida': '07:00 AM', 'rol':
'Jefe de Compras/Atencion al Cliente', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}, {'em_cedula': 10650464, 'n_empleado': 'AMARA SOL, SALDANA DELAO', 'coen_entrada': '12:00 PM', 'coen_salida': '07:00 AM', 'rol': 'Cajero', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}, {'em_cedula': 20933638, 'n_empleado': 'ORIANA AMADA, LARIOS GAMEZ', 'coen_entrada': '12:00 PM', 'coen_salida': '07:00 AM', 'rol': 'Cajero', 'dia_reporte': datetime.date(2020, 12, 1), 'tienda_reporte': 'UCABmart - Chivacoa'}] '''