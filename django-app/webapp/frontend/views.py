from django.shortcuts import render
from gol.models import Scripts
import requests
from rest_framework import generics
from rest_framework.response import Response
from .models import Questionnaire, QuestionnaireResponse
import json

# Create your views here.
def index(request):
    context = {}
    return render(request, 'index.html', context) 


def questionnaire(request, token):
    #Load questions here
    questions = Questionnaire.objects.get_all_questions()
    responses = QuestionnaireResponse.objects.get_responses(token=token)
    responded = False

    context = {}
    context['questions'] = []
    question_id_list = []
    for q in questions:
        q['choices'] = []
        for i in range(1, 6):
            q['choices'].append(str(i))
        for r in responses:
            responded = True
            if r['fields']['question_id'] == q['pk']:
                q['response'] = str(r['fields']['response'])
        question_id_list.append(str(q['pk']))
        context['questions'].append(q)
    context['question_id_list'] = ','.join(question_id_list)
    context['responded'] = responded
    return render(request, 'questionnaire.html', context)



def code(request, token):
    script_object = Scripts.objects
    scripts = script_object.get_all_scripts()
    context = {}
    script_list = []
    script_id_list = []
    for s in scripts:
        script = {}
        script["script_id"] = s['script_id']
        script["script_title"] = s['script_title']
        script["download_link"] = s['download_link']
        r = requests.get(url = s['raw_url'], params = {})
        script["raw_url"] = r.text
        script_list.append(script)
        script_id_list.append(str(s['script_id']))

    context = {"scripts":script_list, "script_id_list": ','.join(script_id_list)}
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
        responses = json.loads(request.data["responses"])
        output_response = QuestionnaireResponse.objects.create_new_responses(responses)

        return Response(data={
            "status": 0,
            "message": "success",
            "data": output_response
        })
