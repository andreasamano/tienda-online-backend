# NovaMarket - Backend Flask + MariaDB

## Instalar
```bash
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

## Base de datos
Ejecuta `schema.sql` en MariaDB. Luego ajusta `.env` con tu usuario y contraseña.

## Crear usuario administrador
```bash
python create_user.py
```

Usuario de prueba:
- Correo: `admin@novamarket.com`
- Contraseña: `12345`

## Ejecutar
```bash
python app.py
```

## Endpoints principales
- `GET /productos`
- `POST /productos`
- `PUT /productos/<id>/desactivar`
- `POST /pedidos`
- `POST /login`
- `GET /sesion`
- `POST /logout`
- `POST /contacto`
