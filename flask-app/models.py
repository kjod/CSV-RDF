from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

class BaseModel(db.Model):
    """Base data model for all objects"""
    __abstract__ = True

    def __init__(self, *args):
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

    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    colour = db.Column(db.String)


class Country(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'country'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)

class Region(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'region'

    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    country_id = db.Column(db.Integer, db.ForeignKey('country.id'))

class Wine(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'wine'

    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    region_id = db.Column(db.Integer, db.ForeignKey('region.id'))
    body = db.Column(db.String)
    sweetness = db.Column(db.String)
    typoe = db.Column(db.String)


class Ingredients(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'ingredients'

    id = db.Column(db.Integer, primary_key = True)
    grape_id = db.Column(db.Integer, db.ForeignKey('grape.id'))
    wine_id = db.Column(db.Integer, db.ForeignKey('wine.id'))

class TastingNote(BaseModel, db.Model):
    """Model for the graps table"""
    __tablename__ = 'tasting_notes'

    id = db.Column(db.Integer, primary_key = True)
    wine_id = db.Column(db.Integer, db.ForeignKey('wine.id'))
    note = db.Column(db.String)