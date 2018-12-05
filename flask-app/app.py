from flask import Flask
from flask import request
from models import *
from data_upload import add_data
import importlib

app = Flask(__name__)
app.config['DEBUG'] = True

POSTGRES = {
    'user': 'postgres',
    'pw': 'postgres',
    'db': 'incognito',
    'host': 'localhost',
    'port': '5432',
}
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://%(user)s:\
%(pw)s@%(host)s:%(port)s/%(db)s' % POSTGRES

with app.app_context():
	db.init_app(app)

@app.route("/")
def hello():
    return "Hello World!"
 

@app.route("/data_upload")
def add():
    table = request.args.get('table')
    return add_data(table)


@app.route("/view")
def view():
    models = ['Wine', 'Grape', 'Ingredients', 'TastingNote', 'Region', 'Country']
    html = ''
    for table_name in models:
        table_instance = getattr(importlib.import_module('models'), table_name)
        html += '<h1>%s</h1>' % table_name
        html += '<table>'
        
        instance = table_instance.query.all()[0]
        html += '<tr>'
        for field in instance.__dict__:
            html += '<th>%s</th>' % field
        html += '</tr>'
        
        for instance in table_instance.query.all():
            html += '<tr>'
            for field in instance.__dict__:
                html += '<td>%s</td>' % getattr(instance, field)
            html += '</tr>'
        html += '</table>'
    
    return html


if __name__ == '__main__':
    app.run()
