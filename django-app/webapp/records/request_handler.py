from .models import Record


def create_new_record(data):
    return Record.objects.create_record(token=data["token"], language=data["language"])
    if Record.objects.create_record(token=data["token"], language=data["language"]):
        return {
            "status": 0,
            "message": "success",
            "data": [data]
        }
    else:
        return {
            "status": 1,
            "message": "error",
            "data": [data]
        }

def update_record(data):

    is_updated = Record.objects.update_record(token=data["token"], language=data["language"])

    if is_updated:
        return {
            "status": 0,
            "message": "success"
        }
    else:
        return {
            "status": 1,
            "message": "error"
        }

def get_all_records():

    data = Record.objects.get_records()

    return {
        "status": 0,
        "message": "success",
        "data": data
    }


def get_records_for_token(token):

    data = Record.objects.get_records(token=token)

    return {
        "status": 0,
        "message": "success",
        "data": data
    }
