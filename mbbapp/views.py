import hashlib
import os
import random
import time
import uuid

from django.http import HttpResponse, response, HttpRequest, JsonResponse
from django.shortcuts import render, render_to_response, redirect

# Create your views here.
from mbbapp.models import User, Img, Detail, Cart
from untitled import settings


def index(request):

    detail = Detail.objects.all()
    data=Img.objects.all()

    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
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
    # html=request.COOKIES.get('html')
    # html = html[:3]+':'+html[3:]

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
                user.token=generate_token()  #刷新token 保证安全性
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
    token = request.COOKIES.get('token')
    user = User.objects.filter(token=token).first()
    if request.method=='GET':

        return render(request,'register.html',context={'user':user})
    elif request.method=='POST':
        user=User()
        user.username=request.POST.get('username')
        user.password=genertat_password(request.POST.get('password'))
        user.img = '/static/img/index/head.jpeg'

        user.token=uuid.uuid5(uuid.uuid4(),'register')
        user.save()
        request.session['username']=user.username
        response=redirect('mbb:index')

        response.set_cookie('token',user.token)
        return response

def cart(request):
    token = request.COOKIES.get('token')
    if token:
        user = User.objects.get(token=token)
    else:
        return render(request,'login.html')
   # 非ajax
    # cart_num=[]
    # cart_good=[]
    # for good in Detail.objects.all():
    #     try:
    #         goodnum = good.num
    #         goodcookeis = request.COOKIES.get('good'+str(goodnum))
    #
    #         numcookeis = request.COOKIES.get('num'+str(goodnum))
    #         if numcookeis and goodcookeis:
    #             good.goodnum=numcookeis
    #             cart_good.append(good)
    #
    #             cart_num.append(numcookeis)
    #
    #     except:
    #         pass
    #
    # return render(request, 'cart.html', context={'user': user,'goods':cart_good,'cartnum':cart_num})

    #
    #ajax
    carts = Cart.objects.filter(user=user).exclude(num=0)
    return render(request,'cart.html',context={'carts':carts})

def list(request):
    token = request.COOKIES.get('token')
    user = User.objects.filter(token=token).first()
    return render(request,'list.html',context={'user':user})


def detail(request,num):
    token = request.COOKIES.get('token')
    user = User.objects.filter(token=token).first()
    good=Detail.objects.all()[int(num)-1]

    return render(request,'detail.html',context={'good':good,'user':user})
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


def buy(request):
    token = request.COOKIES.get('token')

    if token:

        goodid=request.GET.get('goodid')
        jsonData = {
            'goodid':goodid,
            'status':1,
        }
        good = Detail.objects.get(num=goodid)

        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).filter(good=good)
        if carts.exists():
            cart = carts.first()
            cart.num +=1
            cart.save()
        else:
            cart = Cart()
            cart.num = 1
            cart.user = user
            cart.good = good
            cart.save()

        return JsonResponse(jsonData)
    else:
        jsonData={
            'status':-1
        }
        return JsonResponse(jsonData)

def reduce(request):
    token = request.COOKIES.get('token')

    goodid = request.GET.get('goodid')
    jsonData = {
        'goodid': goodid,
    }
    good = Detail.objects.get(num=goodid)

    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user).filter(good=good)

    cart = carts.first()
    cart.num -= 1
    cart.save()

    return JsonResponse(jsonData)


def checknum(request):
    num = request.GET.get('num')
    users = User.objects.filter(username=num)
    data={

    }
    if users.exists():
        data['status']=-1
    else:
        data['status']=1
    return JsonResponse(data)