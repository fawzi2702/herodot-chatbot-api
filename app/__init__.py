from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(__name__)

    app.config.from_pyfile('../instance/config.py')

    CORS(app)

    from .routes.chat_routes import chat_bp
    app.register_blueprint(chat_bp, url_prefix='/api/chat')

    return app