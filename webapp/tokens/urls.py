from django.conf.urls import url
from .views import Token


urlpatterns = [
    url('', Token.as_view(), name='token_url'),
]
