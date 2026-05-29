import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    usar_ssl = os.getenv('DB_SSL', 'false').lower() == 'true'

    return mysql.connector.connect(
        host=os.getenv('DB_HOST', '127.0.0.1'),
        port=int(os.getenv('DB_PORT', 3306)),
        user=os.getenv('DB_USER', 'root'),
        password=os.getenv('DB_PASSWORD', ''),
        database=os.getenv('DB_NAME', 'tienda_online'),
        ssl_disabled=not usar_ssl
    )