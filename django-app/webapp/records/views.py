from rest_framework import generics
from rest_framework.response import Response
from .serializer import RecordSerializer
from .request_dispatcher import *


error_response = {
    "data": [],
    "status": 1,
    "message": "error"
}


class Record(generics.ListAPIView, generics.CreateAPIView):

    serializer_class = RecordSerializer

    def get(self, request, *args, **kwargs):
        response = dispatch_record_get_request(request)
        return Response(data=response)

    def post(self, request, *args, **kwargs):

        serializer = RecordSerializer(data=request.data)
        response = None

        if serializer.is_valid():
            response = dispatch_record_create_request(request)
        else:
            response = error_response

        return Response(data=response)
