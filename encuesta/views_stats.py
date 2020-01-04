from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
import logging
import pandas as pd
import numpy as np
from bokeh.plotting import figure, output_file, show
from bokeh.embed import components
from bokeh.models import NumeralTickFormatter


logger = logging.getLogger('django')

def salariomx(request):
    from django.db import connections
    from django.db.utils import OperationalError
    db_conn = connections['default']
    try:
        c = db_conn.cursor()
    except OperationalError:
        df = pd.DataFrame(columns=['salarymx'])
        logger.error("Could not get connection to database for stats")
    else:
        query_text = "SELECT salarymx from answers_view where salarymx > 0"
        df = pd.read_sql(query_text, db_conn)

    salariosmx = df['salarymx']
    logger.info(salariosmx.describe())
    hist, edges = np.histogram(salariosmx, bins=12, range=(0,120000))
    p = figure(plot_height = 400, plot_width = 800, title = "Mexico: Salario bruto mensual (MXN)", x_axis_label = 'Salario', y_axis_label = '# de respuestas', toolbar_location=None)
    p.xaxis.ticker = list(range(0,121000,10000))
    p.xaxis.formatter = NumeralTickFormatter(format='$0 a')
    p.quad(bottom=0, top=hist, left=edges[:-1], right=edges[1:], line_color='#c0c0c0')

    script, div = components(p)

    context = {
        'count' : salariosmx.count(),
        'script' : script,
        'div' : div
    }

    return render(request, 'stats/salariomx.html', context)
