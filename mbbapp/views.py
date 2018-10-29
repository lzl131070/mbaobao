from django.http import HttpResponse,response,HttpRequest
from django.shortcuts import render, render_to_response, redirect

# Create your views here.
from mbbapp.models import User


def index(request):
    return render(request,'index.html')


def login(request):
    if request.method=='GET':
        return render(request, 'login.html')
    elif request.method=='POST':
        username=request.POST.get('username')
        password=request.POST.get('password')
        users=User.objects.filter(username=username)
        if users.count():
            users=User.objects.filter(username=username).filter(password=password)
            if users.count():
                user=users.first()
                response=redirect('mbb:index')
                response.set_cookie('username',username)
                return response
            else:
                num = 2
                return render(request, 'login.html', context={'num': num})
        else:
            num=1
            return render(request,'login.html',context={'num':num})

def register(request):
    if request.method=='GET':
        return render(request,'register.html')
    elif request.method=='POST':
        user=User()
        user.username=request.POST.get('username')
        user.password=request.POST.get('password')
        try:
            user.save()

            response=redirect('mbb:index')
            response.set_cookie('username',user.username)
            return response
        except:

            num=1
            return render(request,'register.html',context={'num':num})
def cart(request):
    return render(request,'cart.html')


def list(request):
    return render(request,'list.html')


def detail(request):
    return render(request,'detail.html')
def logout(request):
    response=redirect('mbb:index')
    response.delete_cookie('username')
    return response