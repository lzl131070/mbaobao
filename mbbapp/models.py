from django.db import models

# Create your models here.
class User(models.Model):
    username=models.CharField(max_length=50,unique=True)
    password=models.CharField(max_length=50)
    token=models.CharField(max_length=256,default='')


class Img(models.Model):
    num=models.CharField(max_length=20)
    img=models.CharField(max_length=120,unique=True)
    name=models.CharField(max_length=80)




