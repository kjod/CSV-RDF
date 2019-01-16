from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

class BaseModel(db.Model):
    """Base data model for all objects"""
    __abstract__ = True

    def __init__(self, *args):
        print('checking args ', args)
        super().__init__(*args)

    def __repr__(self):
        """Define a base way to print models"""
        return '%s(%s)' % (self.__class__.__name__, {
            column: value
            for column, value in self._to_dict().items()
        })

    def json(self):
        """
                Define a base way to jsonify models, dealing with datetime objects
        """
        return {
            column: value if not isinstance(value, datetime.date) else value.strftime('%Y-%m-%d')
            for column, value in self._to_dict().items()
        }


class Grape(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'grape'

    #grape_id = db.Column(db.Integer)
    name = db.Column(db.String, primary_key = True)
    colour = db.Column(db.String)

    def __init__(self, name=None, colour=None):
        self.name = name
        self.colour = colour

class Country(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'country'
    #country_id = db.Column(db.Integer)
    name = db.Column(db.String, primary_key = True)

    def __init__(self, name=None):
        self.name = name
        

class Region(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'region'

    #region_id = db.Column(db.Integer)
    name = db.Column(db.String, primary_key = True)
    country_id = db.Column(db.String, db.ForeignKey('country.name'))

    def __init__(self, name=None, country_id=None):
        self.name = name
        self.country_id = country_id #int(country_id)

class Wine(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'wine'

    #wine_id = db.Column(db.Integer)
    name = db.Column(db.String, primary_key = True)
    region_id = db.Column(db.String, db.ForeignKey('region.name'))
    body = db.Column(db.String)
    sweetness = db.Column(db.String)
    wine_type = db.Column(db.String)

    def __init__(self, name=None, region_id=None, body=None, sweetness=None, wine_type=None):
        self.name = name
        self.region_id = region_id #int(region_id)
        self.body = body
        self.sweetness = sweetness
        self.wine_type = wine_type 

    def __repr__(self):
        return self.name

class Ingredients(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'ingredients'

    ingredients_id = db.Column(db.Integer, primary_key = True)
    grape_id = db.Column(db.String, db.ForeignKey('grape.name'))
    wine_id = db.Column(db.String, db.ForeignKey('wine.name'))

    def __init__(self, grape_id=None, wine_id=None):
        self.grape_id = grape_id #int(grape_id)
        self.wine_id = wine_id #int(wine_id)

class TastingNote(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'tasting_note'

    tastingnote_id = db.Column(db.Integer, primary_key = True)
    wine_id = db.Column(db.String, db.ForeignKey('wine.name'))
    note = db.Column(db.String)
    
    def __init__(self, note=None, wine_id=None):
        self.note = note
        self.wine_id = wine_id #int(wine_id)

    def __repr__(self):
        return '<TastingNote %r>' % self.note