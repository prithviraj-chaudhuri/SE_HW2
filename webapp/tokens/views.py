from rest_framework import generics
from rest_framework.response import Response
from .request_dispatcher import *


class Token(generics.ListAPIView, generics.CreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):

    def get(self, request, *args, **kwargs):
        response = dispatch_token_get_request(request)
        return Response(data=response)

    def post(self, request, *args, **kwargs):
        response = dispatch_token_post_request(request)
        return Response(data=response)

    def update(self, request, *args, **kwargs):
        response = dispatch_token_update_request(request)
        return Response(data=response)

    def delete(self, request, *args, **kwargs):
        response = dispatch_token_delete_request(request)
        return Response(data=response)
