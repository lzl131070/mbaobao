from django.conf.urls import url, include
from django.contrib import admin

from mbbapp import views

urlpatterns = [
    url('^$',views.index,name='index'),
    url('^login/$',views.login,name='login'),
    url('^register/$', views.register, name='register'),
    url(r'^cart/$', views.cart, name='cart'),
    url(r'^list/$',views.list,name='list'),
    url(r'^detail/(\d+)/$',views.detail,name='detail'),
    url(r'^logout$',views.logout,name='logout'),
    url(r'^uploadhead/$',views.uploadhead,name='uploadhead'),
    url(r'^buy/$',views.buy,name='buy'),
    url(r'^reduce/$',views.reduce,name='reduece'),
    url(r'^checknum/$',views.checknum,name='checknum'),
    url(r'^checkone/$',views.checkone,name='checkone'),
    url(r'^checkall/$',views.checkall,name='checkall'),
    url(r'^adv/$',views.adv,name='adv'),
    url(r'^order/$',views.order,name='order'),
    url(r'^orderdetail/$',views.orderdetail,name='orderdetail'),
    url(r'^getorder/$',views.getorder,name='getorder'),
    url(r'^concer/$',views.concer,name='concer'),
    url(r'^pay/$',views.pay,name='pay'),
    url(r'^notifyurl/$',views.notifyurl,name='notifyurl'),
    url(r'^returnurl/$',views.returnurl,name='returnurl'),
    url(r'^select/$',views.select,name='select'),
    url(r'^selectprice/$',views.selectprice,name='selectprice'),
]
