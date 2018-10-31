from django.db import models
from tinymce.models import HTMLField
# Create your models here.
class User(models.Model):
    username=models.CharField(max_length=50,unique=True)
    password=models.CharField(max_length=255)
    img=models.CharField(max_length=255,default='')
    token=models.CharField(max_length=256,default='/static/img/index/head.jpeg')


class Img(models.Model):
    num=models.CharField(max_length=20)
    img=models.CharField(max_length=120,unique=True)
    name=models.CharField(max_length=80)
    def __str__(self):
        return self.name


class Goods(models.Model):
    num = models.CharField(max_length=20)
    name = models.CharField(max_length=255)
    price = models.CharField(max_length=50)
    mbbprice = models.CharField(max_length=50)
    unit = models.CharField(max_length=20)
    heading = models.CharField(max_length=255)
    pic1 = models.CharField(max_length=255)
    pic2 = models.CharField(max_length=255,null=True)
    pic3 = models.CharField(max_length=255,null=True)
    def __str__(self):
        return self.name

class Detail(models.Model):
    num = models.CharField(max_length=20)
    name = models.CharField(max_length=255)
    price = models.CharField(max_length=50)
    mbbprice = models.CharField(max_length=50)
    unit = models.CharField(max_length=20)
    heading = models.CharField(max_length=255)
    picnum=models.CharField(max_length=255)
    pic1 = models.CharField(max_length=255)
    pic2 = models.CharField(max_length=255)
    pic3 = models.CharField(max_length=255)
    pic4 = models.CharField(max_length=255)
    pic5 = models.CharField(max_length=255)
    pic6 = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Text(models.Model):
    str=HTMLField()