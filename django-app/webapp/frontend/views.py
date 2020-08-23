from django.shortcuts import render
from gol.models import Scripts
import requests
from rest_framework import generics
from rest_framework.response import Response
from .models import Questionnaire, QuestionnaireResponse

# Create your views here.


def index(request):
    context = {}
    return render(request, 'index.html', context) 


def questionnaire(request, token):
    #Load questions here
    context = {}
    context['questions'] = []
    q1 = {}
    q1['id'] = 1
    q1['question'] = "Have you seen this question before?"
    q1['choices'] = []
    q1['choices'].append("1")
    q1['choices'].append("2")
    q1['choices'].append("3")
    q1['choices'].append("4")
    q1['choices'].append("5")
    context['questions'].append(q1)

    q1 = {}
    q1['id'] = 2
    q1['question'] = "Is this funny?"
    q1['choices'] = []
    q1['choices'].append("1")
    q1['choices'].append("2")
    q1['choices'].append("3")
    q1['choices'].append("4")
    q1['choices'].append("5")
    context['questions'].append(q1)

    return render(request, 'questionnaire.html', context)

def code(request, token):
    script_object = Scripts.objects
    scripts = script_object.get_all_scripts()
    context = {}
    script_list = []
    for s in scripts:
        script = {}
        script["script_id"] = s['script_id']
        script["script_title"] = s['script_title']
        script["download_link"] = s['download_link']
        r = requests.get(url = s['raw_url'], params = {})
        script["raw_url"] = r.text
        script_list.append(script)
    context = {"scripts":script_list}
    return render(request, 'code.html', context)


def format_script(text):
    text = text.split("\n")
    script = ""
    for l in text:
        script += "<code>" + l + "</code>"
    return script


class QuestionnaireAPI(generics.ListAPIView):

    def get(self, request, *args, **kwargs):

        data = Questionnaire.objects.get_all_questions()
        response = {
            "status": 0,
            "message": "success",
            "data": data
        }

        return Response(data=response)


class QuestionnaireResponseAPI(generics.CreateAPIView, generics.ListAPIView):

    def get(self, request, *args, **kwargs):

        token = request.query_params.get("token", None)

        if token:
            responses = QuestionnaireResponse.objects.get_responses(token=token)
        else:
            responses = QuestionnaireResponse.objects.get_responses()

        return Response(data={
            "status": 0,
            "message": "success",
            "data": responses
        })

    def create(self, request, *args, **kwargs):

        responses = request.data["responses"]

        output_response = QuestionnaireResponse.objects.create_new_responses(responses)

        return Response(data={
            "status": 0,
            "message": "success",
            "data": output_response
        })
