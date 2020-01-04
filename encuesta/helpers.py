from django.conf import settings
import json
import urllib.request as request
import urllib.parse as parse

def get_recaptcha_score(token):
    url = 'https://www.google.com/recaptcha/api/siteverify'
    payload = {
      'secret': settings.RECAPTCHA_SECRET,
      'response': token
    }
    data = parse.urlencode(payload).encode()
    try: 
      req = request.Request(url, data=data)
      response = request.urlopen(req)
      recaptcha_result = json.loads(response.read().decode())
      score = recaptcha_result['score']
    except:
      score = "-1"
    else:
      return score  
