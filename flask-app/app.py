from flask import Flask
from flask import request
from models import db
from data_upload import add_data

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



if __name__ == '__main__':
    app.run()
