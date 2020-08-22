from django.shortcuts import render

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
    q1['choices'].append("yes")
    q1['choices'].append("no")
    context['questions'].append(q1)

    q1 = {}
    q1['id'] = 2
    q1['question'] = "Is this funny?"
    q1['choices'] = []
    q1['choices'].append("yes")
    q1['choices'].append("no")
    q1['choices'].append("maybe")
    q1['choices'].append("huh!")
    context['questions'].append(q1)

    return render(request, 'questionnaire.html', context)
