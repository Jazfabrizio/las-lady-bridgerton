import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Users(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)

class Temporadas(db.Model):
    __tablename__ = 'temporadas'
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(255), nullable=False)
    cant_chapters = db.Column(db.Integer, nullable=False, default=0)

class Capitulos(db.Model):
    __tablename__ = 'capitulos'
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(255), nullable=False)
    temp_id = db.Column(db.Integer, db.ForeignKey('temporadas.id'))
    name = db.Column(db.String(255), nullable=False)

class Personajes(db.Model):
    __tablename__ = 'personajes'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.String(255), nullable=False)
    temp_id = db.Column(db.Integer, db.ForeignKey('temporadas.id'))

class Mensajes(db.Model):
    __tablename__ = 'mensajes'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255), db.ForeignKey('users.username'), nullable=False, )
    description = db.Column(db.String(255), nullable=False)

