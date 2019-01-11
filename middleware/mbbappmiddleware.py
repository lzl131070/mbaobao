import time

from django.http import HttpResponse
from django.utils.deprecation import  MiddlewareMixin


class Mymiddle(MiddlewareMixin):
    def process_request(self,request):
        t = time.time()
        if request.META['REMOTE_ADDR'] not in ipd:
            ipd[request.META['REMOTE_ADDR']] = t - 1
        if t - ipd[request.META['REMOTE_ADDR']] < 1:

            time.sleep(5)

        ipd[request.META['REMOTE_ADDR']] = t

ipd = {}