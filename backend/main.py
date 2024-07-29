from flask import Flask, render_template, url_for, request, jsonify
from models import db, Personajes, Temporadas
from flask_cors import CORS


app = Flask(__name__)
CORS(app) 

port = 5000
app.config['SQLALCHEMY_DATABASE_URI']= 'postgresql+psycopg2://postgres:postgres@localhost:5432/paginaweb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

@app.route('/')
def index():
    return 'Hello'

@app.route('/personajes',  methods=["GET"])
def personaje():
    try:
        personajes = Personajes.query.all()
        personajes_data =[]
        for personaje in personajes:
            personaje_info = {
                'id' : personaje.id,
                'name' : personaje.name,
                'description' : personaje.description,
                'temp_aparicion' : personaje.temp_id,
                'title' : personaje.title,
                'partners' : personaje.partners
            }
            personajes_data.append(personaje_info)
        return jsonify(personajes_data)
    except:
        return jsonify({"mensaje":"No hay personajes"})
    
@app.route('/personajes/<id>', methods=['GET'])
def personaje_by_id(id):
    try:
        personaje = Personajes.query.filter_by(id=id).one()
        personaje_dict = {
            'id': personaje.id,
            'name': personaje.name,
            'description': personaje.description,
            'temp_id': personaje.temp_id,
            'title': personaje.title,
            'partners': personaje.partners
        }
        return jsonify(personaje_dict)
    except:
        return jsonify({'error': 'Personaje no encontrado'}), 404

    

@app.route('/personajes/<int:id>', methods=['DELETE'])
def eliminar_personaje(id):
    personaje = Personajes.query.get(id)
    if not personaje:
        return jsonify({'mensaje': 'Personaje no encontrado'}), 404

    db.session.delete(personaje)
    db.session.commit()
    return jsonify({'success': 'Personaje eliminado'}), 200

@app.route('/personajes', methods=['POST'])
def agregar_personaje():
    try:
        data = request.json
        name = data.get('name')
        description = data.get('description')
        temp_id = data.get('temp_id')
        title = data.get('title')
        partners = data.get('partners')

        personaje_existente = Personajes.query.filter_by(name=name).first()
        if personaje_existente:
            return jsonify({'mensaje': 'Personaje con este nombre ya existe'}), 409
        
        nuevo_personaje = Personajes(name=name, description=description, temp_id=temp_id, title=title, partners=partners)
        db.session.add(nuevo_personaje)
        db.session.commit()
        return jsonify({'personaje': {'id': nuevo_personaje.id, 'name': nuevo_personaje.name, 'description': nuevo_personaje.description, 'temp_id': nuevo_personaje.temp_id, 'title': nuevo_personaje.title, 'partners': nuevo_personaje.partners}}), 201
    except Exception as e:
        print(e)  
        return jsonify({'message': 'No fue posible crear el personaje'}), 500

@app.route("/personajes", methods = ["PUT"])
def editar_personaje():
    data = request.json
    personaje = Personajes.query.get(data['id'])
    if personaje is None:
        return jsonify({'success': False, 'message': 'Personaje no encontrado'}), 404
    personaje.name = data['name']
    personaje.description = data['description']
    personaje.temp_id = data['temp_id']
    personaje.title = data['title']
    personaje.partners = data['partners']

    db.session.commit()
    return jsonify({'success': True, 'id': personaje.id})

    


@app.route("/temporadas", methods=["GET"])
def temporadas():
    try:
        temporadas = Temporadas.query.all()
        temporadas_data = []
        for temporada in temporadas:
            temporada_info = {
                'id': temporada.id,
                'description': temporada.description,
                'cant_chap': temporada.cant_chapters,
                'deaths': temporada.deaths,
                'gossip': temporada.gossip,
            }
            temporadas_data.append(temporada_info)
        return jsonify(temporadas_data)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudieron recuperar las temporadas"})
    

if __name__ == '__main__':
    print('Starting server...')
    db.init_app(app)
    with app.app_context():
        db.create_all()
    app.run(host='0.0.0.0', debug=True, port=port)
    print('started...')


