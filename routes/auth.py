from flask import Blueprint, jsonify, request, session

from db import get_connection
from validators import validar_login
from security import verificar_password

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.json
    errores = validar_login(data)
    if errores:
        return jsonify({'errores': errores}), 400

    conexion = get_connection()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute('SELECT * FROM usuarios WHERE correo = %s', (data.get('correo'),))
    usuario = cursor.fetchone()
    cursor.close()
    conexion.close()

    if not usuario:
        return jsonify({'mensaje': 'Usuario no encontrado'}), 404
    if not verificar_password(data.get('password'), usuario['password']):
        return jsonify({'mensaje': 'Contraseña incorrecta'}), 401

    session['usuario_id'] = usuario['id']
    session['nombreUsuario'] = usuario['nombre']
    session['correo'] = usuario['correo']
    session['autenticado'] = True

    return jsonify({
        'mensaje': 'Sesión iniciada correctamente',
        'sesion': {
            'nombreUsuario': usuario['nombre'],
            'correo': usuario['correo'],
            'autenticado': True,
        },
    }), 200

@auth_bp.route('/sesion', methods=['GET'])
def obtener_sesion():
    if session.get('autenticado'):
        return jsonify({
            'nombreUsuario': session.get('nombreUsuario'),
            'correo': session.get('correo'),
            'autenticado': True,
        }), 200
    return jsonify({
        'nombreUsuario': 'Invitado',
        'correo': None,
        'autenticado': False,
    }), 200

@auth_bp.route('/logout', methods=['POST'])
def logout():
    session.clear()
    return jsonify({'mensaje': 'Sesión cerrada correctamente'}), 200
