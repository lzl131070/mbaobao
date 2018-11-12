import hashlib
import os
import random
import time
import uuid

from django.http import HttpResponse, response, HttpRequest, JsonResponse
from django.shortcuts import render, render_to_response, redirect

# Create your views here.
from mbbapp.alipay import alipay_mbb
from mbbapp.models import User, Img, Detail, Cart, Order, OrderDetail
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
            cart.isselect = True
            cart.save()
        else:
            cart = Cart()
            cart.num = 1
            cart.user = user
            cart.good = good
            cart.isselect = True
            cart.save()

        return JsonResponse(jsonData)
    else:
        jsonData={
            'status':-1
        }
        return JsonResponse(jsonData)

def reduce(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    goodid = request.GET.get('goodid')
    jsonData = {
        'goodid': goodid,
    }
    good = Detail.objects.get(num=goodid)


    carts = Cart.objects.filter(user=user).filter(good=good)

    cart = carts.first()
    cart.num -= 1
    cart.save()

    return JsonResponse(jsonData)

# 验证注册账号
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


def checkone(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    isid = request.GET.get('isid')
    cart = Cart.objects.get(pk=isid,user=user)

    cart.isselect = not cart.isselect
    cart.save()
    data={
        'status':1,
        'isselect':cart.isselect,

    }
    return JsonResponse(data)


def checkall(request):
    isselect = request.GET.get('isselect')
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    if isselect=='false':
        isselect='true'
        for cart in carts:
            cart.isselect=True
            cart.save()
    else:
        isselect='false'
        for cart in carts:
            cart.isselect=False
            cart.save()

    data={
        'status':1,
        'isselect':isselect,
    }
    return JsonResponse(data)


def adv(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user).filter(isselect=True)

    return render(request,'adv.html')


def order(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    sheng = request.GET.get('sheng')
    shi = request.GET.get('shi')
    xian = request.GET.get('xian')
    detail = request.GET.get('detail')
    adv = sheng+'#'+shi+'#'+xian+'#'+detail
    print(adv)
    order = Order()
    order.user=user
    order.adv=adv
    order.ordernum=str(time.time())+str(random.randrange(10000000,99999999))
    order.save()
    carts = Cart.objects.filter(user=user,isselect=True)


    for cart in carts:
        orderdetail = OrderDetail()
        orderdetail.ordernum = order
        orderdetail.num=cart.num
        orderdetail.good=cart.good
        orderdetail.save()
        cart.delete()
    return JsonResponse({'status':1})


def orderdetail(request):
    token = request.COOKIES.get('token')
    try:
        user = User.objects.get(token=token)
        orders = Order.objects.filter(user=user)
        return render(request,'myorder.html',context={'orders':orders})
    except:
        return render(request,'login.html')

def getorder(request):

    isid = request.GET.get('isid')
    # isid = int(isid)
    order = Order.objects.get(pk=isid)
    orderdetails = OrderDetail.objects.filter(ordernum=order)
    listgood=[]
    for orderdetail in orderdetails:
        good = orderdetail.good
        num = orderdetail.num
        img = good.heading
        price = good.price
        name = good.name
        list=[name,img,price,num]
        listgood.append(list)
    return JsonResponse({'status':1,'listgood':listgood})

def notifyurl(request):
    print(' xxx  订单支付成功，请发货')
    print(request.GET.get('subject'))
    return JsonResponse({'msg':'success'})


def returnurl(request):
    num = request.COOKIES.get('num')
    order = Order.objects.get(ordernum=num)
    order.status=1
    order.save()
    print('xxx 订单支付成功，进行页面跳转')

    return HttpResponse('进行页面跳转，回到mbb.....')

def pay(request):
    num = request.GET.get('num')
    response = redirect('mbb:returnurl')
    response.set_cookie('num',num)

    print(num)
    # 支付url
    url = alipay_mbb.direct_pay(
        subject='测试订单 --- iphone X',
        out_trade_no=num,
        total_amount=9.9,  # 付款金额
        return_url='http://39.105.175.192:7000/returnurl/'
    )

    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipay_url': alipay_url})
def concer(request):
    isid = request.GET.get('isid')
    # isid = int(isid)
    print(isid)
    order = Order.objects.get(pk=isid)
    orderdetails = OrderDetail.objects.filter(ordernum=order)
    for i in orderdetails:

        i.delete()
    order.delete()
    return JsonResponse({'status':1})