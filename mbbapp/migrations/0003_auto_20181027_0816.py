# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-27 08:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mbbapp', '0002_auto_20181027_0724'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='passwrd',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]
