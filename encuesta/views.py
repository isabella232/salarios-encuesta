from django.shortcuts import render
from django.http import HttpResponse
from .models import Question, AnswerSet, AnswerItem
import logging

logger = logging.getLogger('django')

def index(request):    
    return render(request, 'encuesta/index.html')

def start(request):
    questions = Question.objects.filter(active=True).order_by('section', 'order')
    return render(request, 'encuesta/form.html', {
        'questions' : questions,
        })

def privacy(request):
    return render(request, 'encuesta/privacy.html')

def save(request):
    if request.method == 'POST':
        answerSet = AnswerSet()
        answerSet.save()
        logger.info(f"Created answerset: {answerSet.id}")
        for key, values in request.POST.lists():
            if key == "csrfmiddlewaretoken":
                continue
            if len(values) == 1:
                singleValue = request.POST.get(key)
                item = AnswerItem(slug=key, answer=singleValue, answerset=answerSet)
                item.save()
                logger.info(f"Answerset: {answerSet.id}, slug: {key}, answer: {singleValue}")
            else:
                item = AnswerItem(slug=key, answer=values, answerset=answerSet)
                item.save()
                logger.info(f"Answerset: {answerSet.id}, slug: {key}, answer: {values}")
    else:
        return render(request, 'encuesta/debug.html', {'message' : "Invalid request"})

    return render(request, 'encuesta/thanks.html')            
