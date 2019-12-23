from django.contrib import admin
from .models import Question, Choice

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['slug', 'text', 'section', 'type', 'order', 'placeholder', 'helptext', 'required', 'hidden', 'active']}),
    ]
    inlines = [ChoiceInline]
    list_display = ('text', 'section', 'order')

admin.site.register(Question, QuestionAdmin)
