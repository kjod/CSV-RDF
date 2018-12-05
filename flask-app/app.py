from flask import Flask
from models import db

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

db.init_app(app)

@app.route("/")
def hello():
    return "Hello World!"
 

if __name__ == '__main__':
    app.run()
