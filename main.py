from flask import Flask, render_template, url_for, request, jsonify
from models import db, Users, Temporadas, Capitulos, Personajes, Mensajes
from flask_cors import CORS


app = Flask(__name__)
CORS(app) 

port = 5000
app.config['SQLALCHEMY_DATABASE_URI']= 'postgresql+psycopg2://postgres:postgres@localhost:5432/paginaweb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/historia',  methods=["GET"])
def personaje():
    try:
        personajes = Personajes.query.all()
        personajes_data =[]
        for personaje in personajes:
            personaje_info = {
                'id' : personaje.id,
                'nombre' : personaje.name,
                'desc' : personaje.description,
                'temp_aparicion' : personaje.temp_id
            }
            personajes_data.append(personaje_info)
        return jsonify(personajes_data)
    except:
        return jsonify({"mensaje":"No hay personajes"})
    
@app.route('/historia/<int:id>')
def personaje_by_id(id):
    try:
        personaje = Personajes.query.filter_by(id=id).one()
        personaje_dict = {
            'id': personaje.id,
            'nombre': personaje.name,
            'description': personaje.description,
            'temp_id': personaje.temp_id,
        }
        return jsonify(personaje_dict)
    except:
        return jsonify({'error': 'Personaje no encontrado'}), 404
def index():
    return render_template('personajes.html')

@app.route('/historia/<int:id>', methods=['DELETE'])
def eliminar_personaje(id):
    personaje = Personajes.query.get(id)
    if personaje:
        db.session.delete(personaje)
        db.session.commit()
        return {'succes': 'Personaje eliminado correctamente'}
    else:
        return jsonify({'error': f'No se encontró un personaje con id {id}'}), 404

@app.route('/historia', methods=['POST'])
def agregar_personaje():
    try:
        data = request.json
        name = data.get('name')
        description = data.get('description')
        temp_id = data.get('temp_id')
        nuevo_personaje = Personajes(name=name, description=description, temp_id=temp_id)
        db.session.add(nuevo_personaje)
        db.session.commit()
        return jsonify({'personaje': {'id': nuevo_personaje.id, 'name': nuevo_personaje.name, 'description': nuevo_personaje.description, 'temp_id': nuevo_personaje.temp_id}}), 201
    except:
        return jsonify({'message': 'No fue psible crear el personaje'}), 500




    



@app.route("/temporadas", methods=["GET"])
def temporadas():
    try:
        temporadas = Temporadas.query.all()
        temporadas_data = []
        for temporada in temporadas:
            temporada_info = {
                'id': temporada.id,
                'desc': temporada.description,
                'can_chap': temporada.cant_chapters
            }
            temporadas_data.append(temporada_info)
        return jsonify(temporadas_data)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudieron recuperar las temporadas"})
    
    
@app.route("/temporadas/capitulos/", methods=["GET"])
def capitulos():
    try:
        capitulos = Capitulos.query.all()
        capitulos_data = []
        for capitulo in capitulos:
            capitulo_info = {
                'id' : capitulo.id,
                'desc' : capitulo.description,
                'temp_id' : capitulo.temp_id,
                'name' : capitulo.name
            }
            capitulos_data.append(capitulo_info)
        return jsonify(capitulos_data)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudieron recuperar los capitulos"})
    

@app.route("/temporadas/capitulos/<int:temp_id>")
def caps_by_tempid(temp_id):
    try:
        temp_id = Capitulos.query.filter_by(temp_id=temp_id).one()
        caps_dict = {
            'id': temp_id.id,
            'nombre': temp_id.name,
            'description': temp_id.description,
            'temp_id': temp_id.temp_id,
        }
        return jsonify(caps_dict)
    except:
        return jsonify({'error': 'Personaje no encontrado'}), 404


if __name__ == '__main__':
    print('Starting server...')
    db.init_app(app)
    with app.app_context():
        db.create_all()
    app.run(host='0.0.0.0', debug=True, port=port)
    print('started...')


