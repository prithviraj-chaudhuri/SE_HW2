from .models import Record


def create_new_record(data):

    if Record.objects.create_record(token=data["token"], language=data["language"],
                                    start_time=data["start_time"], end_time=data["end_time"]):
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
