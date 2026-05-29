from flask import Blueprint, jsonify, request

from validators import validar_contacto
from email_service import enviar_correo_contacto

contacto_bp = Blueprint('contacto', __name__)

@contacto_bp.route('/contacto', methods=['POST'])
def contacto():
    data = request.json
    errores = validar_contacto(data)
    if errores:
        return jsonify({'errores': errores}), 400
    enviar_correo_contacto(data.get('nombre'), data.get('correo'), data.get('mensaje'))
    return jsonify({'mensaje': 'Mensaje enviado correctamente al administrador'}), 200
