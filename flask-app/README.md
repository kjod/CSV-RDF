## Install instructions
---
|Requirement|Recommended Version|
|---		|---				|
|python3    |3.5				|
|postgres	|10.5				|

Install requirements on virtual environment.
```
virtualenv .env -p python3
source .env/bin/activate
pip install -r requirements.txt

```

Create database
```
sudo -u postgres psql
CREATE DATABASE incognito;
```

Intialise database
```
python manage.py db init
python manage.py db migrate
python manage.py db upgrade
```

Starting server
```
python app.py
```

Go to http://127.0.0.1:5000/

## Add data
Adding data is done through the data_upload endpoint. Get request is used to add csv from samples_csv folder. The beloe example is adding the Country.csv file.

http://127.0.0.1:5000/data_upload/?table=County

## View data

http://127.0.0.1:5000/view