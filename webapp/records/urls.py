from django.conf.urls import url
from .views import Record


urlpatterns = [
    url('', Record.as_view(), name='record_url'),
]
