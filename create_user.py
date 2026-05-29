from db import get_connection
from security import generar_hash

conexion = get_connection()
cursor = conexion.cursor()

nombre = 'Administrador NovaMarket'
correo = 'admin@novamarket.com'
password = generar_hash('12345')

cursor.execute('''
    INSERT INTO usuarios (nombre, correo, password)
    VALUES (%s, %s, %s)
    ON DUPLICATE KEY UPDATE nombre = VALUES(nombre), password = VALUES(password)
''', (nombre, correo, password))

conexion.commit()
cursor.close()
conexion.close()

print('Usuario administrador listo:')
print('Correo: admin@novamarket.com')
print('Contraseña: 12345')
