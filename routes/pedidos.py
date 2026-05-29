from flask import Blueprint, jsonify, request, session

from db import get_connection
from validators import validar_pedido
from email_service import enviar_correo_pedido

pedidos_bp = Blueprint('pedidos', __name__)

@pedidos_bp.route('/pedidos', methods=['POST'])
def crear_pedido():
    data = request.json
    errores = validar_pedido(data)
    if errores:
        return jsonify({'errores': errores}), 400

    cliente = data.get('cliente')
    productos = data.get('productos')
    total = sum(
        float(item.get('precio', 0)) * int(item.get('cantidad', 0))
        for item in productos
    )

    conexion = get_connection()
    cursor = conexion.cursor()
    cursor.execute(
        '''
        INSERT INTO pedidos (cliente_nombre, cliente_correo, direccion, total)
        VALUES (%s, %s, %s, %s)
        ''',
        (cliente.get('nombre'), cliente.get('correo'), cliente.get('direccion'), total),
    )
    pedido_id = cursor.lastrowid

    for item in productos:
        cursor.execute(
            '''
            INSERT INTO pedido_detalles (pedido_id, producto_id, producto_nombre, precio_unitario, cantidad, subtotal)
            VALUES (%s, %s, %s, %s, %s, %s)
            ''',
            (
                pedido_id,
                item.get('id'),
                item.get('nombre'),
                float(item.get('precio')),
                int(item.get('cantidad')),
                float(item.get('precio')) * int(item.get('cantidad')),
            ),
        )
        cursor.execute(
            'UPDATE productos SET stock = GREATEST(stock - %s, 0) WHERE id = %s',
            (int(item.get('cantidad')), item.get('id')),
        )

    conexion.commit()
    cursor.close()
    conexion.close()

    enviar_correo_pedido(cliente, productos, total, pedido_id)
    return jsonify({
        'mensaje': f'Pedido #{pedido_id} confirmado correctamente',
        'pedido_id': pedido_id,
        'total': total,
    }), 201

@pedidos_bp.route('/pedidos', methods=['GET'])
def obtener_pedidos():
    if not session.get('autenticado'):
        return jsonify({'mensaje': 'Debes iniciar sesión para consultar pedidos'}), 401

    conexion = get_connection()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute('SELECT * FROM pedidos ORDER BY id DESC')
    pedidos = cursor.fetchall()
    cursor.close()
    conexion.close()
    return jsonify(pedidos), 200
