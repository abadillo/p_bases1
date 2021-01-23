import os

from platform import python_version

from pyjasper.jasperpy import JasperPy

 

def advanced_example_using_database():

    input_file = os.path.dirname(os.path.abspath(__file__)) + \

                 '/examples/sample.jrxml'

    output = os.path.dirname(os.path.abspath(__file__)) + '/output/examples/'

    print(input_file)

    print(output)

 

    con = {

        'driver': 'mysql',

        'username': 'root',

        'password': 'manager',

        'host': '127.0.0.1',

        'database': 'sakila',

        'port':'3306'

    }