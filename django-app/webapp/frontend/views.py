from django.shortcuts import render, redirect
from gol.models import Scripts
from tokens.models import Token
from records.models import Record
from rest_framework import generics
from rest_framework.response import Response
from .models import Questionnaire, QuestionnaireResponse

import requests
import json
import logging

# Create your views here.
def index(request):
    context = {}
    return render(request, 'index.html', context) 


def questionnaire(request, token):
    #Load questions here
    if token_used(token) == False:
        response = redirect('/')
        return response

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

    if token_used(token) == False:
        response = redirect('/')
        return response

    script_object = Scripts.objects
    scripts = script_object.get_all_scripts()

    record_object = Record.objects
    records = record_object.get_records(token=token);

    context = {}
    script_list = []
    script_id_list = []

    in_progress = False

    for s in scripts:
        script = {}
        script["script_id"] = s['script_id']
        script["script_title"] = s['script_title']
        script["download_link"] = s['download_link']
        script["readme_link"] = s['readme_link']
        r = requests.get(url = s['raw_url'], params = {})
        script["raw_url"] = r.text
        script_list.append(script)
        script_id_list.append(str(s['script_id']))
        script['responded'] = "no"
        for r in records:
            if r['fields']['language'] == script["script_id"]:
                if len(r['fields']['duration']) > 0:
                    script['responded'] = "yes"
                else:
                    script['responded'] = "progress"
                    in_progress = True

    context = {"scripts":script_list, "script_id_list": ','.join(script_id_list), "in_progres":in_progress}
    return render(request, 'code.html', context)

def token_used(token):
    unused_tokens = Token.objects.get_unused_token()
    for ut in unused_tokens:
        if ut['fields']['token'] == token:
            return False
    all_tokens = Token.objects.get_all_tokens()
    for at in all_tokens:
        if at['token'] == token:
            return True
    return False


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
