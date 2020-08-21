from .models import Token


def get_all_tokens():

    try:
        return {
            "data": Token.objects.get_all_tokens(),
            "status": 0,
            "message": "success"
        }
    except Exception as e:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }


def get_all_unused_tokens():

    try:
        return {
            "data": Token.objects.get_unused_token(),
            "status": 0,
            "message": "success"
        }
    except Exception as e:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }


def create_new_token(token):
    return Token.objects.create_new_token(token)


def update_token(token, token_used):

    if Token.objects.update_token(token, token_used):
        return {
            "data": [
                {
                    "token": token,
                    "token_used": token_used
                }
            ],
            "status": 0,
            "message": "success"
        }
    else:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }


def delete_token(token):
    if Token.objects.delete_token(token):
        return {
            "data": [
                {
                    "token": token
                }
            ],
            "status": 0,
            "message": "success"
        }
    else:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }