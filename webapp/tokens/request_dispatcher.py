from .request_handler import *


def dispatch_token_get_request(request):

    request_type = request.query_params.get("type", None)

    handler = None

    if request_type == "all":
        handler = get_all_tokens
    elif request_type == "unused":
        handler = get_all_unused_tokens

    if handler:
        return handler()
    else:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }


def dispatch_token_post_request(request):

    if "token" in request.data:
        return create_new_token(request.data["token"])
    else:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }


def dispatch_token_update_request(request):

    if "token" not in request.data and "token_used" not in request.data:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }
    else:
        return update_token(request.data["token"], request.data["token_used"])


def dispatch_token_delete_request(request):

    if "token" not in request.data:
        return {
            "data": [],
            "status": 1,
            "message": "error"
        }
    else:
        return delete_token(request.data["token"])
