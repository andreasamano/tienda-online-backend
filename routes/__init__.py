from routes.health import health_bp
from routes.productos import productos_bp
from routes.pedidos import pedidos_bp
from routes.auth import auth_bp
from routes.contacto import contacto_bp

def register_routes(app):
    app.register_blueprint(health_bp)
    app.register_blueprint(productos_bp)
    app.register_blueprint(pedidos_bp)
    app.register_blueprint(auth_bp)
    app.register_blueprint(contacto_bp)
