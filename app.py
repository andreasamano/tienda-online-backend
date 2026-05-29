import os

from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv

from routes import register_routes

load_dotenv()

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'clave_temporal_desarrollo')
CORS(app, supports_credentials=True)

register_routes(app)

if __name__ == '__main__':
    app.run(debug=True)
