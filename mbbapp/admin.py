from django.contrib import admin

# Register your models here.
from mbbapp.models import Img, Goods, Detail, Text

admin.site.register(Img)
admin.site.register(Goods)
admin.site.register(Detail)
admin.site.register(Text)