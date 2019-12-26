from django.conf import settings
import urllib, json

def get_recaptcha_score(token):
    url = 'https://www.google.com/recaptcha/api/siteverify'
    payload = {
      'secret': settings.RECAPTCHA_SECRET,
      'response': token
    }
    data = urllib.parse.urlencode(payload).encode()
    req = urllib.request.Request(url, data=data)
    response = urllib.request.urlopen(req)
    recaptcha_result = json.loads(response.read().decode())
    score = recaptcha_result['score']
    return score
