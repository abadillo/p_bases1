from agatereports.basic_report import BasicReport
from database.DB_reporte import DB_reporte
from datetime import datetime
import datetime

import logging
logger = logging.getLogger(__name__)


class reporte_asist():
    """
    CSV data source sample.
     """
    logger.info('running datasource csv sample')
    db = DB_reporte()
    Datos = db.report('2020-12-01',59)

    for entidad in Datos:
        for atributo in entidad:
            if type(entidad[atributo]) == datetime.date:
                entidad[atributo] = str(entidad[atributo])

    print(Datos)
    # jrxml_filename = './jrxml/datasource_csv.jrxml'  # input jrxml filename
    # output_filename = './output/datasource_csv.pdf'    # output pdf filename

    # CSV datasource configuration
    data_config = {'adapter': 'csv', 'filename': './temp/product.csv'}

    pdf_page = BasicReport(jrxml_filename=jrxml_filename, output_filename=output_filename, data_config=data_config)
    pdf_page.generate_report()

