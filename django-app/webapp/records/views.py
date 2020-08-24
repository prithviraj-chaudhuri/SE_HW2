from rest_framework import generics
from rest_framework.response import Response
from .serializer import RecordSerializer
from .request_dispatcher import *
import json


error_response = {
    "data": [],
    "status": 1,
    "message": "record"
}


class Record(generics.ListAPIView, generics.CreateAPIView):

    serializer_class = RecordSerializer

    def get(self, request, *args, **kwargs):
        response = dispatch_record_get_request(request)
        return Response(data=response)

    def post(self, request, *args, **kwargs):
        action = request.data['action']
        if action == "start":
            response = None
            response = dispatch_record_create_request(request)
        elif action == "stop":
            response = None
            response = dispatch_record_update_request(request)

        return Response(data=response)
