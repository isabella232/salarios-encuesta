from django.shortcuts import render
from django.http import HttpResponse
from .models import Question, AnswerSet, AnswerItem
from ipware import get_client_ip
from django.conf import settings
import logging, urllib, json
from . import helpers

logger = logging.getLogger('django')

def index(request):    
    return render(request, 'encuesta/index.html')

def start(request):
    questions = Question.objects.filter(active=True).order_by('section', 'order')
    return render(request, 'encuesta/form.html', {
        'questions' : questions,
        'RECAPTCHA_KEY' : settings.RECAPTCHA_KEY
        })

def privacy(request):
    return render(request, 'encuesta/privacy.html')

def save(request):
    if request.method == 'POST':
        answerSet = AnswerSet()
        client_ip, is_routable = get_client_ip(request)
        if isinstance(client_ip, str):
            answerSet.ip_address = client_ip

        answerSet.recaptcha_score = helpers.get_recaptcha_score(request.POST.get('g-recaptcha-response'))
        answerSet.save()
        logger.info(f"Created answerset: {answerSet.id}")

        # Getting values as lists because we have fields with multiple values (checkboxes)
        for key, values in request.POST.lists():
            if key == "csrfmiddlewaretoken":
                continue
            if len(values) == 1:
                singleValue = request.POST.get(key)
                # Ignoring long strings (ie tokens)
                if len(singleValue) < 200:
                  item = AnswerItem(slug=key, answer=singleValue, answerset=answerSet)
                  item.save()
                  logger.info(f"Answerset: {answerSet.id}, slug: {key}, answer: {singleValue}")
                else:
                  logger.info(f"Ignoring key: {key} with value {singleValue}")
            else:
                item = AnswerItem(slug=key, answer=values, answerset=answerSet)
                item.save()
                logger.info(f"Answerset: {answerSet.id}, slug: {key}, answer: {values}")
    else:
        return render(request, 'encuesta/debug.html', {'message' : "Invalid request"})

    return render(request, 'encuesta/thanks.html')            
