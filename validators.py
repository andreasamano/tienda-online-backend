def validar_producto(data):
    errores = []
    if not data:
        return ['No se recibieron datos.']
    if not data.get('nombre'):
        errores.append('El nombre del producto es obligatorio.')
    if not data.get('categoria'):
        errores.append('La categoría es obligatoria.')
    if not data.get('descripcion'):
        errores.append('La descripción es obligatoria.')
    try:
        precio = float(data.get('precio', 0))
        if precio <= 0:
            errores.append('El precio debe ser mayor que 0.')
    except (ValueError, TypeError):
        errores.append('El precio debe ser un número válido.')
    try:
        stock = int(data.get('stock', -1))
        if stock < 0:
            errores.append('El stock no puede ser negativo.')
    except (ValueError, TypeError):
        errores.append('El stock debe ser un número entero.')
    return errores

def validar_login(data):
    errores = []
    if not data:
        return ['No se recibieron datos.']
    if not data.get('correo'):
        errores.append('El correo es obligatorio.')
    if not data.get('password'):
        errores.append('La contraseña es obligatoria.')
    return errores

def validar_contacto(data):
    errores = []
    if not data:
        return ['No se recibieron datos.']
    if not data.get('nombre'):
        errores.append('El nombre es obligatorio.')
    if not data.get('correo'):
        errores.append('El correo es obligatorio.')
    if not data.get('mensaje'):
        errores.append('El mensaje es obligatorio.')
    return errores

def validar_pedido(data):
    errores = []
    if not data:
        return ['No se recibieron datos.']
    cliente = data.get('cliente') or {}
    productos = data.get('productos') or []
    if not cliente.get('nombre'):
        errores.append('El nombre del cliente es obligatorio.')
    if not cliente.get('correo'):
        errores.append('El correo del cliente es obligatorio.')
    if not cliente.get('direccion'):
        errores.append('La dirección de entrega es obligatoria.')
    if not productos:
        errores.append('El carrito no puede estar vacío.')
    for item in productos:
        if int(item.get('cantidad', 0)) <= 0:
            errores.append('Todos los productos deben tener una cantidad válida.')
    return errores
