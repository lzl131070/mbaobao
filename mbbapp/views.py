import hashlib
import os
import random
import time
import uuid

from django.http import HttpResponse,response,HttpRequest
from django.shortcuts import render, render_to_response, redirect

# Create your views here.
from mbbapp.models import User, Img, Detail
from untitled import settings


def index(request):
    token=request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    data=Img.objects.all()

    detail=Detail.objects.all()

    if users.exists():
        user=users.first()
        return render(request,'index.html',context={'user':user,'data':data,'detail':detail})
    else:
        return render(request,'index.html',context={'data':data,'detail':detail})
def genertat_password(password):
    sha = hashlib.sha512()
    sha.update(password.encode('utf-8'))
    return sha.hexdigest()
def generate_token():
    token=str(time.time())+str(random.random)
    md5=hashlib.md5()
    md5.update(token.encode('utf-8'))
    return md5.hexdigest()
def login(request):
    if request.method=='GET':
        return render(request, 'login.html')
    elif request.method=='POST':
        username=request.POST.get('username')
        password=genertat_password(request.POST.get('password'))
        users=User.objects.filter(username=username)
        if users.count():
            users=User.objects.filter(username=username).filter(password=password)
            if users.count():
                user=users.first()
                user.token=generate_token()
                user.save()

                response=redirect('mbb:index')
                request.session['token']=user.token
                print(1)
                response.set_cookie('token',user.token)
                return response
            else:
                num = 2
                print(2)
                return render(request, 'login.html', context={'num': num})
        else:
            num=1
            print(3)
            return render(request,'login.html',context={'num':num})

def register(request):
    if request.method=='GET':
        return render(request,'register.html')
    elif request.method=='POST':
        user=User()
        user.username=request.POST.get('username')
        user.password=genertat_password(request.POST.get('password'))
        try:
            user.token=uuid.uuid5(uuid.uuid4(),'register')
            user.save()
            request.session['username']=user.username
            response=redirect('mbb:index')

            response.set_cookie('token',user.token)
            return response
        except:

            num=1
            return render(request,'register.html',context={'num':num})
def cart(request):

    return render(request,'cart.html')


def list(request):
    return render(request,'list.html')


def detail(request,num):
    good=Detail.objects.all()[int(num)-1]

    return render(request,'detail.html',context={'good':good})
def logout(request):
    response=redirect('mbb:index')
    response.delete_cookie('token')
    return response

def uploadhead(request):
    token = request.COOKIES.get('token')
    user = User.objects.filter(token=token).first()
    if request.method=='GET':
        return render(request,'uploadhead.html',context={'user':user})
    elif request.method=='POST':
        file = request.FILES.get('heading')
        filename = str(random.randrange(1,100)) + '-' + file.name
        filepath = os.path.join(settings.MEDIA_ROOT,filename)
        with open(filepath,'wb') as fp:
            for item in file.chunks():
                fp.write(item)

        response = redirect('mbb:index')
        a=filepath.split('untitled')
        user.img=a[1]
        user.save()
        print(filename)
        return response