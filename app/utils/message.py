import random
import string

def random_message(length):
    return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(length))