from flask import Blueprint, request, jsonify
from app.controllers.chat_controller import handle_send_message

chat_bp = Blueprint('chat', __name__)

@chat_bp.route('/send_message', methods=['POST'])
def send_message():
    message = request.json['message']
    response = handle_send_message()
    return jsonify({'response': response})