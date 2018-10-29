from django.conf.urls import url, include
from django.contrib import admin

from mbbapp import views

urlpatterns = [
    url('^$',views.index,name='index'),
    url('^login/$',views.login,name='login'),
    url('^register/$', views.register, name='register'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^list/$',views.list,name='list'),
    url(r'^detail/$',views.detail,name='detail'),
    url(r'^logout$',views.logout,name='logout')
]
