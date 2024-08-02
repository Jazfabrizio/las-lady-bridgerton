from flask import Flask, render_template, url_for, request, jsonify
from models import db, Personajes, Temporadas, Chismes, Participantes_Chisme, Roles
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
                'partners' : personaje.partners,
                'img': personaje.img
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
            'partners': personaje.partners,
            'img': personaje.img
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
        img = data.get('img')

        personaje_existente = Personajes.query.filter_by(name=name).first()
        if personaje_existente:
            return jsonify({'mensaje': 'Personaje con este nombre ya existe'}), 409
        
        nuevo_personaje = Personajes(name=name, description=description, temp_id=temp_id, title=title, partners=partners, img=img)
        db.session.add(nuevo_personaje)
        db.session.commit()
        return jsonify({'personaje': {'id': nuevo_personaje.id, 'name': nuevo_personaje.name, 'description': nuevo_personaje.description, 'temp_id': nuevo_personaje.temp_id, 'title': nuevo_personaje.title, 'partners': nuevo_personaje.partners, 'img': nuevo_personaje.img}}), 201
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
    personaje.img = data['img']
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
                'img': temporada.img
            }
            temporadas_data.append(temporada_info)
        return jsonify(temporadas_data)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudieron recuperar las temporadas"})
    

@app.route("/chismes", methods=["GET"])
def chismes():
    try:
        chismes = Chismes.query.all()
        chismes_data = []
        for chisme in chismes:
            participantes = Participantes_Chisme.query.filter_by(id_chisme=chisme.id).all()
            participantes_data = []
            for participante in participantes:
                personaje = Personajes.query.get(participante.id_personaje)
                rol = Roles.query.get(participante.id_rol)
                participantes_info = {
                    'id_personaje': participante.id_personaje,
                    'nombre_personaje': personaje.name,
                    'rol': rol.description,
                }
                participantes_data.append(participantes_info)
            
            temporada = Temporadas.query.get(chisme.temp_id) 
            chismes_info = {
                'id': chisme.id,
                'description': chisme.description,
                'temp_id': chisme.temp_id,
                'temporada': temporada.description if temporada else 'Desconocida', 
                'participantes': participantes_data
            }
            chismes_data.append(chismes_info)
        
        return jsonify(chismes_data)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudieron acceder a los chismes"}), 500


@app.route("/chismes", methods=["POST"])
def publicar_chisme():
    data = request.json
    description = data.get('description')
    temp_id = data.get('temp_id')
    personajes = data.get('personajes')

    if not description or not temp_id or not personajes:
        return jsonify({'error': 'Faltan datos requeridos'}), 400

    roles_requeridos = {'Chismoso': 0, 'Vocero': 0, 'Involucrado': 0}
    for personaje in personajes:
        rol_descripcion = personaje.get('rol')
        if rol_descripcion in roles_requeridos:
            roles_requeridos[rol_descripcion] += 1

    if roles_requeridos['Chismoso'] < 1 or roles_requeridos['Vocero'] < 1 or roles_requeridos['Involucrado'] < 1:
        return jsonify({'error': 'Debe haber al menos un chismoso, un vocero y un involucrado'}), 400

    try:
        chisme = Chismes(description=description, temp_id=temp_id)
        db.session.add(chisme)
        db.session.commit()

        for personaje in personajes:
            name = personaje.get('name')
            rol_descripcion = personaje.get('rol')

            if not name or not rol_descripcion:
                return jsonify({'error': 'Datos de personaje incompletos'}), 400

            personaje_obj = Personajes.query.filter_by(name=name).first()
            if not personaje_obj:
                personaje_obj = Personajes(name=name, description="", temp_id=temp_id, img="")
                db.session.add(personaje_obj)
                db.session.commit()

            rol_obj = Roles.query.filter_by(description=rol_descripcion).first()
            if not rol_obj:
                return jsonify({'error': f'Rol no encontrado: {rol_descripcion}'}), 400
            
            participante_chisme = Participantes_Chisme(id_personaje=personaje_obj.id, id_chisme=chisme.id, id_rol=rol_obj.id)
            db.session.add(participante_chisme)

        db.session.commit()

        return jsonify({'success': True, 'message': 'Chisme publicado exitosamente'}), 201
    
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500
    
@app.route("/chismes/<int:id>", methods=["GET"])
def obtener_chisme(id):
    try:
        chisme = Chismes.query.get(id)
        if not chisme:
            return jsonify({'error': 'Chisme no encontrado'}), 404

        participantes = Participantes_Chisme.query.filter_by(id_chisme=id).all()
        participantes_data = []
        for participante in participantes:
            personaje = Personajes.query.get(participante.id_personaje)
            rol = Roles.query.get(participante.id_rol)
            participantes_info = {
                'id_personaje': participante.id_personaje,
                'nombre_personaje': personaje.name,
                'rol': rol.description,
            }
            participantes_data.append(participantes_info)

        temporada = Temporadas.query.get(chisme.temp_id)
        chisme_info = {
            'id': chisme.id,
            'description': chisme.description,
            'temp_id': chisme.temp_id,
            'temporada': temporada.description if temporada else 'Desconocida',
            'participantes': participantes_data
        }

        return jsonify(chisme_info)
    except Exception as e:
        print(str(e))
        return jsonify({"mensaje": "No se pudo acceder al chisme"}), 500


@app.route("/chismes/<int:id>", methods=["DELETE"])
def eliminar_chisme(id):
    try:
        chisme = Chismes.query.get(id)
        if not chisme:
            return jsonify({'error': 'Chisme no encontrado'}), 404

        Participantes_Chisme.query.filter_by(id_chisme=id).delete()

        db.session.delete(chisme)
        db.session.commit()

        return jsonify({'success': True, 'message': 'Chisme eliminado exitosamente'}), 200
    except Exception as e:
        db.session.rollback()
        print(str(e))
        return jsonify({'error': 'Error al eliminar el chisme'}), 500

if __name__ == '__main__':
    print('Starting server...')
    db.init_app(app)
    with app.app_context():
        db.create_all()
    app.run(host='0.0.0.0', debug=True, port=port)
    print('started...')


