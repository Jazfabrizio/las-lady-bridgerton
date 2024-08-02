import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Temporadas(db.Model):
    __tablename__ = 'temporadas'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    description = db.Column(db.String(255), nullable=False)
    cant_chapters = db.Column(db.Integer, nullable=False, default=0)
    deaths = db.Column(db.Integer, default=0)
    gossip = db.Column(db.String(255))
    img = db.Column(db.String(255), nullable=False)

class Personajes(db.Model):
    __tablename__ = 'personajes'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.String(255), nullable=False)
    temp_id = db.Column(db.Integer, db.ForeignKey('temporadas.id'))
    title = db.Column(db.String(255))
    partners = db.Column(db.Integer)
    img = db.Column(db.String(255), nullable=False)
 
class Chismes(db.Model):
    __tablename__ = 'chismes'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    description = db.Column(db.String(255), nullable=False)
    temp_id = db.Column(db.Integer, db.ForeignKey('temporadas.id'))

class Roles(db.Model):
    __tablename__ = 'roles'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    description = db.Column(db.String(255), nullable=False)

class Participantes_Chisme(db.Model):
    __tablename__ = 'participantes_chisme'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_personaje = db.Column(db.Integer, db.ForeignKey('personajes.id'))
    id_chisme = db.Column(db.Integer, db.ForeignKey('chismes.id'))
    id_rol = db.Column(db.Integer, db.ForeignKey('roles.id'))


