from flask import Blueprint, jsonify, request, session

from db import get_connection
from validators import validar_producto

productos_bp = Blueprint('productos', __name__)

@productos_bp.route('/productos', methods=['GET'])
def obtener_productos():
    conexion = get_connection()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute(
        'SELECT id, nombre, categoria, descripcion, precio, stock, icono, activo, destacado '
        'FROM productos ORDER BY destacado DESC, id DESC'
    )
    productos = cursor.fetchall()
    cursor.close()
    conexion.close()
    return jsonify(productos), 200

@productos_bp.route('/productos/<int:id>', methods=['GET'])
def obtener_producto(id):
    conexion = get_connection()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute(
        'SELECT id, nombre, categoria, descripcion, precio, stock, icono, activo, destacado '
        'FROM productos WHERE id = %s',
        (id,),
    )
    producto = cursor.fetchone()
    cursor.close()
    conexion.close()
    if not producto:
        return jsonify({'mensaje': 'Producto no encontrado'}), 404
    return jsonify(producto), 200

@productos_bp.route('/productos', methods=['POST'])
def agregar_producto():
    if not session.get('autenticado'):
        return jsonify({'mensaje': 'Debes iniciar sesión para agregar productos'}), 401

    data = request.json
    errores = validar_producto(data)
    if errores:
        return jsonify({'errores': errores}), 400

    conexion = get_connection()
    cursor = conexion.cursor()
    cursor.execute(
        '''
        INSERT INTO productos (nombre, categoria, descripcion, precio, stock, icono, activo, destacado)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        ''',
        (
            data.get('nombre'),
            data.get('categoria'),
            data.get('descripcion'),
            float(data.get('precio')),
            int(data.get('stock')),
            data.get('icono', '📦'),
            int(data.get('activo', 1)),
            int(data.get('destacado', 0)),
        ),
    )
    conexion.commit()
    nuevo_id = cursor.lastrowid
    cursor.close()
    conexion.close()
    return jsonify({'mensaje': 'Producto agregado correctamente', 'id': nuevo_id}), 201

@productos_bp.route('/productos/<int:id>/desactivar', methods=['PUT'])
def desactivar_producto(id):
    if not session.get('autenticado'):
        return jsonify({'mensaje': 'Debes iniciar sesión para ocultar productos'}), 401

    conexion = get_connection()
    cursor = conexion.cursor()
    cursor.execute('UPDATE productos SET activo = 0 WHERE id = %s', (id,))
    conexion.commit()
    filas = cursor.rowcount
    cursor.close()
    conexion.close()
    if filas == 0:
        return jsonify({'mensaje': 'Producto no encontrado'}), 404
    return jsonify({'mensaje': 'Producto ocultado correctamente'}), 200
