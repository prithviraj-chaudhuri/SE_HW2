from django.conf.urls import url
from .views import QuestionnaireAPI, QuestionnaireResponseAPI


urlpatterns = [
    url('questions/', QuestionnaireAPI.as_view(), name='questionnaire_url'),
    url('questionresponse/', QuestionnaireResponseAPI.as_view(),
        name="questionnaire_response_url")
]
