from django.db import models
import json
import pymysql
db=pymysql.connect('localhost','root','root','mbaobao')
cursor=db.cursor()
# Create your models here.
class User(models.Model):
    username=models.CharField(max_length=50,unique=True)
    password=models.CharField(max_length=50)
    token=models.CharField(max_length=256,default='')


class Img(models.Model):
    num=models.CharField(max_length=20)
    img=models.CharField(max_length=120,unique=True)
    name=models.CharField(max_length=80)


for i in range(5):
    i+=1
    if i == 1:
        i=''

    pash='static/json/floor'+str(i)+'-lunbo.json'

    a=open(pash,'r',encoding='utf8')
    b=a.read()
    b=json.loads(b)
    print(b)



