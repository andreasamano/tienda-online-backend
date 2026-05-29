import os
import smtplib
from email.message import EmailMessage
from dotenv import load_dotenv

load_dotenv()

def _smtp_configurado():
    return bool(os.getenv('MAIL_SERVER') and os.getenv('MAIL_USER') and os.getenv('MAIL_PASSWORD'))

def enviar_correo_contacto(nombre, correo, mensaje):
    if not _smtp_configurado():
        print('Correo no enviado: configura MAIL_SERVER, MAIL_USER y MAIL_PASSWORD en .env')
        return

    email = EmailMessage()
    email['Subject'] = 'Nuevo mensaje desde NovaMarket'
    email['From'] = os.getenv('MAIL_USER')
    email['To'] = os.getenv('MAIL_TO', os.getenv('MAIL_USER'))
    email.set_content(f'''
Nuevo mensaje recibido desde el formulario de contacto:

Nombre: {nombre}
Correo: {correo}

Mensaje:
{mensaje}
''')
    with smtplib.SMTP(os.getenv('MAIL_SERVER'), int(os.getenv('MAIL_PORT', 587))) as smtp:
        smtp.starttls()
        smtp.login(os.getenv('MAIL_USER'), os.getenv('MAIL_PASSWORD'))
        smtp.send_message(email)

def enviar_correo_pedido(cliente, productos, total, pedido_id):
    if not _smtp_configurado():
        print('Correo de pedido no enviado: configura SMTP en .env')
        return

    detalle = '\n'.join([f"- {item.get('nombre')} x{item.get('cantidad')} = ${float(item.get('precio')) * int(item.get('cantidad')):.2f}" for item in productos])
    email = EmailMessage()
    email['Subject'] = f'Confirmación de pedido #{pedido_id} - NovaMarket'
    email['From'] = os.getenv('MAIL_USER')
    email['To'] = cliente.get('correo')
    email.set_content(f'''
Hola {cliente.get('nombre')},

Tu pedido #{pedido_id} fue registrado correctamente.

Productos:
{detalle}

Total: ${total:.2f}
Dirección de entrega: {cliente.get('direccion')}

Gracias por comprar en NovaMarket.
''')
    with smtplib.SMTP(os.getenv('MAIL_SERVER'), int(os.getenv('MAIL_PORT', 587))) as smtp:
        smtp.starttls()
        smtp.login(os.getenv('MAIL_USER'), os.getenv('MAIL_PASSWORD'))
        smtp.send_message(email)
