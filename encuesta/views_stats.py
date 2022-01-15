from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
import logging
import pandas as pd
import numpy as np
from bokeh.plotting import figure 
from bokeh.embed import components
from bokeh.models import ColumnDataSource, HoverTool, NumeralTickFormatter, DataTable, TableColumn, NumberFormatter, LabelSet, Range1d

from django.views.decorators.cache import cache_page

logger = logging.getLogger('django')

def get_salary_column(country):
    if country == "mx":
        return "salarymx"
    else:
        return "salaryusd"

def hist_plot(df, country="mx"):
    column = get_salary_column(country)

    hist, edges = np.histogram(df[column], bins=24, range=(0,120000))
    hist_df = pd.DataFrame({ 'obs': hist, 'left': edges[:-1], 'right': edges[1:]})
    hist_df['interval'] = ['%d a %d pesos' % (left, right) for left, right in zip(hist_df['left'], hist_df['right'])]
    src = ColumnDataSource(hist_df)
    p = figure(plot_height = 400, plot_width = 600, sizing_mode="scale_both", toolbar_location=None)
    p.toolbar.active_drag = None
    p.toolbar.active_scroll = None
    p.title.text = 'Salario de profesionistas de software'
    p.xaxis.axis_label = 'Salario bruto mensual (MXN)'
    p.yaxis.axis_label = '# de observaciones'
    p.xaxis.ticker = list(range(0,121000,10000))
    p.xaxis.formatter = NumeralTickFormatter(format='$0 a')    
    p.quad(source=src, bottom=0, top='obs', left='left', right='right', line_color='#c0c0c0')
    p.add_tools(HoverTool(tooltips=[
        ('Salario', '@interval'), 
        ('Observaciones', '@obs')
    ]))
    return p

def exp_plot(df,country="mx"):
    column = get_salary_column(country)

    df['exp_bin'] = pd.cut(df['experience'],bins=[-0.1,2,4,6,8,10,14,20,40])

    exp = df.groupby('exp_bin')[column].agg(['count', 'median'])
    exp = exp.reset_index()
    logger.info(exp.head())

    exp_labels = ['0-2', '3-4', '5-6', '7-8', '9-10', '11-14', '15-20', '20+']
    exp['exp_bin'] = exp_labels

    from bokeh.palettes import YlGn9
    exp['color'] = YlGn9[0:8]

    src = ColumnDataSource(exp)

    p = figure(x_range=exp_labels, plot_height = 400, plot_width = 600, sizing_mode="scale_both", toolbar_location=None)
    p.toolbar.active_drag = None
    p.toolbar.active_scroll = None

    p.vbar(source=src, x='exp_bin', top='median', width=0.95, color='color')
    p.title.text = 'Salario medio de acuerdo a a la experiencia'
    p.xaxis.axis_label = 'Experiencia (años)'
    p.yaxis.axis_label = 'Salario bruto mensual (MXN)'
    p.yaxis.formatter = NumeralTickFormatter(format='$0 a')

    hover = HoverTool()
    hover.tooltips=[
        ('Experiencia', '@exp_bin años'),
        ('Observaciones', '@count'),
        ('Salario medio', '@median{$0,0}'),
    ]
    p.add_tools(hover)

    return p

def english_plot(df,country="mx"):
    column = get_salary_column(country)

    tmp = df.groupby(['english_num','exp_bin'])[column].agg(['median', 'count']).fillna(0)
    exp_labels = ['0-2', '3-4', '5-6', '7-8', '9-10', '11-14', '15-20', '20+']
    data = {
        'exp': exp_labels,
        'Elemental': list(tmp.xs(1)['median']),
        'Limitado' : list(tmp.xs(2)['median']),
        'Profesional' : list(tmp.xs(3)['median']),
        'Avanzado' : list(tmp.xs(4)['median']),
        'Nativo' : list(tmp.xs(5)['median'])    
    }

    engdf = pd.DataFrame(data)
    src = ColumnDataSource(engdf)

    p = figure(x_range=exp_labels, plot_height = 400, plot_width = 600, sizing_mode="scale_both", toolbar_location=None)
    p.toolbar.active_drag = None
    p.toolbar.active_scroll = None

    from bokeh.palettes import Dark2

    for col_name, color in zip(list(engdf.columns), Dark2[6]):
        if col_name == 'exp':
            continue

        p.add_tools(HoverTool(
            renderers= [p.line('exp', col_name, source=src, color=color, legend_label=col_name, line_width=2)],
            tooltips=[
                ('Ingles', col_name),
                ('Salario', '@'+col_name+'{$0,0}')
            ]
        ))

    p.title.text = 'Salario de acuerdo al nivel de inglés'
    p.xaxis.axis_label = 'Experiencia (años)'
    p.yaxis.axis_label = 'Salario'
    p.yaxis.formatter = NumeralTickFormatter(format='$0 a')
    p.legend.location = "top_left"

    return p

def city_table(df):
    cities = df[(df["profile"] == "godin")].groupby("city")['salarymx', 'experience'].agg(['count', 'median', 'mean'])
    cities = cities.reset_index()
    cities.columns = cities.columns.map('_'.join)

    cities = cities[(cities["salarymx_count"]> 5)]
    cities = cities[(cities["salarymx_median"]> 0)]
    cities = cities.sort_values(by=['salarymx_median'], ascending=False)
    src = ColumnDataSource(cities)
    columns = [
        TableColumn(field="city_", title="Ciudad"),
        TableColumn(field="salarymx_count", title="n"),
        TableColumn(field="salarymx_median", title="Salario", formatter=NumberFormatter(format='$0,0')),
        TableColumn(field="experience_mean", title="Experiencia promedio", formatter=NumberFormatter(format='0')),
    ]
    table = DataTable(source=src,columns=columns,index_position=None, width=420)
    return table


def act_table(df):
    from django.db import connections
    from django.db.utils import OperationalError
    db_conn = connections['default']
    act_list = []
    try:
        c = db_conn.cursor()
    except OperationalError:
        logger.error("Could not get connection to database for stats")
    else:
        c.execute("select concat('act_', c.`key`) as k, c.`text` as v from encuesta_choice c where question_id = 5")
        result = c.fetchall()
        c.close()
        for row in result:
            k = row[0]
            v = row[1]
            act_list.append([v, df[(df[k] == "Y")]["salarymx"].count(), df[(df[k] == "Y")]["salarymx"].median(), df[(df[k] == "Y")]["salarymx"].std()])

    act_df = pd.DataFrame(act_list, columns=['actividad', 'n', 'median', 'std'])	
    act_df = act_df.sort_values(by=['median'], ascending=False)
    
    src = ColumnDataSource(act_df)
    columns = [
        TableColumn(field="actividad", title="Actividad", width=350),
        TableColumn(field="n", title="n", width=50),
        TableColumn(field="median", title="Salario", width=70, formatter=NumberFormatter(format='$0,0')),
        TableColumn(field="std", title="Des Std", width=70, formatter=NumberFormatter(format='$0,0')),
    ]
    table = DataTable(source=src,columns=columns,index_position=None, height=760, width=540)
    return table

def gender_plot(df,country="mx"):
    column = get_salary_column(country)

    gender = df[(df['experience'] > 0)].groupby(["experience", "gender"])[column].agg(['median','count'])
    gender = gender.reset_index()
    gender = gender[(gender['count'] > 4)]
    gender['size'] = round(np.sqrt(gender['count']))*2

    # Agregamos una columna de color en base al valor de gender.
    gender['color'] = ['#1f77b4' if x =='hombre' else '#e617e6' for x in gender['gender']] 

    src = ColumnDataSource(gender)
    p = figure(plot_height = 400, plot_width = 600, sizing_mode="scale_both", toolbar_location=None)
    p.toolbar.active_drag = None
    p.toolbar.active_scroll = None
    p.circle(x='experience', y='median', source=src, size='size', color='color')
    p.title.text = 'Comparativo por género'
    p.xaxis.axis_label = 'Experiencia (años)'
    p.yaxis.axis_label = 'Salario bruto mensual (MXN)'
    p.yaxis.formatter = NumeralTickFormatter(format='$0 a')

    hover = HoverTool()
    hover.tooltips=[
        ('Género', '@gender'),    
        ('Experiencia', '@experience años'),
        ('Observaciones', '@count'),
        ('Salario medio', '@median{$0,0}'),
    ]

    p.add_tools(hover)
    return p

def lang_plot(df,country="mx"):
    from .models import Choice
    column = get_salary_column(country)

    lang_list = []
    langs = Choice.objects.filter(question__id=14,active=True)
    for lang in langs:
        lang_key = "lang_"+lang.key
        lang_list.append([lang.text, df[(df[lang_key]=="Y")][column].count(), df[(df[lang_key]=="Y")][column].median()])
    lang_df = pd.DataFrame(lang_list, columns = ['lenguaje', 'count', 'salario'])
    lang_df.drop(lang_df[lang_df['count'] < 5].index, inplace=True)
    lang_df['popularidad'] = np.log(lang_df['count'])
    logger.info(lang_df.head())

    src = ColumnDataSource(lang_df)
    p = figure(plot_height = 400, plot_width = 600, sizing_mode="scale_both")
    p.toolbar.active_drag = None
    p.toolbar.active_scroll = None
    p.circle(source=src, y='popularidad', x='salario', line_color=None, fill_color=None, size=20)
    p.title.text = 'Lenguajes de programación utilizados'
    p.yaxis.axis_label = 'Popularidad'
    p.yaxis.major_label_text_font_size = '0pt'
    p.xaxis.axis_label = 'Salario bruto mensual (MXN)'
    p.xaxis.formatter = NumeralTickFormatter(format='$0 a')    
    p.x_range = Range1d(15000, 90000)

    labels = LabelSet(source=src, x='salario', y='popularidad', text='lenguaje', level='glyph',
              x_offset=-10, y_offset=-5, render_mode='canvas', text_font_size='9pt', text_color='#1f77b4')
    p.add_layout(labels)

    hover = HoverTool()
    hover.tooltips=[
        ('Lenguaje', '@lenguaje'),
        ('Observaciones', '@count'),
        ('Salario medio', '@salario{$0,0}'),
    ]
    p.add_tools(hover)

    return p

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
        query_text = "SELECT * from answers_view WHERE salarymx > 0"
        df = pd.read_sql(query_text, db_conn)
        logger.info(df.head())

    plots = []

    plots.append(exp_plot(df))
    plots.append(english_plot(df))
    plots.append(gender_plot(df))
    plots.append(city_table(df))
    plots.append(act_table(df))
    plots.append(lang_plot(df))

    script, divs = components(plots)

    context = {
        'script' : script,
        'divs' : divs
    }

    return render(request, 'stats/stats.html', context)
