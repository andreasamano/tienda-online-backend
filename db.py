import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    try:
        conexion = mysql.connector.connect(
            host=os.getenv('DB_HOST', '127.0.0.1'),
            port=int(os.getenv('DB_PORT', 3306)),
            user=os.getenv('DB_USER', 'movauser'),
            password=os.getenv('DB_PASSWORD', '12345'),
            database=os.getenv('DB_NAME', 'tienda_online'),
            use_pure=True,
            ssl_disabled=True
        )
        return conexion

    except mysql.connector.Error as error:
        print("ERROR AL CONECTAR A LA BASE DE DATOS:")
        print(error)
        raise error