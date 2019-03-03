from flask import Flask, request, jsonify
from flask_cors import CORS
import traceback
import numpy as np
import pandas as pd
import plotly
import plotly.plotly as py
import plotly.graph_objs as go
import plotly
from plotly.offline import download_plotlyjs,init_notebook_mode,plot,iplot
import cufflinks as cf
import plotly.plotly as py
import plotly.graph_objs as go
import plotly.figure_factory as ff
from plotly.graph_objs import *
import seaborn as sns
import matplotlib.pyplot as plt
import requests
import json
from plotly import __version__
from plotly.offline import download_plotlyjs,init_notebook_mode,plot,iplot
# import pyfpdf
import fpdf
import cufflinks as cf
cf.go_offline()
init_notebook_mode(connected = True)
# from fpdf import FPDF
from PIL import Image


# import pymysql

# conn=pymysql.connect(host='localhost',user='root',passwd="",db='sih', autocommit=True)

# c=conn.cursor()
# query = 'select * from userdat'
# results = pd.read_sql_query(query, conn)
# results.to_csv("dummySIH3.csv", index=False)
# query1 = 'select city,state,latitude,logitude from locdata'
# results1 = pd.read_sql_query(query1 , conn)
# results1.to_csv("dummySIH4.csv" , index = False)
# Your API definition
app = Flask(__name__)
CORS(app)

# url = 'https://sih-temper-app.herokuapp.com/getuserdb' 
url = 'https://sih-temper-app.eu-gb.mybluemix.net/getuserdb'  
JSONContent = requests.get(url).json()
dat = JSONContent['table']
df = pd.DataFrame(dat)
# df = pd.read_csv('./dummySIH3.csv')
df.columns = ['uid' , 'city' , 'state',"gender","age_range_id","latitude","longitude" ,"se_rank", "rt_rank","cs_rank","si_rank","overall_rank"]
df.fillna(0 , inplace =  True)
df['si_rank'] = df['si_rank'].apply(lambda x: ((x/7) * 100) )
df['se_rank'] = df['se_rank'].apply(lambda y: ((y/4) * 100))
df['cs_rank'] = df['cs_rank'].apply(lambda z : ((z/6) * 100))
df['rt_rank'] = df['rt_rank'].apply(lambda a : ((a/3) * 100))
df['overall_rank'] = df['overall_rank'].apply(lambda b : ((b/20) * 100))
num = df._get_numeric_data()
num[num < 0] = 0
df.replace("", np.nan, regex=True)
myarr = np.random.randint(2 , size = df.shape[0])
mynewarr = ['a']*df.shape[0]
for i in range(len(myarr)):
    if(myarr[i] == 1):
        mynewarr[i] = 'M'
    if(myarr[i] == 0):
        mynewarr[i] = 'F'
df['gender'] = mynewarr
newlen = int(0.1 *df.shape[0])
mysecarr = np.random.randint(df.shape[0] , size = newlen)
for i in mysecarr:
    df['gender'][i] = 'O'

def mapCity():
    latitude = np.array(locations['latitude'])
    longitude = np.array(locations['logitude'])
    dummydf = df[['uid','latitude','longitude']]
    mindif = 99999999
    id = np.array(df['uid'])
    for i in id:
        lat = df[df['uid'] == i]['latitude'].iloc[0]
        lon = df[df['uid'] == i]['longitude'].iloc[0]
        # print(lat,lon)
        mindif = 99999999
        for j in range(len(latitude)):
            if(abs(lat - latitude[j]) < mindif and abs(lon - longitude[j])< mindif):
                # print("I am  funny")
                minlat = latitude[j]
                minlon = longitude[j]
                mindif =abs(lat - latitude[j])
        city = locations[locations['logitude'] == minlon]['city'].iloc[0]
        state = locations[locations['logitude'] == minlon]['state'].iloc[0]
        # print('{} {}'.format(city,state))
        c.execute("UPDATE userdat SET city='{}' WHERE uid = {}".format(city,i))
        c.execute("UPDATE userdat SET state='{}' WHERE uid = {}".format(state,i))



# def dem():
# newdat = df.drop(['state'], axis = 1).groupby('city').mean().reset_index()
# newdat['mAll'] = newdat[["se_rank", "rt_rank","cs_rank","si_rank"]].mean(axis = 1)
# newdat['spAll'] = newdat[[ "rt_rank","cs_rank","si_rank"]].mean(axis = 1)
# newdat['rtAll'] = newdat[["se_rank", "cs_rank","si_rank"]].mean(axis = 1)
# newdat['cerAll'] = newdat[["se_rank", "rt_rank","si_rank"]].mean(axis = 1)
# newdat['sciAll'] = newdat[["se_rank", "rt_rank","cs_rank"]].mean(axis = 1)
# newdat.to_csv()
    # print(please work)

@app.route('/export' , methods=['GET', 'POST'])
def makePdf():
    content = piePlot()

    width = 900
    height = 900
    cover = Image.open(fileName + ".PNG")

    pdf = FPDF(unit = "pt" , format = [width, height])

    
    pdf.add_page()
    pdf.image(fileName + ".PNG", 0, 0)

    pdf.output(fileName + ".pdf", "F")


@app.route('/demographics' , methods=['GET', 'POST'])
def locPlot():
    # newdat = pd.read_csv(newdat.csv)
    # columnsPlace = {
    #     "mAll": "Scientific Temper"
    #     "spAll": " Spirit of Enquiry",
    #     "rtAll": "Rationality",
    #     "cerAll": "Cause Effect Relationship",
    #     "sciAll": "Scientific Information"
    # }
    content = request.json
    plotit = content['score']
    newdat = df.drop(['gender','state'], axis = 1).groupby('city').mean().reset_index()
    l = newdat.shape[0]

    myarr =  list(newdat.columns)
    # print(plotit)
    print(myarr)
        
    if(len(plotit)>=1):
        for i in plotit:
            print(i)
            myarr.remove(i)

    if(len(plotit) == 0 ):
        myarr =  list(newdat.columns)


    mystr = ''
    arr = newdat[myarr].mean(axis = 1)
    print(newdat['latitude'],newdat['longitude'])
    tot = np.array(arr)
    loc = np.array(newdat['city'])
    print("whwrw")
    textdat = ['a'] * l
    txt1 = ['a'] * l
    for i in range(0,l):
        textdat[i] = 'Score:' + str(tot[i]) + '<br>' + loc[i]
    print("wee")

    py.sign_in('sunitasen', 'aaI4oYzy4nRlZjmUzkeb')
    totalTemper = {
    "hoverlabel": {"font": {"size": 15}},
    "hovertext": textdat,
    "lat": newdat['latitude'],
    "lon": newdat['longitude'],
        "marker": {
        "color": "#1d07b2", 
        "opacity": 0.9, 
        "size": 20, 
    }, 
    "mode": "markers+text", 
    "opacity": 0.8, 
    "type": "scattermapbox"
    }
    data = Data([totalTemper])
    layout = {
    "autosize": True, 
    "hovermode": "closest", 
    "mapbox": {
        "accesstoken": "pk.eyJ1Ijoic3VuaXRhc2VuIiwiYSI6ImNqczI4NHFhZDA2eGY0M3BtM2kwaDZxcWkifQ.oMk2u_SM6O8IDK_ZLG-Ltg", 
        "center": {
        "lat": 20.5937, 
        "lon": 78.9629
        }, 
        "pitch": 0, 
        "zoom" : 3.5,
    }, 
    "title": "Demographic Plot"
    }
    fig = Figure(data=data, layout=layout)
    url = py.plot(fig ,filename="{}demo".format(tot[0]),auto_open=False)
    return jsonify( ans= url)

@app.route('/pie' , methods=['GET', 'POST'])
def piePlot():
    columnsPlace = {
        "0": "state",
        "1": "age_range_id",
        "2": "se_rank",
        "3": "rt_rank",
        "4": "cs_rank",
        "5": "si_rank",
        "6": "overall_rank",
        "7": "gender"
    }
    Mycolumns = {
        "0":"Different States",
        "1": "Age Slabs",
        "2": "Spirit of Enquiry",
        "3": "Rationality",
        "4": "Cause Effect Relationship",
        "5": "Scientific Information",
        "6": "Overall Percentage",
        "7": "Gender"
    }
    content = request.json
    labels = columnsPlace[content['label']]
    values = columnsPlace[content['value']] 

    labeltit = Mycolumns[content['label']]
    valuetit = Mycolumns[content['value']] 

    if(values == "age_range_id" or values == "state" or values == "gender"):
        (labels , values) = (values , labels)
        (labeltit , valuetit) = (valuetit , labeltit)

    label = list(df[labels])
    value = list(df[values])
    fig = {
    "data":[
        {
            "labels" : label,
            "values" : value,
            "hoverinfo" : 'label+percent',
            "domain": {"x": [0, .9]},
            "hole" : 0.4,
            "type" : "pie",
            
        },
    ],
    "layout": {
        "title" : "Plot of {} with respect to {} ".format(labeltit , valuetit),
        "annotations": [
            {
                "font": {"size":20},
                "showarrow": True,
                "text": "{}".format(labeltit),
                "x":0.2,
                "y":0.9,
                },
            ],
        "showlegend": ['m','n','o']

        }
    }

    plotly.offline.plot(fig ,filename="{}_{}pie".format(labels,values), auto_open=False)
    result = str("{}_{}pie.html".format(labels,values))

    return jsonify( ans= result)




@app.route('/scatter', methods=['GET', 'POST'])   
def scatterPlot():
    columns = {
        "0": "state",
        "1": "age_range_id",
        "2": "se_rank",
        "3": "rt_rank",
        "4": "cs_rank",
        "5": "si_rank",
        "6": "overall_rank",
        "7": "gender"
    }

    Mycolumns = {
        "0":"Different States",
        "1": "Age Slabs",
        "2": "Spirit of Enquiry",
        "3": "Rationality",
        "4": "Cause Effect Relationship",
        "5": "Scientific Information",
        "6": "Overall Percentage",
        "7": "Gender"
    }
    content = request.json
    xdat = columns[content['xdat']]
    ydat = columns[content['ydat']]
    xtit = Mycolumns[content['xdat']]
    ytit = Mycolumns[content['ydat']]

    result = str("{}_{}scatter.html".format(xdat,ydat))
    print(xdat)
    print(ydat)
    xinfo = df[xdat]
    yinfo = df[ydat]
    

    satinfo = df["overall_rank"]
    trace1 = go.Scatter(
        x=xinfo,
        y=yinfo,
        mode='markers',
        marker=dict(
            size='16',
            color = satinfo,
            colorscale='Electric',
            showscale=True
        ),
    )
    data = [trace1]
    layout = go.Layout(
        xaxis = dict(title = '{}'.format(xtit)),
        yaxis = dict(title = '{}'.format(ytit)),
    font=dict(family='Comic sans', size=15, color='#000000'),
    title="Scatter plot of {} vs {}".format(xtit,ytit),
    )
    fig = go.Figure(data=data, layout=layout)
    
    plotly.offline.plot(fig ,filename="{}_{}scatter".format(xdat,ydat), auto_open = False)
    return jsonify( ans= result)






@app.route('/bar', methods=['GET', 'POST'])   
def barPlot():
    columns = {
        "0": "state",
        "1": "age_range_id",
        "2": "se_rank",
        "3": "rt_rank",
        "4": "cs_rank",
        "5": "si_rank",
        "6": "overall_rank",
        "7": "gender"
    }
    Mycolumns = {
        "0":"Different States",
        "1": "Age Slabs",
        "2": "Spirit of Enquiry",
        "3": "Rationality",
        "4": "Cause Effect Relationship",
        "5": "Scientific Information",
        "6": "Overall Percentage",
        "7": "Gender"
    }
    content = request.json
    
    xdat = columns[content['xdat']]
    ydat = columns[content['ydat']]

    # title 
    xtit = Mycolumns[content['xdat']]
    ytit = Mycolumns[content['ydat']]

    if(xdat == "state" or xdat == "age_range_id" or xdat == "gender"):
            (xdat , ydat) = (ydat , xdat)
            (xtit , ytit) = (ytit , xtit)
    # if(xdat != "age_range_id" or xdat != "state"):
    result = str("{}_{}bar.html".format(xdat,ydat))
    print(xdat)
    print(ydat)
    xinfo = df[xdat]
    yinfo = df[ydat]
    satinfo = df["overall_rank"]

    data = [go.Bar(
                x=xinfo,
                y=yinfo,
                orientation = 'h',
        )]

    layout = go.Layout(
        xaxis = dict(title = '{}'.format(xtit)),
        yaxis = dict(title = '{}'.format(ytit)),
      font=dict(family='Comic sans', size=15, color='#000000'),
      title="Bar plot of {} vs {}".format(xtit,ytit),
      height = 9,
    )
    fig = go.Figure(data=data, layout=layout)
    plotly.offline.plot(fig, filename="{}_{}bar".format(xdat,ydat) , auto_open = False)
    return jsonify( ans= result)


@app.route('/scatterthumb', methods=['GET', 'POST']) 
def scatterthumb():
    columnsPlace = {
        "0": "state",
        "1": "age_range_id",
        "2": "se_rank",
        "3": "rt_rank",
        "4": "cs_rank",
        "5": "si_rank",
        "6": "overall_rank",
        "7": "gender"
    }
    content = request.json
    labels = columnsPlace[content['label']]
    sizes = columnsPlace[content['value']]
    paletteSize = df.shape[0]
    plt.figure(figsize=(18, 10), dpi=80)
    cmap = sns.color_palette("husl", paletteSize)
    ax = sns.scatterplot(x=labels, y=sizes,
                        hue="overall_rank",legend = False,
                        palette=cmap, sizes=(30, 200),
                        data=df)
    ax.get_figure().savefig("{}_{}.pdf".format(labels,sizes))

    ax.get_figure().savefig("{}_{}.png".format(labels,sizes))
    result = "url('{}_{}.png')".format(labels,sizes)
    return jsonify( ans= result)


@app.route('/piethumb', methods=['GET', 'POST']) 
def piethumb():
    columnsPlace = {
        "0": "state",
        "1": "age_range_id",
        "2": "se_rank",
        "3": "rt_rank",
        "4": "cs_rank",
        "5": "si_rank",
        "6": "overall_rank",
        "7": "gender"
    }
    content = request.json
    labels = columnsPlace[content['label']]
    values = columnsPlace[content['value']]
    if(values == "age_range_id" or values == "state"):
        (labels , values) = (values , labels)

    newdat = df.groupby(str(labels)).mean().reset_index()
    val = newdat[str(values)].sum()
    myarr = newdat[str(values)]
    for x in myarr:
        x = x * 100/val 

    f = plt.figure(figsize=(8, 6), dpi=80)
    # Pie chart, where the slices will be ordered and plotted counter-clockwise:
    label = newdat[str(labels)]
    sizes = df[str(values)]
    # explode = (0, 0.1, 0, 0)  # only "explode" the 2nd slice (i.e. 'Hogs')
    
    fig1, ax1 = plt.subplots()
    myplot = ax1.pie(myarr, startangle=90 , labels = label)
    # ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    ax1.set(aspect = "equal" ,title = 'plot of {} and {}'.format(labels,values))
    # fig = myplot.fig
    fig1.savefig("./pdfFiles/{}_{}.pdf".format(labels,values))

    fig1.savefig("{}_{}.png".format(labels,values))
    result = "url('{}_{}.png')".format(labels,values)
    return jsonify( ans= result)


if __name__ == '__main__':
    try:
        port = int(sys.argv[1]) # This is for a command-line input
    except:
        port = 12345 # If you don't provide any port the port will be set to 12345


    # df = pd.read_csv('dummySIH3.csv')
    locations = pd.read_csv('dummySIH4.csv')
    print("I am working fine")
    # print(df['cs_rank'][8])
    # mapCity()
    # dem()
    # scatterPlot('si_rank','cs_rank','overall_rank')
    app.run(port=port, debug=True)



