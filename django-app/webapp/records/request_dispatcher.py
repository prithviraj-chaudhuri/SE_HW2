from .request_handler import *


def dispatch_record_create_request(request):
    response = create_new_record(request.data)
    return response


def dispatch_record_get_request(request):

    request_type = request.query_params.get("type", None)
    valid_request_types = ["all", "token"]

    if request_type and request_type in valid_request_types:

        if request_type == "all":
            return get_all_records()
        elif request_type == "token":
            token = request.query_params.get("token", None)

            if token:
                return get_records_for_token(token)
            else:
                return {
                    "status": 1,
                    "message": "error",
                    "data": []
                }
    else:
        return {
            "status": 1,
            "message": "error",
            "data": []
        }


def dispatch_record_update_request(request):
    response = update_record(request.data)
    return response
