from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
import logging
import pandas as pd
import numpy as np
from bokeh.plotting import figure 
from bokeh.embed import components
from bokeh.models import NumeralTickFormatter, ColumnDataSource, HoverTool
from django.views.decorators.cache import cache_page

logger = logging.getLogger('django')

# @cache_page(60 * 15)
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
        query_text = "SELECT * from answers_view where salarymx > 0"
        df = pd.read_sql(query_text, db_conn)

    hist, edges = np.histogram(df['salarymx'], bins=24, range=(0,120000))

    hist_df = pd.DataFrame({ 'obs': hist, 'left': edges[:-1], 'right': edges[1:]})
    hist_df['interval'] = ['%d a %d pesos' % (left, right) for left, right in zip(hist_df['left'], hist_df['right'])]
    logger.info(f"Keys: {hist_df.head()}")

    src = ColumnDataSource(hist_df)
    logger.info(f"Keys: {src.data.keys()}")

    p = figure(plot_height = 400, plot_width = 600, title = "Salario de profesionistas de software en México", x_axis_label = 'Salario bruto mensual (MXN)', y_axis_label = '# de observaciones', toolbar_location=None)
    p.xaxis.ticker = list(range(0,121000,10000))
    p.xaxis.formatter = NumeralTickFormatter(format='$0 a')    
    p.quad(source=src, bottom=0, top='obs', left='left', right='right', line_color='#c0c0c0')
    p.add_tools(HoverTool(tooltips=[
        ('Salario', '@interval'), 
        ('Observaciones', '@obs')
    ]))

    script, div = components(p)

    context = {
        'script' : script,
        'div' : div
    }

    return render(request, 'stats/salariomx.html', context)
