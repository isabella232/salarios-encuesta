from django.db import models 
from django.utils.translation import gettext_lazy as _
from django.forms import ModelForm, ChoiceField, MultipleChoiceField, CheckboxSelectMultiple
import uuid
import logging

class Question(models.Model):

    class QuestionTypes(models.TextChoices):
        TEXT = 'text',
        NUMBER = 'number',
        SELECT = 'select',
        RADIO = 'radio',
        CHECKBOX = 'checkbox'

    class Sections(models.IntegerChoices):
        PROFILE = 1,
        SKILLS = 2,
        WAGES = 3,
        OTHER = 4

    slug = models.SlugField(unique=True, default=uuid.uuid4)
    text = models.CharField(max_length=200)
    section = models.IntegerField(choices=Sections.choices,default=1)
    type = models.CharField(max_length=10,choices=QuestionTypes.choices, default=QuestionTypes.TEXT)
    order = models.IntegerField(default=0)
    placeholder = models.CharField(max_length=200, null=True,blank=True)
    helptext = models.CharField(max_length=200, null=True,blank=True)
    required = models.BooleanField(default=False)
    active = models.BooleanField(default=True)
    hidden = models.BooleanField(default=False)
    minvalue = models.IntegerField(null=True)
    maxvalue = models.IntegerField(null=True)

    class Meta:
        ordering = ['section', 'order']

    def __str__(self):
        return self.text


class Choice(models.Model):
    question = models.ForeignKey(Question, models.SET_NULL, null=True)
    key = models.CharField(max_length=16)
    text = models.CharField(max_length=200)
    order = models.IntegerField(default=0)
    active = models.BooleanField(default=True)

    class Meta:
        ordering = ['order', 'text']

    def __str__(self):
        return self.text

class AnswerSet(models.Model):
    created = models.DateTimeField(auto_now=True)
    ip_address = models.CharField(max_length=50, null=True, blank=True)
    recaptcha_score = models.DecimalField(max_digits=2,decimal_places=1, null=True)

class AnswerItem(models.Model):
    answerset = models.ForeignKey(AnswerSet, on_delete=models.CASCADE)
    slug = models.CharField(max_length=20)
    answer = models.CharField(max_length=200)
