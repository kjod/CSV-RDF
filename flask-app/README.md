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

Upload data
```
python add_data.py
```