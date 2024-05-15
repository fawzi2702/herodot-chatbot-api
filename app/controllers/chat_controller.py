import random
from app.utils.message import random_message

MESSAGE_MIN_LENGTH = 10
MESSAGE_MAX_LENGTH = 30

def generate_random_message():
    message_size = random.randint(MESSAGE_MIN_LENGTH, MESSAGE_MAX_LENGTH)
    message = random_message(message_size)
    
    return message

def handle_send_message():
    response = generate_random_message()
    return response